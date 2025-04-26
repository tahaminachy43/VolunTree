//
//  Chat.swift
//  VolunTree
//
//  Created by Savitur Maharaj  on 2025-04-08.
//

import SwiftUI

/// The chat view for the volunteer side. It is not fully completed yet.
struct Chat: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Chat")
                    .fontWeight(.bold)
                    .font(.largeTitle)
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

#Preview {
    Chat()
}
