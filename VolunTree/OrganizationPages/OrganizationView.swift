//
//  OrganizationView.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-18.
//

//https://stackoverflow.com/questions/58560649/how-can-you-switch-views-without-having-a-navigationview-or-an-popover

import SwiftUI

struct OrganizationView: View {
    @State private var pageNum: Double = 3

    var body: some View {
        ZStack {
            Color(Color.background)
                .ignoresSafeArea()
            
            VStack {
                if pageNum == 1 {
                    VolunteerRequests()
                } else if pageNum == 2 {
                    CurrentVolunteers()
                }else if pageNum == 3{
                    Profile()
                }else if pageNum == 4{
                    VolunteeringApplications()
                }else if pageNum == 5{
                    RecommendationRequests()
                }
                
                OrgNavBar(pageNum: pageNum, onIconTap: { newPage in pageNum = newPage})
            }
        }
    }
}

#Preview {
    OrganizationView()
}
