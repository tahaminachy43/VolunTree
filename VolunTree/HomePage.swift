//
//  HomePage.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-03.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.background)
                    .ignoresSafeArea()
                
                VStack (spacing: 30){
                    Text("VolunTree")
                        .font(.custom("Pacifico", size: 40))
                        .font(.largeTitle)
                        .foregroundStyle(Color.darkGreen)
                        
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    
                    
                    VStack {
                        Text("Hi, User!")         // input user's name here
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color.darkGreen)
                            .padding(.trailing, 245)
                            .padding(.bottom, 25)
                        
                        Text("Volunteer Opportunities you may like")
                            .font(.subheadline)
                            .foregroundStyle(Color.darkGreen)
                            .padding(.trailing, 80)
                        
                        
                        // hstack of opportunity reccomendations (replace later with actual opportunities later)
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 15) {
                                ForEach(0..<6) { _ in
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.lightGreen)
                                        .frame(width: 150, height: 100)
                                }
                            }
                            .padding(.leading, 30)
                        }
                        
                    }
                    
                    Spacer()
                    
                    ProgressCircle(progress: 0.75)
                        .frame(width: 250, height: 250)
                        
                    Text("Goal")        // would need to input goal message here
                        .foregroundStyle(Color.darkGreen)
                        .italic()
                    
                    Spacer()
                    NavigationBar()
                        .frame(maxWidth: .infinity)
            
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
       
    }
}

#Preview {
    HomePage()
}
