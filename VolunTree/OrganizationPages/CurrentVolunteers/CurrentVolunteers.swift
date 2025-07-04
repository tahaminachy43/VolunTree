import SwiftUI

/// The page that shows the organization's current volunteers.
///
/// > Note: This page needs to be connected to the backend still and also needs to be dark-mode friendly.
///
/// Returns:
/// - The view that shows a list of all the current volunteers.
struct CurrentVolunteers: View {
    
    /// The view that shows a list of all the current volunteers.
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()
                
                VStack (spacing: 30){
//                    Text("Current Volunteers")
//                        .font(.largeTitle)
//                        .bold()
//                        .padding()
//                        .foregroundStyle(Color.darkGreen)

                                
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
       
    }
}

#Preview {
    OrganizationView()
}
