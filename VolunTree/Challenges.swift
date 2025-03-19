//
//  Challenges.swift
//  VolunTree
//
//  Created by Tahamina Mostafa chowdhury on 2025-03-04.
//

import SwiftUI

struct ChallengesPage: View {
    @State private var selectedTab: Int = 0
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    ZStack(alignment: .leading) {
                        Image("background")
                            .resizable()
                            .scaledToFill()
                            .frame(height: geometry.size.height / 4)
                            .clipped()

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Challenges")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("To reach beyond")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 20)
                        .padding(.bottom, 20)
                        .padding(.top,20)
                    }

                    VStack(spacing: 20) {
                       
                        HStack(spacing: 20) {
                            Button(action: {
                                selectedTab = 0
                            }) {
                                Text("Goals")
                                    .font(.headline)
                                    .foregroundColor(selectedTab == 0 ? .white : .black)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(selectedTab == 0 ? Color.darkGreen : Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }

                            Button(action: {
                                selectedTab = 1
                            }) {
                                Text("Ongoing")
                                    .font(.headline)
                                    .foregroundColor(selectedTab == 1 ? .white : .black)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(selectedTab == 1 ? Color.darkGreen : Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }

                            Button(action: {
                                selectedTab = 2
                            }) {
                                Text("Ranking")
                                    .font(.headline)
                                    .foregroundColor(selectedTab == 2 ? .white : .black)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(selectedTab == 2 ? Color.darkGreen : Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)

                        ScrollView {
                            switch selectedTab {
                            case 0:
                                NewChallengesView()
                            case 1:
                                OngoingChallengesView()
                            case 2:
                                RankingView()
                            default:
                                EmptyView()
                            }
                        }
                    }
                    .background(Color.lightGray)
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            
        }
        NavigationBar()
            .frame(maxWidth: .infinity)
        
    }
}




#Preview {
    ChallengesPage()
}
