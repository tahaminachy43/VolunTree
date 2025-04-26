//
//  Write:UploadRecommendation.swift
//  VolunTree
//
//  Created by Savitur Maharaj  on 2025-03-18.
//

import SwiftUI

/// This view allows the org to write recommendation letter for a user who has completed a volunteering opportunity
struct Write_UploadRecommendation: View {
    @State private var volunteerName: String = "Volunteer"                      // Applicant's name
    @State private var pfp: Image? = Image(systemName: "person.crop.circle")    // Applican't pfp
    @State private var position: String = "Cook"
    @State private var orgUserName: String = ""                                 // Currently logged in org
    @State private var hours: String = ""
    @State private var letter: String = ""
    @State private var pdf: URL? = nil
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()
                
                VStack (spacing: 30){
                    Text("\(volunteerName)'s Application")
                        .font(.title)
                        .bold()
                        .padding()
                        .foregroundStyle(Color.darkGreen)
                    
//                  Volunteer pfp and profile navigation
                    VStack{
                        pfp?
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        Button(action: {
                            // TO DO: Add functionality to view user profile
                        }) {
                            HStack {
                                Image(systemName: "arrow.forward.circle.fill")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .imageScale(.large)
                                Text("View Profile")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 10)
                                    .fontWeight(.bold)
                            }
                            .background(Color.darkGreen)
                            .cornerRadius(10)
                        }
                        .padding(.top, 10)
                    }
                    
//                  Field
                    VStack(spacing: 15){
                        HStack{
                            Text("Position: Side cook")
                                .foregroundColor(Color.darkGreen)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                        HStack {
                            Text("Name:")
                                .foregroundColor(Color.darkGreen)
                            TextField("Enter Name", text: $orgUserName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.default)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.darkGreen, lineWidth: 1))
                        }
                        
                        HStack {
                            Text("Hours:")
                                .foregroundColor(Color.darkGreen)
                            TextField("Enter Hours", text: $hours)
                                .padding(8)
                                .background(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.darkGreen, lineWidth: 1))
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Letter:")
                                .foregroundColor(Color.darkGreen)
                            TextEditor(text: $letter)
                                .frame(height: 150)
                                .padding(8)
                                .background(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.darkGreen, lineWidth: 1))
                        }

                        // TO DO: Allow the user to upload a pdf instead of writing in the app
                        Button(action: {
                            uploadPDF()
                        }) {
                            HStack {
                                Text("Upload PDF for Letter")
                                    .foregroundColor(.white)
                                    .padding()
                                    .fontWeight(.bold)
                                Image(systemName: "doc.fill")
                                    .resizable()
                                    .frame(width: 20, height: 24)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color.darkGreen)
                            .cornerRadius(10)
                        }
                        
                        
                    }
                    
                    HStack {
                        Text("Date:")
                           .foregroundColor(Color.darkGreen)
                        DatePicker("", selection: $date, displayedComponents: .date)
                           .labelsHidden()
                           .background(Color.white)
                           .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.darkGreen, lineWidth: 1))
                        Spacer()
                    }
                    
                    Button(action: {
                        submitRecommendation()
                    }) {
                        Text("Submit Recommendation")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 350)
                            .background(Color.darkGreen)
                            .cornerRadius(10)
                            .fontWeight(.bold)
                    }
                    
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .onAppear{
                    fetchApplication()
                }
                .padding()
            }
        }
    }
    
//  TO DO: API Calls
    func uploadPDF() {
        
    }

    func fetchApplication(){
        
    }
    
    func submitRecommendation(){
        
    }
}

#Preview {
    Write_UploadRecommendation()
}


// To consider: Leverage AI to generate a recommendation letter based on certain prompts.
// This will save orgs a lot of time, especially if they have a large number of volunteers.
