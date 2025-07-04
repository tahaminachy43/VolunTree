import SwiftUI

struct VolunteersPage: View {
    @State private var selectedTab: Int = 0
    var body: some View {
        NavigationView {
            GeometryReader { geometry in

                    VStack(spacing: 0) {
                        
                        Text("View volunteers")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                            .foregroundStyle(Color.darkGreen)
                       
                        HStack(spacing: 20) {
                            Button(action: {
                                selectedTab = 0
                            }) {
                                Text("Current")
                                    .font(.headline)
                                    .foregroundColor(selectedTab == 0 ? .white : .black)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(selectedTab == 0 ? Color.darkGreen : Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }

                            Button(action: {
                                selectedTab = 1
                            }) {
                                Text("Requests")
                                    .font(.headline)
                                    .foregroundColor(selectedTab == 1 ? .white : .black)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(selectedTab == 1 ? Color.darkGreen : Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal, 15)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        .background(Color.background)

                        ScrollView {
                            switch selectedTab {
                            case 0:
                                CurrentVolunteers()
                            case 1:
                                VolunteerRequests()
                            default:
                                EmptyView()
                            }
                        }
                    }
                    .background(Color.background)
                }
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarBackButtonHidden(true)
    }
}




#Preview {
    VolunteersPage()
}

