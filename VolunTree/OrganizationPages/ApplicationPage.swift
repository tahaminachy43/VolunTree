//
//  ApplicationPage.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-18.
//

import SwiftUI

struct ApplicationPage: View {
    @State private var supplementaryMessage: String = ""    // to store message from supplementary message
    var position: String = "position"
    var name: String = "Name"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()
                
                VStack {
                    Text("\(name)'s Application")
                        .font(.title)
                        .bold()
                        .padding()
                        .foregroundStyle(Color.darkGreen)
    
                    // user profile picture
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundStyle(Color.darkGreen)
                        .font(.system(size: 80))
                        .padding(.bottom, 30)
                    
                    // view profile button
                    Button(action: {
                        print("Hello")
                    }) {
                        HStack() {
                            Image(systemName: "play.fill")
                                .foregroundColor(Color.darkGreen)
                                .font(.system(size: 15))
                            Text("VIEW PROFILE")
                                .bold()
                                .foregroundColor(Color.darkGreen)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(Color.lightGreen)
                    .cornerRadius(500)
                    .fixedSize()
                    
                    
                    
                    // position name
                    HStack {
                        Spacer()
                        Text("Position: \(position)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                    }
                    .padding(.top, 20)
                    
                    // message to applicant
                    HStack {
                        Spacer()
                        Text("Supplementary Message:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                    }
                    .padding(.top, 20)
                    
                    // supplementary message input
                    HStack {
                        Spacer()
                        //TextField("Enter your message here", text: $supplementaryMessage)
                            
                        TextEditor(text: $supplementaryMessage)
                            .padding()
                            .frame(height: 220)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 15)
                            .shadow(radius: 5)
                    }
                    .padding(.bottom, 20)
                    
                    
                    //Spacer()
                    
                    // approve or reject buttons
                    HStack {
                        Button(action: {
                            print("Hello")
                        }) {
                            HStack() {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                Text("APPROVE")
                                    .bold()
                                    .foregroundColor(Color.white)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color.darkGreen)
                        .cornerRadius(5)
                        .fixedSize()
                        
                        Button(action: {
                            print("Hello")
                        }) {
                            HStack() {
                                Image(systemName: "x.square")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                Text("REJECT")
                                    .bold()
                                    .foregroundColor(Color.white)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(Color.mediumGreen)
                        .cornerRadius(5)
    
                        
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
       
    }
}

#Preview {
    ApplicationPage()
}
