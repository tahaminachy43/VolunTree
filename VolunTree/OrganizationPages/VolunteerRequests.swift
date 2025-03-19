//
//  VolunteerRequests.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-18.
//

import SwiftUI

struct VolunteerRequests: View {
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
                    
                    Spacer()
                    
                    Text("test")
                                
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
       
    }
}

#Preview {
    OrganizationView()
}
