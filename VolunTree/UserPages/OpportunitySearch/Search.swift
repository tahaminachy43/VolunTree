import SwiftUI
import MapKit
import CoreLocation

// resources:
// https://www.youtube.com/watch?v=LwU-4LMh9Qs
// https://www.latlong.net/place/university-of-calgary-canada-405.html#:~:text=Latitude%20and%20longitude%20coordinates%20are,%2C%20Calgary%2C%20Alberta%2C%20Canada.
// https://www.latlong.net/convert-address-to-lat-long.html
// https://www.hackingwithswift.com/books/ios-swiftui/integrating-mapkit-with-swiftui


/// The volunteer opportunity search page on the volunteer side. It shows the map and a list of hard-coded volunteer opportunties.
///
/// > Note: This is not fully completed and needs to be connected to the backend.
///
///
struct SearchPage: View {
    @State private var region = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.0447, longitude: -114.0719), // Calgary
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    
    /// Coordinates for the University of Calgary.
    let uni = CLLocationCoordinate2D(latitude: 51.078621, longitude: -114.136719)
    /// Coordinates for the Mustard Seed.
    let mustard_seed = CLLocationCoordinate2D(latitude: 51.043003, longitude: -114.063035)
    
    
    /// View that shows the volunteer opportunity search page.
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
            .frame(maxHeight: .infinity, alignment: .top)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)


    }
}

#Preview {
    SearchPage()
}
