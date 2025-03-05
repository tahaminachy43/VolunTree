//
//  Register.swift
//  VolunTree
//
//  Created by Tahamina Mostafa chowdhury on 2025-03-05.
//
// have to add functionality when register button is clicked 
import SwiftUI

struct Register: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        NavigationView {
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

                            Button(action: {
                                print("Register tapped")
                            }) {
                                Text("Register")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.darkColor)
                                    .cornerRadius(10)
                            }
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
                    }
                }
            }
        }
    }
}

#Preview {
    Register()
}
