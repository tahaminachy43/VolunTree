//
//  CurrentVolunteers.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-18.
//

import SwiftUI

struct CurrentVolunteers: View {
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
            
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
       
    }
}

#Preview {
    CurrentVolunteers()
}
