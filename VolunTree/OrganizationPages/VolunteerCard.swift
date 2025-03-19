//
//  VolunteerCard.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-18.
//


import SwiftUI

struct VolunteerCard: View {
    var position: String = "Position"
    var name: String = "Volunteer Name"
    
    var onButtonTap: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.lightGreen
                
                HStack {
                    // profile picture
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundStyle(Color.darkGreen)
                        .font(.system(size: 45))
                    
                    // name and position
                    VStack(alignment: .leading, spacing: 4) {
                        Text(position)
                            .font(.title3)
                            .bold()
                            .lineLimit(1)               // prevents overflow
                            .truncationMode(.tail)      // shows ... during overflow
                        Text(name)
                            .font(.callout)
                            .lineLimit(1)               // prevents overflow
                            .truncationMode(.tail)      // shows ... during overflow
                    }
                    .layoutPriority(1)
                    .padding(.trailing, 10)

                    Spacer()

                    // view button
                    Button(action: {
                        onButtonTap()
                    }) {
                        HStack(spacing: 5) {
                            Image(systemName: "play.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                            Text("VIEW")
                                .bold()
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(Color.darkGreen)
                    .cornerRadius(500)
                    .fixedSize()
                }
                .padding(.horizontal, 10)
            }
            .cornerRadius(15)
            .frame(width: geometry.size.width * 1, height: 100)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
    }
}
