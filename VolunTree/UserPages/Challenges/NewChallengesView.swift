import SwiftUI

struct NewChallengesView: View {
    @State private var joinedChallenges: [Int: Bool] = [:]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<5) { index in
                    VStack {
                        Image("capybara 1")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                            .cornerRadius(10)
                            .clipped()

                        Text("Make Capybara Hangry")
                            .font(.headline)
                            .padding(.top, 10)

                        Text("Making a Difference")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)

                        Button(action: {
                            
                            joinedChallenges[index] = true
                            print("Challenge \(index + 1) joined")
                        }) {
                            Text(joinedChallenges[index] == true ? "Joined" : "Join")
                                .font(.headline)
                                .foregroundColor(joinedChallenges[index] == true ? Color.darkGreen : .white) 
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(joinedChallenges[index] == true ? Color.lightGreen : Color.darkGreen)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                }
            }
            .padding(.top, 20)
            .background(Color.background)
        }
    }
}

#Preview {
    ChallengesPage()
}
