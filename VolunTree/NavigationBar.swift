//
//  NavigationBar.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-03.
//

import SwiftUI


// would need to add animation + navigation logic
struct NavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.title)
            Spacer()
            Image(systemName: "star.fill")
                .font(.title)
            Spacer()
            NavigationLink(destination: HomePage()) {
                Image(systemName: "house.fill")
                    .font(.title)
                    .foregroundColor(Color.lightGreen)
            }
            .navigationBarBackButtonHidden(true)
            Spacer()
            Image(systemName: "bubble.left.fill")
                .font(.title)
            Spacer()
            NavigationLink(destination: ProfilePage()) {
                Image(systemName: "person.fill")
                    .font(.title)
                
                
            }
            .navigationBarBackButtonHidden(true)
            Spacer()
            
        }
        
        .padding(.top, 20)
        .background(Color.darkGreen)
        .foregroundColor(Color.background)
        #if os(iOS)
        .navigationBarHidden(true)
        #endif

    }
}

#Preview {
    HomePage()
}
