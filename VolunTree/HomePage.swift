//
//  HomePage.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-03.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

// Structure in database:
struct VolunteeringOpportunity: Identifiable {
    var id: String                      // id of document in collection
    var orgId: String
    var name: String
    var description: String
    var address: String
    var volunteeringTypes: [String]
}

struct HomePage: View {
    @State private var opportunities: [VolunteeringOpportunity] = []
    @State private var fullName: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                // Set the background color of the entire view
                Color(Color.background)
                    .ignoresSafeArea() // Ensures the background color covers the entire screen
                
                VStack (spacing: 10) {
                    Text("VolunTree")
                        .font(.custom("Pacifico", size: 40))
                        .font(.largeTitle)
                        .foregroundStyle(Color.darkGreen)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    
                    VStack(alignment: .leading, spacing: 16){
                        Text("Hi, \(fullName.isEmpty ? "User" : fullName)!")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color.darkGreen)
                        
                        Text("Volunteer Opportunities you may like:")
                            .font(.subheadline)
                            .foregroundStyle(Color.darkGreen)
                        
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 15) {
                                ForEach(opportunities) { opp in
                                    NavigationLink(destination: ViewOpportunity(opportunity: opp)) {
                                        OpportunityCard(opportunity: opp)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 10)
                    
                    Spacer()
                    
                    ProgressCircle(progress: 0.25)
                        .frame(width: 250, height: 250)
                        
                    Spacer()
                    
                    Text("Volunteering Hours Goal Progress")
                        .foregroundStyle(Color.darkGreen)
                        .italic()
                    
                    Spacer()
                    // NavigationBar() if needed
                        //.frame(maxWidth: .infinity)
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            fetchUserName()
            fetchOpportunities()
        }
    }
    
    func fetchUserName() {
        // Get user id:
        guard let userId = Auth.auth().currentUser?.uid else {
                print("No user signed in")
                return
            }
        
        // Get username:
        let db = Firestore.firestore()
        db.collection("Users").document(userId).getDocument { snapshot, error in
            guard let document = snapshot, error == nil else {
                print("There was an error fetching the user's name.")
                return
            }
            fullName = document.data()?["fullName"] as? String ?? ""
        }
    }
    
    func fetchOpportunities() {
        let db = Firestore.firestore()
        db.collection("VolunteeringOpportunity").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents, error == nil else {
                print("There was an error fetching the opportunities list")
                return
            }

            opportunities = documents.compactMap { doc in
                let data = doc.data()
                return VolunteeringOpportunity(
                    id: doc.documentID,
                    orgId: data["orgId"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    description: data["description"] as? String ?? "",
                    address: data["address"] as? String ?? "",
                    volunteeringTypes: data["volunteeringTypes"] as? [String] ?? []
                )
            }
        }
    }
}

#Preview {
    VolunteerView()
}
