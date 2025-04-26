import SwiftUI
import FirebaseAuth
import FirebaseFirestore

/// This is the page where after registering, the user gets to choose the volunteering types that they are interested in.
struct UserPreferences: View {
    // User ID, Email and Password from Register view:
    let userId: String
    let userEmail: String
    let userPassword: String
    
    @State private var volunteeringTypes: [String] = []
    @State private var typesChosen: Set<String> = []   // Set to ensure no duplicates
    @State private var goalHours: String = ""
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var navigateToSearch = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.background
                    .edgesIgnoringSafeArea(.all) // Ensures it covers the entire screen
                
                VStack{
                    
                    // Page Title
                    Text("Preferences")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundStyle(Color.darkGreen)
                    
                    
                    Text("Select what types of volunteering opportunities you are interested in ")
                        .font(.headline)
                        .bold()
                        .padding()
                        .foregroundStyle(Color.darkGreen)
                    
//                  Wrap the List inside a ScrollView and apply background to the ScrollView instead
//                  This avoids the default padding and styling that List applies
                    ScrollView {
                        VStack(spacing: 20) { // Adds spacing between cards
                            ForEach(volunteeringTypes, id: \.self) { type in
                                ZStack {
                                    // Background card color
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white)
                                        .shadow(radius: 3)

                                    HStack {
                                        Text(type)
                                            .foregroundColor(Color.black)
                                            .fontWeight(.bold)
                                            .padding(.leading, 16)
                                        Spacer()
                                        if typesChosen.contains(type) {
                                            Image(systemName: "checkmark.circle.fill")
                                                .foregroundStyle(Color.darkGreen)
                                        }
                                    }
                                    .padding()
                                }
                                .frame(maxWidth: .infinity, minHeight: 50) // Ensures tappable area extends
                                .padding(.horizontal) // Keeps margins consistent
                                .onTapGesture {
                                    toggleSelection(type) // Now the whole card is tappable!
                                }
                            }
                        }
                        .padding(.top, 20) // Top padding to avoid tight spacing
                    }
                    .background(Color.background) // Set full background

                    Text("How many hours do you want to volunteer for?")
                        .font(.subheadline)
                        .bold()
                        .padding()
                        .foregroundStyle(Color.darkGreen)
                    
                    TextField("E.g. 20", text: $goalHours)
                        .font(.headline)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                    
                    Button(action: updateUserPreferences) {
                        if isLoading {
                            ProgressView()
                        } else {
                            Text("Save and go to Home")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.darkGreen)
                                .cornerRadius(10)
                        }
                    }
                    .disabled(isLoading)
                    .padding()
                    
                    NavigationLink("", destination: VolunteerView(), isActive: $navigateToSearch)
                        .hidden()
                    
                }
                .onAppear(perform: fetchVolunteeringTypes)
                .padding()
                .navigationBarBackButtonHidden(true) // Don't show on top left
            }

        }
    }
    
    // Fetch available volunteering types from Firebase
    private func fetchVolunteeringTypes() {
        let db = Firestore.firestore()
        db.collection("VolunteeringType").getDocuments { snapshot, error in
            if let error = error {
                errorMessage = "Error loading data: \(error.localizedDescription)"
                return
            }
            
            volunteeringTypes = snapshot?.documents.compactMap { $0["name"] as? String } ?? []
        }
    }
    
    // Toggle selection of volunteering types
    private func toggleSelection(_ type: String) {
        if typesChosen.contains(type) {
            typesChosen.remove(type)
        } else {
            typesChosen.insert(type)
        }
    }
    
    // Save preferences and sign in user
    private func updateUserPreferences() {
        guard let hoursGoal = Int(goalHours), hoursGoal > 0 else {
            errorMessage = "Please enter a valid number for goal hours."
            return
        }

        isLoading = true
        let db = Firestore.firestore()
        let preferencesArray = Array(typesChosen)
        
        // Reference to the specific user document
        let userRef = db.collection("Users").document(userId)
        
    
        let updateData: [String: Any] = [
              "typePreferences": preferencesArray,
              "hoursGoal": hoursGoal
          ]
        
        db.collection("Users").document(userId).updateData([
            "typePreferences": preferencesArray,
            "hoursGoal": hoursGoal
        ]) { error in
            isLoading = false
            
            if let error = error {
                errorMessage = "Failed to save preferences: \(error.localizedDescription)"
            } else {
                self.signInUser()
            }
        }
    }
    
    // Automatically sign in the user and navigate to account
    private func signInUser() {
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { result, error in
            if let error = error {
                errorMessage = "Sign-in failed: \(error.localizedDescription)"
            } else {
                navigateToSearch = true
            }
        }
    }
}

// Used dummy profile jeremiah to view and edit page
#Preview {
    UserPreferences(userId: "MnNAS7KPEgY2hOEdy6XkGwVWzue2", userEmail: "Jeremiah@gmail.com"
, userPassword: "123456")
}



