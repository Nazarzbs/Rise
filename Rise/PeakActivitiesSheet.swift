import SwiftUI

struct PeakActivitiesSheet: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                // Header icon + title
                VStack(spacing: 12) {
                    Image(systemName: "calendar.badge.clock") // Placeholder icon
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.pink)

                    Text("Evening Routine")
                        .font(.title2)
                        .bold()
                }
                .padding(.top, 20)

                // Description
                VStack(spacing: 8) {
                    Text("Think less at the end of the day")
                        .font(.headline)

                    Text("Add activities for a typical weekday night and we’ll organize your evening to match your daily energy levels.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)

                // Add Activities Button
                Button(action: {
                    // Handle add activities
                }) {
                    Text("ADD ACTIVITIES")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()

                // Settings and Learn More
                VStack(spacing: 1) {
                    NavigationLink(destination: Text("Settings view goes here")) {
                        HStack {
                            Text("Settings")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    }

                    NavigationLink(destination: Text("Learn more view goes here")) {
                        HStack {
                            Text("Learn more")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    }
                }
                .cornerRadius(12)
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .navigationTitle("Evening Routine")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PeakActivitiesSheet()
}
