//
//  CurrentVolunteers.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-18.
//

import SwiftUI

/// TO DO: Show current volunteers at org and allow the org to remove them
struct CurrentVolunteers: View {
    let volunteers: [(position: String, name: String, action: () -> Void)] = [
        ("Volunteer #1", "Jane Doe", {print("Tapped!")} ),
        ("Events Manager", "John Smith", {print("Tapped! 2")} ),
        ] // sample data
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()
                
                VStack (spacing: 30){
                    Text("Current Volunteers")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundStyle(Color.darkGreen)
                    
                    // volunteer cards
//                    ScrollView {
//                        LazyVStack(spacing: 110) {
//                            ForEach(volunteers.indices, id: \.self) { index in
//                                VolunteerCard(
//                                    position: volunteers[index].position,
//                                    name: volunteers[index].name,
//                                    onButtonTap: volunteers[index].action
//                                )
//                                .padding(.horizontal)
//                            }
//                        }
//                        .padding(.top, 50)
//                        .padding(.bottom, 100)
//                    }

                                
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
       
    }
}

#Preview {
    OrganizationView()
}
