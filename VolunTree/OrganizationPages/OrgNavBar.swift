//
//  OrgNavBar.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-18.
//

import SwiftUI

struct OrgNavBar: View {
    var pageNum: Double
    var onIconTap: (Double) -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "r.circle.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 1 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(1)
                }
            Spacer()
            Image(systemName: "v.circle.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 2 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(2)
                }
            Spacer()
            Image(systemName: "person.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 3 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(3)
                }
            Spacer()
            Image(systemName: "star.circle.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 4 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(4)
                }
            Spacer()
            Image(systemName: "envelope.fill")
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
    OrganizationView()
}
