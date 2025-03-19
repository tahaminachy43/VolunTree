//
//  Profile.swift
//  VolunTree
//
//  Created by Savitur Maharaj  on 2025-03-18.
//

import SwiftUI
import UIKit

struct OrganizationProfile: View {
//  Pfp variables
    @State private var pfp: Image? = Image(systemName: "person.crop.circle")
    @State private var isImagePickerDisplayed: Bool = false
    @State private var selectedImg: UIImage? = nil
    
//  Description variables
    @State private var description: String = "Please enter your organization's description here..."
    @State private var descriptionBeingEdited: String = ""
    @State private var isEditing: Bool = false
    
    @State private var opportunities: [String] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()
                
                VStack (spacing: 30){
//                  Page Title
                    Text("Organization Name")
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
                            NavigationLink(destination: AddOpportunity()) {
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
                fetchPfp()
                fetchDescription()
                fetchOpportunities()
            }
        }
    }
    
//  API calls
    func fetchPfp(){
        
    }
    
    func fetchDescription(){
        
    }
    
    func fetchOpportunities(){
        opportunities = ["Hospice Care", "City cleanup", "Origami at the Children's Hospital"]
    }
    
    func updatePfpAPI(image: UIImage){
        
    }
    
    func updateDescriptionAPI(description: String){

    }
}

#Preview {
    OrganizationView()
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
