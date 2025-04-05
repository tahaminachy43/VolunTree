//
//  Search.swift
//  VolunTree
//
//  Created by Tahamina Mostafa chowdhury on 2025-03-05.
//

import SwiftUI
import MapKit
import CoreLocation

// https://www.youtube.com/watch?v=LwU-4LMh9Qs

struct SearchPage: View {
    @State private var region = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 51.0447, longitude: -114.0719), // Calgary
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        )
    
    let uni = CLLocationCoordinate2D(latitude: 51.0781, longitude: -114.1301)
    let mustard_seed = CLLocationCoordinate2D(latitude: 51.049999, longitude: -114.066666)
    
    var body: some View {
        ZStack {
            Color(Color.background)
                .ignoresSafeArea()
            
            VStack(spacing: 5) {
                
                // Title
                VStack (alignment: .leading) {
                    Text("Opportunities")
                    //.font(.title)
                        .font(Font.custom("DM Serif Display Regular", size: 35))
                        .foregroundStyle(Color.darkGreen)
                        .fontWeight(.bold)
                        .padding(.top, 5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                
                
                // Search feature
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search for opportunities...", text: .constant(""))
                        .font(.subheadline)
                        .foregroundStyle(Color.darkGreen)
                }
                .padding(5)
                .background(Color.white)
                .cornerRadius(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal, 20)
                .padding(.top, 15)
                
                
                // Map section
                Map(position: $region) {
                    Marker("University of Calgary", coordinate: uni)
                    Marker("Mustard Seed", coordinate: mustard_seed)
                }
                .mapControls {
                    MapUserLocationButton()
                    MapCompass()
                }
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.darkGreen, lineWidth: 1)
                )
                .padding(20)
                .frame(height: 420)
                
                
                // Opportunities
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
                    .padding(.top, 5)
                }
            }
            //.background(Color.background)
            //.edgesIgnoringSafeArea(.bottom)
            .frame(maxHeight: .infinity, alignment: .top)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)


    }
}

#Preview {
    SearchPage()
}
