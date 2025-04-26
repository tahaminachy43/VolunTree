import SwiftUI

/// The navigation bar for the organization side.
///
/// Parameters:
/// - pageNum: The number of the default page to show.
/// - onIconTap: Function to apply when the organization user taps an icon in the navigation bar.
///
/// Returns:
/// - A view with the navigation bar that has 5 icons total.
struct OrgNavBar: View {
    /// The number of the default page to show.
    var pageNum: Double
    /// Function to apply when the organization user taps an icon in the navigation bar.
    var onIconTap: (Double) -> Void
    
    /// View for the navigation bar. The page order goes like this (left to right): volunteer join requests, current volunteers, organization profile, volunteer complete requests, letter requests
    var body: some View {
        HStack {
            Spacer()
            
            // volunteer join requests page icon
            Image(systemName: "r.circle.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 1 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(1)        // tapping icon takes user to page 1
                }
            
            Spacer()
            
            // current volunteers page icon
            Image(systemName: "v.circle.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 2 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(2)        // tapping icon takes user to page 2
                }
            
            Spacer()
            
            // organization profile page icon
            Image(systemName: "person.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 3 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(3)        // tapping icon takes user to page 3
                }
            
            Spacer()
            
            // volunteer complete requests page icon
            Image(systemName: "star.circle.fill")
                .font(.system(size: 35))
                .foregroundColor(pageNum == 4 ? Color.lightGreen : Color.background)
                .onTapGesture {
                    onIconTap(4)        // tapping icon takes user to page 4
                }
            
            Spacer()
            
            // letter requests page icon
            Image(systemName: "envelope.fill")
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
    OrganizationView()
}
