//
//  ApplicationPage.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-18.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth

struct ApplicationPage: View {
    @State private var supplementaryMessage: String = ""
    @State private var currentStatus: String = "pending"

    var position: String
    var name: String
    var applicationId: String

    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()

                VStack {
                    Text("\(name)'s Application")
                        .font(.title)
                        .bold()
                        .padding()
                        .foregroundStyle(Color.darkGreen)

                    // user profile picture
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundStyle(Color.darkGreen)
                        .font(.system(size: 80))
                        .padding(.bottom, 30)

                    // view profile button
                    Button(action: {
                        print("View profile tapped")
                        // You can implement the action to view the user's profile
                    }) {
                        HStack {
                            Image(systemName: "play.fill")
                                .foregroundColor(Color.darkGreen)
                                .font(.system(size: 15))
                            Text("VIEW PROFILE")
                                .bold()
                                .foregroundColor(Color.darkGreen)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(Color.lightGreen)
                    .cornerRadius(500)
                    .fixedSize()

                    // position name
                    HStack {
                        Spacer()
                        Text("Position: \(position)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                            .foregroundColor(Color.darkGreen)
                            .fontWeight(.bold)
                    }
                    .padding(.top, 20)


                    // Supplementary message from applicant user
                    HStack {
                        Spacer()
                        Text("Supplementary Message:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                            .foregroundColor(Color.darkGreen)
                            .fontWeight(.bold)
                    }
                    .padding(.top, 20)
                    
                    Text(supplementaryMessage)
                        .padding()
                        .frame(height: 220)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 15)
                        .shadow(radius: 5)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)                    // Allow text to wrap
                        .padding(.top, 20)

                    // Spacer to push buttons to the bottom
                    Spacer()

                    // Approve or Reject buttons
                    HStack {
                        Button(action: {
                            updateApplicationStatus(status: "approved")
                        }) {
                            HStack() {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                Text("APPROVE")
                                    .bold()
                                    .foregroundColor(Color.white)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color.darkGreen)
                        .cornerRadius(5)
                        .fixedSize()

                        Button(action: {
                            updateApplicationStatus(status: "rejected")
                        }) {
                            HStack() {
                                Image(systemName: "x.square")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                Text("REJECT")
                                    .bold()
                                    .foregroundColor(Color.white)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color.mediumGreen)
                        .cornerRadius(5)
                    }
                    .padding(.bottom, 20)
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .onAppear {
                fetchApplicationDetails()
            }
        }
    }

    // Function to fetch application details, including the supplementary message
    func fetchApplicationDetails() {
        let db = Firestore.firestore()
        db.collection("ApplicationsToJoinVolOpp").document(applicationId).getDocument { snapshot, error in
            if let error = error {
                print("Error fetching application details: \(error.localizedDescription)")
                return
            }

            guard let data = snapshot?.data() else { return }

            supplementaryMessage = data["supplementaryMessage"] as? String ?? ""
            currentStatus = data["status"] as? String ?? "pending"
        }
    }

    // Function to update the application status (approve or reject)
    func updateApplicationStatus(status: String) {
        let db = Firestore.firestore()
        let applicationRef = db.collection("ApplicationsToJoinVolOpp").document(applicationId)

        applicationRef.updateData([
            "status": status
        ]) { error in
            if let error = error {
                print("Error updating status: \(error.localizedDescription)")
            } else {
                print("Successfully updated status to \(status)")
                currentStatus = status
            }
        }
    }
}

#Preview {
    OrganizationView()
}
