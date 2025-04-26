//
//  VolunteeringApplications.swift
//  VolunTree
//
//  Created by Savitur Maharaj  on 2025-03-18.
//

import SwiftUI

/// TO DO: View showing user applications to complete opportunities posted by this org
struct VolunteeringApplications: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()
                
                VStack (spacing: 30){
                    Text("Volunteers wanting to complete")
                        .font(.title3)
                        .bold()
                        .padding()
                        .foregroundStyle(Color.darkGreen)
                    
                    Spacer()
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
