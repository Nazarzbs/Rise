import SwiftUI

struct UsageBarView: View {
    // Simulated usage data (width of each bar)
    let usageLevels: [CGFloat] = [
        2, 4, 6, 4, 8, 10, 2, 4, 6, 4, 8, 10, 14, 18, 30, 22, 24, 20, 18, 10, 8, 6, 4, 2, 2, 4, 6, 4, 8, 10, 2, 4, 6, 4, 2, 4, 6, 4, 8, 10, 2, 4, 6, 4, 
    ]
    let usageLevels2: [CGFloat] = [
        8, 10, 24, 18, 40, 32, 34, 30, 28, 20, 18, 16, 14, 16,
    ]

    var body: some View {
        VStack(spacing: 8) {
            VStack {
                ForEach(usageLevels.indices, id: \.self) { index in
                    ZStack {
                     
                        if index > usageLevels.count / 2 {
                            HStack {
                               
                                Rectangle()
                                    .fill(Color.purple)
                                    .frame(width: usageLevels[index], height: 3)
                            }
                        } else {
                            HStack {
                               
                                Rectangle()
                                    .fill(Color.purple)
                                    .frame(width: usageLevels[index], height: 3)
                                    .opacity(1 / Double(usageLevels.count / 2 - index) + 0.3)


                            }
                        }
                       
                    }
                    .frame(height: 8)
                }
            }

            VStack(spacing: 8) {
                ForEach(0..<101) { i in
                    Rectangle()
                        .fill(Color.purple.opacity(0.6))
                        .frame(width: CGFloat(Int.random(in: 1...4)), height: 2)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            ForEach(usageLevels2.indices, id: \.self) { index in
                ZStack {
                 
                    if index > usageLevels.count / 2 {
                        HStack {
                           
                            Rectangle()
                                .fill(Color.purple)
                                .frame(width: usageLevels[index], height: 3)
                        }
                    } else {
                        HStack {
                           
                            Rectangle()
                                .fill(Color.purple)
                                .frame(width: usageLevels[index], height: 3)
                                .opacity(1 / Double(usageLevels.count / 2 - index) + 0.3)


                        }
                    }
                   
                }
                .frame(height: 8)
            }
        }
    }
}

struct DottedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        return path
    }
}

#Preview {
    UsageBarView()
}
