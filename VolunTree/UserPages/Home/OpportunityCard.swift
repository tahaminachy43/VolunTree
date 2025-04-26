import SwiftUI

/// A card for each volunteer opportunity to display its name and categories.
///
/// Parameters:
/// - opportunity: This is of type "VolunteeringOpportunity", which has all of the opportunity information.
///
/// Returns:
/// - A single opportunity card displaying the name and categories.
struct OpportunityCard: View {
    /// This is of type "VolunteeringOpportunity", which has all of the opportunity information.
    let opportunity: VolunteeringOpportunity
    
    @State private var width: CGFloat = 170;
    @State private var height: CGFloat = 200;

    /// Displays the view that shows the card for each volunteer opportunity to display its name and categories.
    var body: some View {
        VStack(alignment: .listRowSeparatorLeading, spacing: 2) {
            Text(opportunity.name)
                .font(.headline)
                .foregroundColor(.darkColor)
                .multilineTextAlignment(.leading)
            Text(opportunity.description)
                .font(.caption)
                .foregroundColor(.darkColor)
                .multilineTextAlignment(.leading)
                .italic()
            
            Spacer()
            
            ScrollView(.vertical) {
                VStack (alignment: .leading, spacing: 4) {
                    ForEach(opportunity.volunteeringTypes, id: \.self) { type in
                        Text(type)
                            .font(.caption2)
                            .padding(4)
                            .background(Color.mediumGreen)
                            .foregroundColor(.background)
                            .cornerRadius(5)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxHeight: 55)
        }
        .padding()
        .frame(width: width, height: height)
        .background(Color.lightGreen)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.mediumGreen, lineWidth: 2)
                .frame(width: width-2, height: height-2)
        )
    }
}

#Preview {
    HomePage()
}
