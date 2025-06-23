import SwiftUI

struct WindDownSheet: View {
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "wind")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.orange)
                .padding(.top, 16)
            Text("Wind-down Activities")
                .font(.title2)
                .fontWeight(.bold)
            Text("Engage in relaxing activities to help your body and mind transition to sleep. Avoid screens, bright lights, and stimulating tasks. Try reading, stretching, or gentle music.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    WindDownSheet()
}
