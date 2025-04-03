import SwiftUI
import FirebaseAuth

struct SignIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var navigateToSearch = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    // Header with background image
                    ZStack {
                        Image("background")
                            .resizable()
                            .scaledToFill()
                            .frame(height: geometry.size.height / 3)
                            .clipped()

                        VStack {
                            Text("VolunTree")
                                .font(.custom("Pacifico", size: 47))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }

                    // Login form
                    VStack(spacing: 20) {
                        Spacer().frame(height: 20)
                        
                        Text("Welcome Back")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.darkGreen)
                                                
                        Text("Login to your account")
                            .font(.subheadline)
                            .foregroundColor(Color.darkGreen)

                        // Email field
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.lightGray)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)

                        // Password field
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.lightGray)
                            .cornerRadius(10)
                            .padding(.horizontal)

                        Spacer().frame(height: 20)

                        // Error message
                        if let errorMessage = errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .padding(.horizontal)
                        }

                        // Login button
                        Button(action: signInUser) {
                            if isLoading {
                                ProgressView()
                                    .tint(.white)
                            } else {
                                Text("Login")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.darkGreen)
                                    .cornerRadius(10)
                            }
                        }
                        .disabled(isLoading)
                        .padding(.horizontal)

                        Spacer()

                        // Sign up link
                        HStack {
                            Text("Don't Have Account?")
                                .foregroundColor(.gray)
                            NavigationLink(destination: Register()) {
                                Text("Sign up")
                                    .foregroundColor(Color.darkGreen)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding()
                    
                    // Hidden navigation link
                    NavigationLink(destination: VolunteerView(), isActive: $navigateToSearch) {
                        EmptyView()
                    }
                    .hidden()
                }
                .background(Color.lightGray)
                .edgesIgnoringSafeArea(.all)
            }
            .navigationBarHidden(true)
        }
    }
    
    private func signInUser() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both email and password"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            isLoading = false
            
            if let error = error {
                errorMessage = "Login failed. Please check your credentials and try again."
                print("Login error: \(error.localizedDescription)")
            } else {
                navigateToSearch = true
            }
        }
    }
}

#Preview {
    SignIn()
}
