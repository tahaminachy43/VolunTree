//
//  VolunteerRequests.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-18.
//

import SwiftUI

struct VolunteerRequests: View {
    @State private var requests: [(position: String, name: String)] = [
        ("Recreational Assistant", "Alice Johnson"),
        ("Student Volunteer", "Bob Smith"),
        ("Helper", "June Lindt"),
        ("Social Worker", "Linda Brown"),
        ("Social Worker", "Alice Johnson"),
        ("Student Volunteer", "Bob Smith"),
        ("Recreational Assistant", "Alice Smith")
        ] // sample data
    
    @State private var navigateToProfile = false
    @State private var selectedIndex: Int?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()
                
                VStack (spacing: 30){
                    Text("Volunteer Requests")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundStyle(Color.darkGreen)
                    
                    // request cards
                    ScrollView {
                        LazyVStack(spacing: 110) {
                            ForEach(requests.indices, id: \.self) { index in
                                VolunteerCard(
                                    position: requests[index].position,
                                    name: requests[index].name,
                                    onButtonTap: {
                                        navigateToProfile = true
                                        selectedIndex = index
                                    }
                                )
                                .padding(.horizontal)
                                
                                // Delete button
    
                            }
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 100)
                        .background(
                            NavigationLink(
                                destination: ApplicationPage(position: requests[selectedIndex ?? 0].position, name: requests[selectedIndex ?? 0].name),
                                isActive: $navigateToProfile,       // this is deprecated, need to find another way
                                label: { EmptyView() }
                            )
                            .foregroundStyle(Color.darkGreen)
                            .background(Color.darkGreen)
                            .navigationBarBackButtonHidden(true)
                        )
                        
                    }

                }
                .frame(maxHeight: .infinity, alignment: .top)
                
            }
        }
       
    }
    
}

#Preview {
    OrganizationView()
}
