import SwiftUI

struct EnergyCurveChart: View {
    // Data
    let energyPoints: [CGFloat] // 24 values (normalized 0...1)
    let morningPeakHour: Int
    let afternoonDipHour: Int
    let morningPeakLabel: String
    let afternoonDipLabel: String

    private let hourRange = 12...17 // Visible chart hours

    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Background hour lines
                ForEach(hourRange, id: \.self) { hour in
                    let y = yPosition(for: hour, in: geo.size.height)
                    HStack(spacing: 4) {
                        Text(String(format: "%02d", hour))
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .frame(width: 28, alignment: .trailing)
                        Rectangle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(height: 1)
                        Spacer()
                    }
                    .position(x: geo.size.width / 2, y: y)
                }

                // Energy curve path (vertical, smooth)
                Path { path in
                    let w = geo.size.width
                    let h = geo.size.height
                    let minX: CGFloat = w * 0.23 // left padding for labels
                    let maxX: CGFloat = w * 0.95 // right edge
                    let minY: CGFloat = 0
                    let maxY: CGFloat = h
                    let count = energyPoints.count
                    guard count > 1 else { return }

                    func point(at idx: Int) -> CGPoint {
                        let y = minY + (CGFloat(idx) / CGFloat(count - 1)) * (maxY - minY)
                        let x = minX + energyPoints[idx] * (maxX - minX)
                        return CGPoint(x: x, y: y)
                    }

                    path.move(to: point(at: 0))
                    for i in 1..<count {
                        let prev = point(at: i - 1)
                        let curr = point(at: i)
                        let midY = (prev.y + curr.y) / 2
                        let cp1 = CGPoint(x: prev.x, y: midY)
                        let cp2 = CGPoint(x: curr.x, y: midY)
                        path.addCurve(to: curr, control1: cp1, control2: cp2)
                    }
                }
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.cyan, Color.green, Color.blue]),
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    lineWidth: 5
                )
                .shadow(color: Color.cyan.opacity(0.3), radius: 8, x: 0, y: 3)

                // Morning Peak tooltip
                infoBox(
                    title: morningPeakLabel,
                    subtitle: "8m shorter",
                    icon: "cup.and.saucer.fill",
                    note: "Avoid caffeine"
                )
                .position(x: geo.size.width * 0.4,
                          y: yPosition(for: morningPeakHour, in: geo.size.height))

                // Afternoon Dip tooltip
                infoBox(
                    title: afternoonDipLabel,
                    subtitle: "6m later"
                )
                .position(x: geo.size.width * 0.4,
                          y: yPosition(for: afternoonDipHour, in: geo.size.height))
            }
        }
        .frame(height: 300)
    }

    // MARK: - Helper Views & Functions

    private func yPosition(for hour: Int, in height: CGFloat) -> CGFloat {
        let clampedHour = max(hourRange.lowerBound, min(hourRange.upperBound, hour))
        let relative = CGFloat(clampedHour - hourRange.lowerBound) / CGFloat(hourRange.count - 1)
        return height * relative
    }

    private func infoBox(title: String, subtitle: String, icon: String? = nil, note: String? = nil) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.white)
            Text(subtitle)
                .font(.caption2)
                .foregroundColor(.orange)
            if let icon, let note {
                HStack(spacing: 4) {
                    Image(systemName: icon)
                        .foregroundColor(.brown)
                    Text(note)
                        .font(.caption2)
                        .foregroundColor(.white)
                }
            }
        }
        .padding(8)
        .background(Color.black.opacity(0.6))
        .cornerRadius(10)
    }
}

// Example preview with mock data
#Preview {
    EnergyCurveChart(
        energyPoints: [0.6,0.62,0.65,0.7,0.8,0.92,0.95,0.9,0.85,0.8,0.78,0.76,0.8,0.92,0.88,0.7,0.6,0.58,0.6,0.7,0.8,0.85,0.8,0.7],
        morningPeakHour: 13,
        afternoonDipHour: 15,
        morningPeakLabel: "Morning Peak",
        afternoonDipLabel: "Afternoon dip"
    )
}
