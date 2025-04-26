import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

/// Data for each request card.
///
/// Parameters:
/// - id: The ID.
/// - pfpURL: URL link to the profile picture.
/// - oppName: The opportunity name.
/// - userName: The user's name.
/// - applicationId: The application ID.
struct VolunteerRequest: Identifiable {
    let id: String
    let pfpURL: String
    let oppName: String
    let userName: String
    let applicationId: String  // used by ApplicationPage
}

/// The page that shows the applicants of volunteering positions at the organization.
///
/// > Note: This needs to be dark-mode friendly.
///
/// Returns:
/// - The view that shows a list of all the applicants.
struct VolunteerRequests: View {
    @State private var requests: [VolunteerRequest] = []
    @State private var navigateToProfile = false
    @State private var selectedRequest: VolunteerRequest?
    
    // Current organization ID:
    @State private var orgId: String = ""
    
    /// The view that shows a list of all the applicants.
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()
                
                VStack (spacing: 30){
                    Text("Volunteers requesting to join")
                        .font(.title2)
                        .bold()
                        .padding()
                        .foregroundStyle(Color.darkGreen)
                    
                    // request cards
                    ScrollView {
                        LazyVStack(spacing: 110) {
                            ForEach(requests) { request in
                                VolunteerCard(
                                    position: request.oppName,
                                    name: request.userName,
                                    pfpURL: request.pfpURL,
                                    onButtonTap: {
                                        selectedRequest = request
                                        navigateToProfile = true
                                    }
                                )
                                .padding(.horizontal)
                                
                                // Delete button
    
                            }
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 100)
                        .navigationBarBackButtonHidden(true)
                        
                    }
                    
                    if let request = selectedRequest {
                        NavigationLink(
                            destination: ApplicationPage(position: request.oppName, name: request.userName, applicationId: request.applicationId),
                            isActive: $navigateToProfile,
                            label: { EmptyView() }
                        )
                        .hidden()
                    }
    

                }
                .frame(maxHeight: .infinity, alignment: .top)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onAppear {
            fetchOrgId()
        }
    }
    
    /// Function to fetch the current organization ID from the backend.
    func fetchOrgId() {
        if let currentUserId = Auth.auth().currentUser?.uid {
            orgId = currentUserId
            fetchRequests()
        }
    }
    
    /// Function to fetch the current organization applicants.
    func fetchRequests() {
        let db = Firestore.firestore()
        let requestsRef = db.collection("ApplicationsToJoinVolOpp")
            
        requestsRef.whereField("status", isEqualTo: "pending").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents, error == nil else { return }

            var newRequests: [VolunteerRequest] = []
                
            // Fetch user and opportunity data:
            for doc in documents {
                let data = doc.data()
                    
                guard let userId = data["userId"] as? String,
                        let opportunityId = data["opportunityId"] as? String else { continue }
                    
                // Get user info:
                db.collection("Users").document(userId).getDocument { userDoc, _ in
                    var userName = ""
                    var profileURL = ""
                    
                    if let userData = userDoc?.data() {
                        userName = userData["fullName"] as? String ?? ""
                        profileURL =  userData["pfpURL"] as? String ?? ""
                    }
                    
                    // Get opp info:
                    db.collection("VolunteeringOpportunity").document(opportunityId).getDocument { oppDoc, _ in
                        var opportunityName = ""
                        
                        if let oppData = oppDoc?.data(), oppData["orgId"] as? String == orgId {
                            opportunityName = oppData["name"] as? String ?? ""
                        }
                        
                        // Add request to list once both user and opportunity data are fetched
                        if !opportunityName.isEmpty {
                            let request = VolunteerRequest(
                                id: doc.documentID,
                                pfpURL: profileURL,
                                oppName: opportunityName,
                                userName: userName,
                                applicationId: doc.documentID
                            )
                            newRequests.append(request)
                            
                            DispatchQueue.main.async {
                                self.requests = newRequests
                            }
                        }
                    }
                }
            }
        }
    }

}

#Preview {
    OrganizationView()
}
