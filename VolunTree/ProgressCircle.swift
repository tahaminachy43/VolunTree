//
//  ProgressCircle.swift
//  VolunTree
//
//  Created by Khushi Choksi on 2025-03-04.
//

import SwiftUI

// resources:
// https://www.swiftanytime.com/blog/circular-progress-bar-in-swiftui
// https://sarunw.com/posts/swiftui-circular-progress-bar/

// 1.0 is the highest value to fill the circle
struct ProgressCircle: View {
    var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.lightGreen, lineWidth: 15)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.darkGreen,
                    style: StrokeStyle(
                        lineWidth: 15,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(90))
            Text("\(Int(progress * 100))%")
                .font(.custom("newtitle", size: 55))
                .fontWeight(.heavy)
                .foregroundStyle(Color.mediumGreen)
        }
    }
}


#Preview {
    HomePage()
}
