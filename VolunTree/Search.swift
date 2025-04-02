//
//  Search.swift
//  VolunTree
//
//  Created by Tahamina Mostafa chowdhury on 2025-03-05.
//

import SwiftUI

struct SearchPage: View {
    var body: some View {
        VStack(spacing: 0) {

            Text("VolunTree")
                .font(.custom("Pacifico", size: 40))
                .font(.largeTitle)
                .foregroundStyle(Color.darkGreen)
                
                .padding(.top, 20)
                .padding(.bottom, 10)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                TextField("Search for opportunities...", text: .constant(""))
                    .font(.subheadline)
                    .foregroundStyle(Color.white)
                
            }
            .padding()
            .background(Color.lightGreen)
            .cornerRadius(10)
            .padding(.horizontal, 20)
            .padding(.top, 20)

            // Map Section (Placeholder)
            Image("map") // we have to useMapKit to embed maspw we want
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .padding(.top, 20)

            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<10) { index in
                        HStack(alignment: .top, spacing: 15) {

                            Image("Capybara 2")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .cornerRadius(10)

                            VStack(alignment: .leading, spacing: 5) {
                                Text("Volunteer Opportunity \(index + 1)")
                                    .font(.headline)
                                    .foregroundColor(.black)

                                Text("Organization Name \(index + 1)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)

                                Text("This is a brief description of the volunteer opportunity. Join us to make a difference in the community!")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                            }

                            Spacer()
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.top, 20)
            }
        }
        .background(Color.lightGray)
        .edgesIgnoringSafeArea(.bottom)
        //NavigationBar()
            //.frame(maxWidth: .infinity)
    }
}

#Preview {
    SearchPage()
}
