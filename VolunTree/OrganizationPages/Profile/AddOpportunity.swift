import SwiftUI
import Firebase
import MapKit

/// Categories that volunteering opportunities can be in.
struct VolunteeringType: Identifiable {
    var id: String
    var name: String
}

/// View to add a volunteer opportunity. This is in the organization side.
///
/// Parameters:
/// - orgID: The organization's ID.
///
/// Returns:
/// - The view that the organization can use to add opportunities.
struct AddOpportunity: View {
    var orgId: String   /// Passed from OrganizationProfile()
    
    @State private var name: String = ""
    @State private var selectedTypes: [String] = []                     // Types to be used by users in filtering
    @State private var volunteeringTypes: [VolunteeringType] = []       // Name of Volunteering Types
    @State private var description: String = ""                         // Small description of the opp
    @State private var address: String = ""                             // Address of opp compatible with MapKit
    @State private var showAlert = false                                // Show popup initially is false
    @State private var alertMessage = ""
    @Environment(\.presentationMode) var presentationMode
    
    /// The view that the organization can use to add opportunities.
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    Text("Add Opportunity")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundStyle(Color.darkGreen)


                    HStack {
                        Text("Name: ")
                            .frame(width: 80, alignment: .leading)
                            .foregroundStyle(Color.darkGreen)
                        TextField("Enter name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(4)
                            .background(Color.white)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.darkGreen, lineWidth: 1))
                    }

                    VStack(alignment: .leading) {
                        Text("Select what categories this opportunity fits into")
                            .foregroundStyle(Color.darkGreen)
                        Menu {
                            ForEach(volunteeringTypes) { type in
                                Button(action: {
                                    toggleTypeSelection(type.name)
                                }) {
                                    HStack {
                                        Text(type.name)
                                        Spacer()
                                        if selectedTypes.contains(type.name) {
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                }
                            }
                        } label: {
                            HStack {
                                Text(selectedTypes.isEmpty ? "Select types" : selectedTypes.joined(separator: ", "))
                                           .foregroundColor(selectedTypes.isEmpty ? .gray : .primary)
                                Spacer()
                                Image(systemName: "chevron.down")
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                        }
                    }

                    VStack(alignment: .leading) {
                        Text("Description:")
                            .foregroundStyle(Color.darkGreen)
                        TextEditor(text: $description)
                            .frame(height: 140)
                            .padding(8)
                            .background(Color.white)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.darkGreen, lineWidth: 1))
                    }

                    VStack(alignment: .leading) {
                        Text("Address:")
                            .foregroundStyle(Color.darkGreen)
                        TextField("Enter address", text: $address)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(4)
                            .background(Color.white)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.darkGreen, lineWidth: 1))
                    }

                    Button(action: createOpp) {
                        Text("Create Opportunity")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.darkGreen)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .fontWeight(.bold)
                    }
                    .padding(.top)
                }
                .padding()
            }
            .background(Color(Color.background).ignoresSafeArea())
            .navigationBarHidden(true)
            .onAppear(perform: fetchVolunteeringTypes)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    /// Function used in selecting types:
    func toggleTypeSelection(_ type: String) {
        if selectedTypes.contains(type) {
            selectedTypes.removeAll { $0 == type }
        } else {
            selectedTypes.append(type)
        }
    }
    
    /// Function to fetch types from API:
    func fetchVolunteeringTypes() {
        let db = Firestore.firestore()
        db.collection("VolunteeringType").getDocuments { snapshot, error in
            if let error = error {
                alertMessage = "Volunteering types could not be reached. Please try again later."
                showAlert = true
                return
            }
            volunteeringTypes = snapshot?.documents.compactMap {
                let data = $0.data()
                if let name = data["name"] as? String {
                    return VolunteeringType(id: $0.documentID, name: name)
                }
                return nil
            } ?? []
        }
    }
    
    /// Function to make opportunity:
    func createOpp() {
        // Ensure all fields are filled:
        guard !name.isEmpty, !description.isEmpty, !address.isEmpty, !selectedTypes.isEmpty else {
            alertMessage = "Please fill all fields."
            showAlert = true
            return
        }

        // Ensure address is compatible with MapKit (this was taken from stackoverflow):
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            guard let _ = placemarks?.first, error == nil else {
                alertMessage = "Please enter valid address."
                showAlert = true
                return
            }

            let db = Firestore.firestore()
            let newOpp: [String: Any] = [
                "name": name,
                "description": description,
                "address": address,
                "orgId": orgId,                             // Passed from OrgProfile view
                "volunteeringTypes": selectedTypes
            ]

            db.collection("VolunteeringOpportunity").addDocument(data: newOpp) { error in
                if let error = error {
                    // Failure
                    alertMessage = "Opportunity could not be created. Please try again later."
                    showAlert = true
                } else {
                    // Success
                    alertMessage = "Opportunity was created successfully!"
                    showAlert = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    OrganizationView()
}
