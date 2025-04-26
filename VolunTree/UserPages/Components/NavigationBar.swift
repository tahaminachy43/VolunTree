import SwiftUI

/// The navigation bar for the volunteer side.
///
/// Parameters:
/// - pageNum: The number of the default page to show.
/// - onIconTap: Function to apply when the user taps an icon in the navigation bar.
///
/// Returns:
/// - A view with the navigation bar that has 5 icons total.
struct NavigationBar: View {
    /// The number of the default page to show.
    var pageNum: Double
    /// Function to use when the user taps on an icon.
    var onIconTap: (Double) -> Void
    
    /// View for the navigation bar. The page order goes like this (left to right): opportunity search, challenges, home, chat, profile.
    var body: some View {
        HStack {
            Spacer()
            
            // opportunity search page icon
            Image(systemName: "magnifyingglass")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 1 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(1)        // tapping icon takes user to page 1
                }
            
            Spacer()
            
            // challenges page icon
            Image(systemName: "star.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 2 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(2)        // tapping icon takes user to page 2
                }
            
            Spacer()
            
            // home page icon
            Image(systemName: "house.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 3 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(3)        // tapping icon takes user to page 3
                }
            
            Spacer()
            
            // chat page icon
            Image(systemName: "bubble.left.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 4 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(4)        // tapping icon takes user to page 4
                }
            
            
            Spacer()
            
            // profile page icon
            Image(systemName: "person.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 5 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(5)        // tapping icon takes user to page 5
                }
            
            Spacer()
        }
        .padding(.top, 15)
        .background(Color.darkGreen)
        .foregroundColor(Color.background)
    }
}



#Preview {
    VolunteerView()
}
