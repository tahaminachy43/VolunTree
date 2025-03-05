//
//  SignIn.swift
//  VolunTree
//
//  Created by Tahamina Mostafa chowdhury on 2025-03-03.
//


// Have to create a Forgot password page for this
// have to add functionality to login when login button is clicked and it should direct it to homepage.
import SwiftUI

struct SignIn: View {
    @State private var fullName: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    ZStack {
                        Image("background")
                            .resizable()
                            .scaledToFill()
                            .frame(height: geometry.size.height / 3)
                            .clipped()

                        VStack {
                            Text("VolunTree")
                                .font(.custom("Pacifico", size: 47))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }

                    VStack(spacing: 20) {
                        Spacer()
                            .frame(height: 20)
                        
                        Text("Welcome Back")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.darkColor)
                                                
                        Text("Login to your account")
                            .font(.subheadline)
                            .foregroundColor(Color.darkColor)

                        TextField("Full Name", text: $fullName)
                            .padding()
                            .background(Color.lightGray)
                            .cornerRadius(10)
                            .padding(.horizontal)

                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.lightGray)
                            .cornerRadius(10)
                            .padding(.horizontal)

                        HStack {
                            Spacer()
                            NavigationLink(destination: ForgotPassword()) {
                                Text("Forgot Password?")
                                    .font(.subheadline)
                                    .foregroundColor(Color.darkColor)
                            }
                        }
                        .padding(.horizontal)

                        Spacer()
                            .frame(height: 20)

                        Button(action: {
                            print("Login tapped")
//                            LOGIN FUNCTIONALITY AND NAVIGATION REQUIRED
                        }) {
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.darkColor)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)

                        Spacer()

                        HStack {
                            Text("Don't Have Account?")
                                .foregroundColor(.gray)
                            NavigationLink(destination: Register()) {
                                Text("Sign up")
                                    .foregroundColor(Color.darkColor)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding()
                }
                .background(Color(Color.lightGray))
                .edgesIgnoringSafeArea(.all)
            }
            .navigationTitle("Sign In")
            #if os(iOS)
            .navigationBarHidden(true)
            #endif
        }
    }
}

struct ForgotPassword: View {
    var body: some View {
        VStack {
            Text("Forgot Password Page")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("Forgot Password")
        #if os(iOS)
        .navigationBarHidden(true)
        #endif
    }
}

#Preview {
    SignIn()
}
