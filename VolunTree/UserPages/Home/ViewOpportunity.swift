import SwiftUI
import FirebaseAuth
import FirebaseFirestore

/// Shows more details regarding a volunteer opportunity and allows the user to apply to it.
///
/// Parameters:
/// - opportunity: This is of type "VolunteeringOpportunity", which has all of the opportunity information.
///
/// Returns:
/// - A view that shows the volunteer opportunity details and allows the user to submit an application.
struct ViewOpportunity: View {
    /// This is of type "VolunteeringOpportunity", which has all of the opportunity information.
    let opportunity: VolunteeringOpportunity
    
    @State private var supplementaryMsg: String = ""
    
    /// Used to go back to the home page upon successful submission.
    @Environment(\.presentationMode) var presentationMode // go back to home upon successful submission
    
    /// The view that shows the volunteer opportunity details.
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // opportunity name
                Text(opportunity.name)
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.darkColor)
                
                // opportunity description
                VStack(alignment: .leading, spacing: 2) {
                    Text("Description:")
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundStyle(Color.darkGreen)
                    
                    Text(opportunity.description)
                        .padding(.bottom, 10)
                        .foregroundStyle(Color.darkGreen)
                }
                
                // opportunity address
                VStack(alignment: .leading, spacing: 2) {
                    Text("Address:")
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundStyle(Color.darkGreen)
                    
                    Text(opportunity.address)
                        .padding(.bottom, 10)
                        .foregroundStyle(Color.darkGreen)
                }
                
                // show the volunteering types
                VStack(alignment: .leading, spacing: 0) {
                    Text("Volunteering Types:")
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundStyle(Color.darkGreen)
                    
                    LazyHGrid(rows: [GridItem(.fixed(30))], spacing: 10) {
                        ForEach(opportunity.volunteeringTypes, id: \.self) { type in
                            Text(type)
                                .font(.caption)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(Color.lightGreen)
                                .foregroundStyle(Color.darkColor)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.vertical, 10)
                }
                
                // allow user to send a message in application
                VStack(alignment: .leading, spacing: 4) {
                    Text("Supplementary Message:")
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundStyle(Color.darkGreen)
                    
                    TextField("Enter your message", text: $supplementaryMsg)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(8)
                        .foregroundColor(.darkGreen)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.darkGreen.opacity(0.5), lineWidth: 1)
                        )
                }
                
                Spacer()

                Button(action: submitApplication) {
                    Text("Submit Application")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.darkGreen)
                        .cornerRadius(10)
                }
                .frame(maxWidth: .infinity) // makes button full width inside VStack
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 30)
            .padding(.top, 20)
            .background(Color.background)
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background) // set background color of entire view
        .ignoresSafeArea(edges: .bottom) // to allow scrolling beyond the safe area
    }
    
    
    /// Function that connects to the backend using Firebase to submit the user's application to the organization side.
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
