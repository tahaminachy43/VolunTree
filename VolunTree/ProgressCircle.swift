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
// https://cindori.com/developer/swiftui-animation-rings

// 1.0 is the highest value to fill the circle
struct ProgressCircle: View {
    var progress: Double    
    @State private var drawingStroke = false
    
    // animation
    let animation = Animation
        .easeOut(duration: 3)
        .delay(0.5)
    
    var body: some View {
        ZStack {
            
            // main progress circle
            ZStack {
                Circle()
                    .stroke(Color.lightGreen.gradient, style: StrokeStyle(lineWidth: 15))
                    .overlay {
                        // progress circle fill
                        Circle()
                            .trim(from: 0, to: drawingStroke ? progress : 0)
                            .stroke(
                                Color.darkGreen.gradient,
                                style: StrokeStyle(
                                    lineWidth: 15,
                                    lineCap: .round
                                )
                            )
                            .rotationEffect(.degrees(90))
                    }
                    .padding(10)
            }
            .animation(animation, value: drawingStroke)
            .drawingGroup()                 // keeps the circle in place
            .onAppear {
                drawingStroke.toggle()
            }
            
            // progress percentage
            Text("\(Int(progress * 100))%")
                .font(.custom("newtitle", size: 45))
                .fontWeight(.black)
                .foregroundStyle(Color.mediumGreen)
        }
    
    }
    
}


#Preview {
    HomePage()
}
