import SwiftUI

struct DataPoint {
    let time: Int
    let value: Double
}

struct DataDrivenCurve: Shape {
    let dataPoints: [DataPoint]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        guard dataPoints.count >= 2 else { return path }
        
        let centerX = rect.midX
        let amplitude = rect.width * 0.3
        
        // Sort data points by time to ensure proper ordering
        let sortedPoints = dataPoints.sorted { $0.time < $1.time }
        
        // Calculate time range
        let minTime = sortedPoints.first!.time
        let maxTime = sortedPoints.last!.time
        let timeRange = max(maxTime - minTime, 1) // Avoid division by zero
        
        // Convert data points to screen coordinates
        let screenPoints = sortedPoints.map { point -> CGPoint in
            let timeProgress = Double(point.time - minTime) / Double(timeRange)
            let y = timeProgress * rect.height
            let x = centerX + amplitude * point.value
            return CGPoint(x: x, y: y)
        }
        
        // Start the path
        path.move(to: screenPoints[0])
        
        // Create smooth curve using cubic Bezier curves
        for i in 0..<screenPoints.count - 1 {
            let currentPoint = screenPoints[i]
            let nextPoint = screenPoints[i + 1]
            
            // Calculate control points for smooth curve
            let controlPoint1 = calculateControlPoint1(
                current: currentPoint,
                next: nextPoint,
                previous: i > 0 ? screenPoints[i - 1] : nil
            )
            
            let controlPoint2 = calculateControlPoint2(
                current: currentPoint,
                next: nextPoint,
                nextNext: i < screenPoints.count - 2 ? screenPoints[i + 2] : nil
            )
            
            path.addCurve(
                to: nextPoint,
                control1: controlPoint1,
                control2: controlPoint2
            )
        }
        
        return path
    }
    
    // Calculate first control point for smooth curve
    private func calculateControlPoint1(current: CGPoint, next: CGPoint, previous: CGPoint?) -> CGPoint {
        let smoothing: CGFloat = 0.6  // Increased for smoother curves
        let deltaY = next.y - current.y
        
        if let prev = previous {
            // Calculate tangent direction from previous to next point
            let tangentX = (next.x - prev.x) * smoothing
            let tangentY = (next.y - prev.y) * smoothing
            
            return CGPoint(
                x: current.x + tangentX * 0.3,
                y: current.y + tangentY * 0.3
            )
        } else {
            // First point - smooth transition towards next
            return CGPoint(
                x: current.x + (next.x - current.x) * smoothing * 0.5,
                y: current.y + (next.y - current.y) * smoothing * 0.5
            )
        }
    }
    
    // Calculate second control point for smooth curve
    private func calculateControlPoint2(current: CGPoint, next: CGPoint, nextNext: CGPoint?) -> CGPoint {
        let smoothing: CGFloat = 0.6  // Increased for smoother curves
        
        if let nextNext = nextNext {
            // Calculate tangent direction from current to next-next point
            let tangentX = (nextNext.x - current.x) * smoothing
            let tangentY = (nextNext.y - current.y) * smoothing
            
            return CGPoint(
                x: next.x - tangentX * 0.3,
                y: next.y - tangentY * 0.3
            )
        } else {
            // Last point - smooth transition from current
            return CGPoint(
                x: next.x - (next.x - current.x) * smoothing * 0.5,
                y: next.y - (next.y - current.y) * smoothing * 0.5
            )
        }
    }
}

// Example usage with fade effect
struct FadingCurveView: View {
    let sampleData = [
        DataPoint(time: 0, value: 0.0),
        DataPoint(time: 1, value: 0.5),
        DataPoint(time: 2, value: -0.3),
        DataPoint(time: 3, value: 0.8),
        DataPoint(time: 4, value: -0.2),
        DataPoint(time: 5, value: 0.6),
        DataPoint(time: 6, value: -0.4),
        DataPoint(time: 7, value: 0.1)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            DataDrivenCurve(dataPoints: sampleData)
                .stroke(Color.blue, lineWidth: 3)
                .mask(
                    // Create a linear gradient mask for fade effect
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .black, location: 0.0),     // Full opacity at start
                            .init(color: .black, location: 0.7),     // Full opacity until 70%
                            .init(color: .clear, location: 1.0)      // Fade to transparent at end
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
        .frame(width: 300, height: 400)
        .background(Color.gray.opacity(0.1))
    }
}


#Preview {
    VStack(spacing: 30) {
      
        FadingCurveView()
       
    }
    .padding()
}
