//
//  Profile.swift
//  VolunTree
//
//  Created by Tahamina Mostafa chowdhury on 2025-03-03.
//
// edit profile page needed to be created
// very hard coded need to replace with account information when the backened is done
import SwiftUI

/// The volunteer's profile page. It shows their name, bio, number of challenges completed and hours worked, and organizations that they worked with.
///
/// Returns:
/// - A view that shows the volunteer's profile page.
struct ProfilePage: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ZStack(alignment: .bottom) {
                        HalfCircleBackground()
                            .fill(Color.darkGreen)
                            .frame(height: 200)
                        
                        Image("Avatar")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .offset(y: 60)
                    }
                    .padding(.bottom, 60)
                    
                    // the name of the profile should come from account information same with bio
                    
                    Text("Tahamina Chowdhury")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.darkColor)
                    
                    Text("Making a difference in the community.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                    HStack(spacing: 40) {
                        VStack {
                            // the stats should be taken from account information
                            Text("5")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.darkColor)
                            Text("Challenges Completed")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        VStack {
                            // the stats should be taken from account information
                            Text("120")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.darkColor)
                            Text("Hours Worked")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 20)
                    
//                    Button(action: {
//                        print("Edit Profile clicked")
//                        // edit profile page needed to be created
//                    }) {
//                        Text("Edit Profile")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.darkGreen)
//                            .cornerRadius(10)
//                    }
//                    .padding(.horizontal, 20)
//                    .padding(.top, 20)
                    NavigationLink(destination: EditProfileView()) {
                        Text("Edit Profile")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.darkGreen)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Organizations Worked With")
                            .font(.headline)
                            .padding(.horizontal, 20)
                            .foregroundStyle(Color.darkColor)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                // for each should be the lenght or number of organization worked and organization card should take in 2 parameters the name of the organization and their logo where he/ she worked
                                ForEach(0..<5) { _ in
                                    OrganizationCard()
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    .padding(.top, 20)
                    
                    Button(action: {
                        print("Logout button clicked")
                    }) {
                        Text("Logout")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.darkGreen)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 10)
                            .background(Color.lightGreen)
                            .cornerRadius(10)
                    }
                    .padding(.top, 100)
                    
                    Spacer()
                    
                    //NavigationBar()
                    // .frame(maxWidth: .infinity)
                }
                .background(Color.background)
                .edgesIgnoringSafeArea(.top)
            }
            .background(Color.background)
            .edgesIgnoringSafeArea(.top)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HalfCircleBackground: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.maxY), radius: rect.width / 2, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: true)
        return path
    }
}

// this needs to be changed when backened in better

struct OrganizationCard: View {
//    let name: String
//    let logo: String
    // should be extracted from database
    var body: some View {
        VStack {
            Image("background")
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            Text("Org Name")
                .font(.subheadline)
                .foregroundColor(.black)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    VolunteerView()
}
