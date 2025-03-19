//
//  OrganizationView.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-18.
//

//https://stackoverflow.com/questions/58560649/how-can-you-switch-views-without-having-a-navigationview-or-an-popover

import SwiftUI

struct OrganizationView: View {
    @State private var pageNum: Double = 1  // later change this to 3 (default start page)

    var body: some View {
        ZStack {
            Color(Color.background)
                .ignoresSafeArea()
            
            VStack {
                if pageNum == 1 {
                    VolunteerRequests()
                } else if pageNum == 2 {
                    CurrentVolunteers()
                }
                
                OrgNavBar(pageNum: pageNum, onIconTap: { newPage in pageNum = newPage})
            }
        }
    }
}


#Preview {
    OrganizationView()
}
