//
//  ViewOpportunity.swift
//  VolunTree
//
//  Created by Savitur Maharaj  on 2025-04-08.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ViewOpportunity: View {
    let opportunity: VolunteeringOpportunity
    @State private var supplementaryMsg: String = ""
    @Environment(\.presentationMode) var presentationMode // go back to home upon successful submission
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(opportunity.name)
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.darkColor)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Description:")
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundStyle(Color.darkGreen)
                    
                    Text(opportunity.description)
                        .padding(.bottom, 10)
                        .foregroundStyle(Color.darkGreen)
                }
                
                
                Text("Address:")
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundStyle(Color.darkGreen)
                
                Text(opportunity.address)
                    .padding(.bottom, 10)
                
                Text("Volunteering Types:")
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundStyle(Color.darkGreen)

                LazyHGrid(rows: [GridItem(.fixed(30))], spacing: 10) {
                    ForEach(opportunity.volunteeringTypes, id: \.self) { type in
                        Text(type)
                            .font(.caption)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Color.lightGreen)
                            .cornerRadius(10)
                    }
                }
                .padding(.vertical, 10)
                
                Text("Supplementary Message:")
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundStyle(Color.darkGreen)
                
                TextField("Enter your message", text: $supplementaryMsg)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 20)
                
                Spacer() // This helps center the button

                Button(action: submitApplication) {
                    Text("Submit Application")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.darkGreen)
                        .cornerRadius(10)
                }
                .frame(maxWidth: .infinity) // Makes button full width inside VStack
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 30)
            .padding(.top, 20) // Add padding at the top to avoid content being too high
            .background(Color(Color.background)) // Set background color of entire view
            .cornerRadius(10) // Optional: for rounded corners on the entire content view
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Take up the full height
        .background(Color(Color.background)) // Set background color of entire view
        .ignoresSafeArea(edges: .bottom) // To allow scrolling beyond the safe area if needed
    }
    
    func submitApplication() {
        let db = Firestore.firestore()
        guard let userId = Auth.auth().currentUser?.uid else { return }

        db.collection("ApplicationsToJoinVolOpp").addDocument(data: [
            "opportunityId": opportunity.id,
            "status": "pending", // Default status
            "supplementaryMessage": supplementaryMsg,
            "userId": userId
        ]) { error in
            if let error = error {
                print("Application could not be submitted. Please try again later. Error: \(error.localizedDescription)")
            } else {
                print("Application submitted successfully!")
                
                // Navigate back to the Home Page after submission
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

#Preview {
    VolunteerView()
}
