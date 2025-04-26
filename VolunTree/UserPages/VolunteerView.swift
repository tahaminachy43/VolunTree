import SwiftUI

// resources
// https://stackoverflow.com/questions/58560649/how-can-you-switch-views-without-having-a-navigationview-or-an-popover

/// Connects the navigation bar with the different pages on the Volunteer Side.
///
/// Returns:
/// - The volunteer view that allows the users to navigate to the different pages easily.
struct VolunteerView: View {
    @State private var pageNum: Double = 5

    /// The view that shows and connects the navigation bar with the pages.
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
