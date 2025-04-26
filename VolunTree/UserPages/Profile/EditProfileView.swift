//
//  EditProfileView.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-04-25.
//

import SwiftUI

/// The edit profile view. The user can edit their name and bio. It is not fully completed yet.
struct EditProfileView: View {
        
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Edit Profile")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundStyle(Color.darkGreen)
                    .multilineTextAlignment(.leading)
                
                Text("Coming soon...")
                    .foregroundStyle(Color.darkGreen)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color.background)
            .padding(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .ignoresSafeArea(edges: .bottom)
    }
    
}
