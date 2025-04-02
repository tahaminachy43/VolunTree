//
//  NavigationBar.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-03.
//
import SwiftUI

struct NavigationBar: View {
    var pageNum: Double
    var onIconTap: (Double) -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 1 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(1)
                }
            Spacer()
            Image(systemName: "star.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 2 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(2)
                }
            Spacer()
            Image(systemName: "house.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 3 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(3)
                }
            Spacer()
            Image(systemName: "bubble.left.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 4 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(4)
                }
            Spacer()
            Image(systemName: "person.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 5 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(5)
                }
            Spacer()
        }
        .padding(.top, 15)
        .background(Color.darkGreen)
        .foregroundColor(Color.background)
    }
}



#Preview {
    VolunteerView()
}
