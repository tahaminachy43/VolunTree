//
//  VolunteerView.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-04-01.
//

//https://stackoverflow.com/questions/58560649/how-can-you-switch-views-without-having-a-navigationview-or-an-popover

import SwiftUI

struct VolunteerView: View {
    @State private var pageNum: Double = 3

    var body: some View {
        ZStack {
            Color(Color.darkGreen)
                        
            VStack {
                if pageNum == 1 {
                    SearchPage()
                } else if pageNum == 2 {
                    ChallengesPage()
                } else if pageNum == 3 {
                    HomePage()
                } else if pageNum == 4 {
                    Chat()
                } else if pageNum == 5 {
                    ProfilePage()
                }
                
                NavigationBar(pageNum: pageNum, onIconTap: { newPage in pageNum = newPage})

            }
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}

#Preview {
    VolunteerView()
}
