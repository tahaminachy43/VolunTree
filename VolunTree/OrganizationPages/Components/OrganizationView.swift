import SwiftUI

// resources
// https://stackoverflow.com/questions/58560649/how-can-you-switch-views-without-having-a-navigationview-or-an-popover

/// Connects the navigation bar with the different pages on the Organization Side.
///
/// Returns:
/// - The organization view that allows the users to navigate to the different pages easily.
struct OrganizationView: View {
    @State private var pageNum: Double = 3

    /// The view that shows and connects the navigation bar with the pages.
    var body: some View {
        ZStack {
            Color(Color.darkGreen)
            VStack {
                if pageNum == 1 {
                    // VolunteerRequests()
                } else if pageNum == 2 {
                    // CurrentVolunteers()
                    VolunteersPage()
                } else if pageNum == 3 {
                    OrganizationProfile()
                } else if pageNum == 4 {
                    VolunteeringApplications()
                } else if pageNum == 5 {
                    RecommendationRequests()
                }
                
                OrgNavBar(pageNum: pageNum, onIconTap: { newPage in pageNum = newPage})
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}

#Preview {
    OrganizationView()
}
