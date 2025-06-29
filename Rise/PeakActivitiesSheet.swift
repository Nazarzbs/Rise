import SwiftUI

struct PeakActivitiesSheet: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 44) {
                // Header icon + title
                HStack() {
                    Image(systemName: "calendar.badge.clock") // Placeholder icon
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.pink)
                       

                    Text("Evening Routine")
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 20)

                // Description
                VStack(alignment: .leading, spacing: 10) {
                    Text("Think less at the end of the day")
                        .font(.headline)

                    Text("Add activities for a typical weekday night and we’ll organize your evening to match your daily energy levels.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal)

                // Add Activities Button
                Button(action: {
                    // Handle add activities
                }) {
                    Text("ADD ACTIVITIES")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
              
                // Settings and Learn More
                VStack(spacing: 1) {
                    NavigationLink(destination: Text("Settings view goes here")) {
                        HStack {
                            Text("Settings")
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
                        .padding()
                        
                    }

                    NavigationLink(destination: Text("Learn more view goes here")) {
                        HStack {
                            Text("Learn more")
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
                        .padding()
                       
                    }
                }
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.top, 50)
               
                Spacer()
            }
            .navigationTitle("Evening Routine")
            .toolbarBackground(Color.gray.opacity(0.2), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Spacer()
                        Button(action: {
                            dismiss()
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.4))
                                    .frame(width: 35, height: 35)
                                Image(systemName: "xmark")
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.primary)
                                    .padding()
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PeakActivitiesSheet()
}
