//
//  Profile.swift
//  VolunTree
//
//  Created by Savitur Maharaj  on 2025-03-18.
//

import SwiftUI
import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

struct OrganizationProfile: View {
    @State private var orgName: String = "Organization Name"
    
//  Pfp variables
    @State private var pfp: Image? = Image(systemName: "person.crop.circle")
    @State private var isImagePickerDisplayed: Bool = false
    @State private var selectedImg: UIImage? = nil
    
//  Description variables
    @State private var description: String = "Please enter your organization's description here..."
    @State private var descriptionBeingEdited: String = ""
    @State private var isEditing: Bool = false
    
    @State private var opportunities: [String] = []
    
    @State private var fetchedOrgId: String = "" // For passing to the AddOpportunityView
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()
                
                VStack (spacing: 30){
//                  Page Title
                    Text(orgName)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundStyle(Color.darkGreen)
                
                    
//                  Orgnization Profile Picture
                    VStack{
                        pfp?
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        Button(action: {
                            isImagePickerDisplayed.toggle()
                        }){
                            Text("Change Picture")
                                .font(.subheadline)
                                .foregroundColor(Color.darkGreen)
                        }
                        .padding(.top, 8)
                        .sheet(isPresented: $isImagePickerDisplayed){
                            ImagePicker(selectedImage: $selectedImg)
                        }
                        .onChange(of: selectedImg){newImage in
                            if let selectedImg = newImage {
                                pfp = Image(uiImage: selectedImg)
//                              Send new image to API
                                updatePfpAPI(image: selectedImg)
                            }
                            
                        }
                    }
                    
                    
//                  Description
                    VStack{
                        if isEditing{
                            TextEditor(text: $descriptionBeingEdited)
                                .frame(height: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .background(Color.background)
                            
                            Button(action: {
                                isEditing.toggle()
//                              Send new decsription to API
                                updateDescriptionAPI(description: descriptionBeingEdited)
                                description = descriptionBeingEdited
                            }){
                                Text("Finish Editing")
                                    .font(.subheadline)
                                    .foregroundColor(Color.darkGreen)
                            }
                        }else{
                            Text(description)
                                .font(.body)
                                .padding()
                            
                            Button(action: {
                                isEditing.toggle()
                                descriptionBeingEdited = description
                            }){
                                Image(systemName: "pencil")
                                    .foregroundColor(Color.darkGreen)
                            }
                        }
                    }
                    
//                  Opportunities
                    VStack{
                        HStack {
                            Spacer()
                            Text("Volunteering Opportunities")
                                .font(.title2)
                                .bold()
                            NavigationLink(destination: AddOpportunity(orgId: fetchedOrgId)) {
                                Image(systemName: "plus.circle")
                                    .font(.title)
                                    .foregroundColor(Color.darkGreen)
                            }
                            .padding()
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        ScrollView{
                            VStack(spacing: 10){
                                ForEach(opportunities, id: \.self){opportunity in
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.green.opacity(0.25))
                                            .frame(height: 30)
                                        Text(opportunity)
                                            .font(.title3)
                                            .foregroundColor(.black)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
//          When the view is initially loaded, call api to get pfp, description and opportunities
            .onAppear{
                fetchNameAndDescription()
                fetchPfp()
                fetchOpportunities()
            }
        }
    }
    
//  API calls
    func fetchPfp() {
        guard let orgId = Auth.auth().currentUser?.uid else {
            print("No org is currently logged in.")
            return
        }

        let db = Firestore.firestore()
        let orgRef = db.collection("Organization").document(orgId)

        orgRef.getDocument { document, error in
            if let error = error {
                print("Error fetching org profile picture URL: \(error.localizedDescription)")
            } else if let document = document, document.exists {
                // Fetch the pfpURL from the Firestore document
                if let pfpURLString = document.get("pfpURL") as? String, !pfpURLString.isEmpty {
                    if let url = URL(string: pfpURLString) {
                        // Fetch the image from the URL
                        URLSession.shared.dataTask(with: url) { data, response, error in
                            if let error = error {
                                print("Error fetching profile picture: \(error.localizedDescription)")
                            } else if let data = data, let uiImage = UIImage(data: data) {
                                // Update the profile picture state on the main thread
                                DispatchQueue.main.async {
                                    pfp = Image(uiImage: uiImage)
                                }
                            }
                        }.resume()
                    }
                } else {
                    print("No pfpURL found for org.")
                }
            } else {
                print("Org document does not exist.")
            }
        }
    }



    func fetchNameAndDescription() {
        guard let orgId = Auth.auth().currentUser?.uid else {
            print("No org is currently logged in")
            return
        }

        fetchedOrgId = orgId
        
        let db = Firestore.firestore()
        let orgRef = db.collection("Organization").document(orgId)

        orgRef.getDocument { document, error in
            if let error = error {
                print("Error fetching name or description: \(error.localizedDescription)")
            } else if let document = document, document.exists {
                orgName = document.get("name") as? String ?? "No name available."
                description = document.get("description") as? String ?? "No description available."
            }
        }
    }

    
    func fetchOpportunities() {
        guard let orgId = Auth.auth().currentUser?.uid else {
            print("No org is currently logged in.")
            return
        }

        let db = Firestore.firestore()
        let opportunitiesRef = db.collection("VolunteeringOpportunity")
        
        opportunitiesRef.whereField("orgId", isEqualTo: orgId).getDocuments { querySnapshot, error in
            if let error = error {
                print("Error fetching opportunities: \(error.localizedDescription)")
            } else {
                // Remove items from current list:
                opportunities.removeAll()
                
                for document in querySnapshot!.documents {
                    // Extract 'name' from each opportunity document
                    if let opportunityName = document.get("name") as? String {
                        opportunities.append(opportunityName)
                    }
                }
            }
        }
    }

    
    func updatePfpAPI(image: UIImage){
        
    }
    
    func updateDescriptionAPI(description: String){

    }
}

// Image Picker using UIKit (Wrapped for SwiftUI)
struct ImagePicker: View {
    @Binding var selectedImage: UIImage?
    
    var body: some View {
        ImagePickerController(selectedImage: $selectedImage)
    }
}

struct ImagePickerController: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerController
        
        init(parent: ImagePickerController) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

#Preview {
    Starter()
}
