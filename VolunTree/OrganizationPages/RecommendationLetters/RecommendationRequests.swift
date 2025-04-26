//
//  RecommendationRequests.swift
//  VolunTree
//
//  Created by Savitur Maharaj  on 2025-03-18.
//

import SwiftUI

/// TO DO: This view will have a list of users who are requesting a recommendtion letter for an opportunity that they have completed before
struct RecommendationRequests: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()
                
                VStack (spacing: 30){
                    Text("Letter Requests")
                        .font(.largeTitle)
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