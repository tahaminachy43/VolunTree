//
//  Register.swift
//  VolunTree
//
//  Created by Tahamina Mostafa chowdhury on 2025-03-05.
//
//
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct Register: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String?
    @State private var isLoading = false                // Occurs when the user has clicked registered briefly
    @State private var isRegistered = false             // User is initially not registered
    @State private var navigateToPreferences = false    // We don't navigate to the sign in page initially
    @State private var userId = ""                      // userId is used to navigate to the preferences page
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Voluntree")
                                .font(.custom("Pacifico", size: 47))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("All Your")
                                .font(.title)
                                .foregroundColor(.white)
                            
                            Text("volunteering")
                                .font(.title)
                                .foregroundColor(.white)
                            
                            Text("needs in one place")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                        
                        VStack(spacing: 20) {
                            Text("Create an account")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.top, 20)
                            
                            TextField("Full Name", text: $fullName)
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal)
                            
                            TextField("Email", text: $email)
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal)
                            
                            SecureField("Password", text: $password)
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal)
                            
                            SecureField("Confirm Password", text: $confirmPassword)
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal)
                            
                            //                          If there is an error
                            if let errorMessage = errorMessage {
                                Text(errorMessage)
                                    .foregroundColor(.red)
                                    .padding(.horizontal)
                            }
                            
                            Button(action: registerNewUser) {
                                if isLoading{
                                    ProgressView()
                                }else{
                                    Text("Register")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.darkColor)
                                        .cornerRadius(10)
                                }
                                
                            }
                            .disabled(isLoading)
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                            
                            HStack {
                                Text("Already Have an Account?")
                                    .foregroundColor(.black)
                                NavigationLink(destination: SignIn()) {
                                    Text("Sign In")
                                        .foregroundColor(Color.darkColor)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(.horizontal)
                        
                        NavigationLink("", destination: UserPreferences(userId: userId, userEmail: email, userPassword: password), isActive: $navigateToPreferences)
                            .hidden()
                    }
                }
            }
        }
    }
    
    func registerNewUser() {
        //  We use the guard statement to transfer control out of scope when certain conditions are not met.
        guard !fullName.isEmpty, !email.isEmpty, !password.isEmpty, password == confirmPassword else {
            errorMessage = "All fields are required and passwords must match."
            return
        }
        
        // Firebase requires password be at least 6 length
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters long."
            return
        }
        
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            isLoading = false
            
            if let error = error {
                errorMessage = error.localizedDescription
                return
            }
            
            if let user = authResult?.user {
                // Save user to firestore database:
                let db = Firestore.firestore()
                let userData: [String: Any] = [
                    "fullName": fullName,
                    "email": email,
                    "bioDescription": "",
                    "hoursGoal": 10,
                    "pfpURL": "",
                    "typePreferences": []
                ]
                
                db.collection("Users").document(user.uid).setData(userData) { error in
                    if let error = error {
                        errorMessage = "Failed to save user: \(error.localizedDescription)"
                    } else {
                        isRegistered = true
                        userId = user.uid
                        navigateToPreferences = true  // Navigate to preferences view once user has successfully registered
                    }
                }
            }
            
        }
    }
    
}

#Preview {
    Register()
}
