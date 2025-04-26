import SwiftUI

// resources:
// https://www.swiftanytime.com/blog/circular-progress-bar-in-swiftui
// https://sarunw.com/posts/swiftui-circular-progress-bar/
// https://cindori.com/developer/swiftui-animation-rings

/// An animated progress circle that is filled in based on the input value.
///
/// Parameters:
/// - progress: A Double value in the range 0 to 1. (e.g., 0.5 is equal to 50%).
///
/// Returns:
/// - A single animated progress circle filled in with the input value.
struct ProgressCircle: View {
    /// A Double value in the range 0 to 1. (e.g., 0.5 is equal to 50%). Anything outside of the range can have unexpected results.
    var progress: Double
    
    @State private var drawingStroke = false            // to do trim if drawing stroke is true
    @State private var hasAppeared = false              // to ensure animation occurs once initially
    
    /// Animation code for filling up the progress circle.
    let animation = Animation
        .easeOut(duration: 3)
        .delay(0.5)
    
    /// The view that shows the animated progress circle.
    var body: some View {
        ZStack {
            
            // main progress circle
            ZStack {
                Circle()
                    .stroke(Color.lightGreen.gradient, style: StrokeStyle(lineWidth: 15))
                    .overlay {
                        // progress circle fill up to the inputted progress
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
            .drawingGroup()                     // keeps the circle in place
            .onAppear {
                if !hasAppeared {
                    hasAppeared = true
                    drawingStroke.toggle()      // ensures the animation occurs once only
                }
            }
            
            // progress percentage text
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
