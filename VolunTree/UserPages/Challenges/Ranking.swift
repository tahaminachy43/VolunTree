import SwiftUI

struct RankingView: View {
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<5) { index in
                HStack {
                    Text("\(index + 1). User \(index + 1)")
                        .font(.headline)
                    Spacer()
                    Text("\(1000 - index * 100) hours")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 20)
            }

            Text("Your Rank: 3")
                .font(.headline)
                .padding(.top, 20)
        }
        .padding(.top, 20)
    }
}
#Preview {
    ChallengesPage()
}
