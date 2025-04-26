import SwiftUI

/// This card shows the volunteering position, volunteer name, their profile picture, and leads to their profile.
///
/// Parameters:
/// - position: The volunteering position.
/// - name: The volunteer's name.
/// - pfpURL: The address to volunteer's profile picture stored in the backend.
/// - onButtonTap: An action that occurs when the view button is tapped.
///
/// Returns:
/// - A single volunteer card that shows the position, name, profile picture, and a "VIEW" button.
struct VolunteerCard: View {
    let position: String
    let name: String
    let pfpURL: String
    let onButtonTap: () -> Void
    
    /// The view for the volunteer card.
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.lightGreen
                
                HStack {
                    // Profile Picture
                    AsyncImage(url: URL(string: pfpURL)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 60, height: 60)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        case .failure:
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }

                    
                    // Volunteering Position and Applicant's Name
                    VStack(alignment: .leading, spacing: 4) {
                        Text(position)
                            .font(.title3)
                            .bold()
                            .lineLimit(1)               // prevents overflow
                            .truncationMode(.tail)      // shows ... during overflow
                        Text(name)
                            .font(.callout)
                            .lineLimit(1)               // prevents overflow
                            .truncationMode(.tail)      // shows ... during overflow
                    }
                    .layoutPriority(1)
                    .padding(.trailing, 10)

                    Spacer()

                    // View Button
                    Button(action: {
                        onButtonTap()
                    }) {
                        HStack(spacing: 5) {
                            Image(systemName: "play.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                            Text("VIEW")
                                .bold()
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(Color.darkGreen)
                    .cornerRadius(500)
                    .fixedSize()
                }
                .padding(.horizontal, 10)
            }
            .cornerRadius(15)
            .frame(width: geometry.size.width * 1, height: 100)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
    }
}



#Preview {
    VolunteerCard(
        position: "Animal Testing",
        name: "Nobara",
        pfpURL: "https://firebasestorage.googleapis.com/v0/b/voluntree-90104.firebasestorage.app/o/UserPictures%2FL29cwrrRatS3t573cebrdNdEleb2.png?alt=media&token=6c25296f-a1f1-4707-91e0-fe439011e8b7",
        onButtonTap: {}
    )
    .frame(height: 100) // Set a height to match the GeometryReader
}
