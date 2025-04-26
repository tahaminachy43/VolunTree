import SwiftUI

/// These show the challenges that a user joined.
struct OngoingChallengesView: View {
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<3) { index in
                VStack {
                    Text("Ongoing Challenge \(index + 1)")
                        .font(.headline)
                        .padding(.top, 10)

                    ProgressView(value: Double(index + 1) / 3.0)
                        .padding(.horizontal, 20)
                        .tint(Color.darkGreen)

                    Text("\(Int((Double(index + 1) / 3.0 * 100)))% completed")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 20)
            }
        }
        .padding(.top, 20)
    }
}
#Preview {
    ChallengesPage()
}
