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

/// The Volunteer's home page. It greets them, shows them oppportunties based on their preferences, and shows their goal progress.
///
/// Returns:
/// - The Volunteer's home page.
struct HomePage: View {
    @State private var opportunities: [VolunteeringOpportunity] = []
    @State private var fullName: String = ""
    @State private var progress: Double = 0.5

    /// The view for the volunteer's home page.
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
                            .fontWeight(.bold)
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color.darkGreen)
                            .tracking(1.2)
                        
                        Text("Volunteer opportunities you may like:")
                            .font(.subheadline)
                            .foregroundStyle(Color.darkGreen)
                            .italic()
                        
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
                    
                    ProgressCircle(progress: progress)
                        .frame(width: 175, height: 175)

                        
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
    
    /// Function that connects to the backend to fetch username.
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
    
    /// Function that connects to the backend to fetch opportunities.
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
