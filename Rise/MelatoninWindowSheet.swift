import SwiftUI

struct MelatoninWindowSheet: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            // Top bar with close button
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                        .padding()
                }
            }

            Spacer()

            // Main Content
            VStack(spacing: 16) {
                Image(systemName: "moon.stars.fill")
                    .font(.largeTitle)
                    .foregroundColor(.purple)

                Text("Melatonin Window")
                    .font(.title2)
                    .bold()

                Text("23:50 - 00:50")
                    .font(.headline)

                Text("Your window shifts daily based on your recent sleep times. The more consistent your sleep schedule the less the window will shift.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()

                Divider()

                Button("Settings") {
                    // Handle settings tap
                }

                Button("Learn More") {
                    // Handle learn more tap
                }
            }

            Spacer()
        }
        .padding()
        .background(Color.black.opacity(0.9).ignoresSafeArea())
    }
}


