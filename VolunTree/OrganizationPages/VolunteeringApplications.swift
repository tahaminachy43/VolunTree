//
//  VolunteeringApplications.swift
//  VolunTree
//
//  Created by Savitur Maharaj  on 2025-03-18.
//

import SwiftUI

struct VolunteeringApplications: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()
                
                VStack (spacing: 30){
                    Text("Volunteering Applications")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundStyle(Color.darkGreen)
                    
                    Spacer()
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
    }
}

#Preview {
    OrganizationView()
}
