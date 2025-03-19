//
//  Starter.swift
//  VolunTree
//
//  Created by Tahamina Mostafa chowdhury on 2025-03-03.
//
import SwiftUI

struct Starter: View {
    @State private var isAnimating = false
    @State private var showSignIn = false
    @State private var showRegister = false
    @State private var navigateToSignIn = false
    @State private var navigateToRegisterPage = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                Text("VolunTree")
                    .font(.custom("Pacifico", size: 40))
                    .foregroundColor(.white)
                    .scaleEffect(isAnimating ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 2), value: isAnimating)

                if showSignIn || showRegister {
                    VStack {
                        Spacer()
                        Button(action: {
                            navigateToSignIn = true
                        }) {
                            Text("SIGN IN")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white)
                                .opacity(showSignIn ? 1 : 0)
                                .animation(.easeInOut(duration: 1), value: showSignIn)
                        }

                        Spacer()
                            .frame(height: 20)

                        Button(action: {
                            navigateToRegisterPage = true //
                        }) {
                            Text("REGISTER")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white)
                                .opacity(showRegister ? 1 : 0)
                                .animation(.easeInOut(duration: 1), value: showRegister)
                        }

                        Spacer()
                            .frame(height: 50)
                    }
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 2)) {
                    isAnimating = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.easeInOut(duration: 1)) {
                        showSignIn = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.easeInOut(duration: 1)) {
                            showRegister = true
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToSignIn) {
                SignIn()
            }
            .navigationDestination(isPresented: $navigateToRegisterPage) {
                Register()
            }
        }
    }
}



#Preview {
    Starter()
}
