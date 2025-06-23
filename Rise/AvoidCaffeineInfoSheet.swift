
import SwiftUI

struct AvoidCaffeineInfoSheet: View {
    @State private var reminderOn = true
    @State private var reminderTimeHours = 10

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 8) {
                    Image(systemName: "cup.and.saucer.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.orange)
                    
                    Text("Caffeine Cutoff")
                        .font(.title2)
                        .bold()
                    
                    Text("13:50")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                .padding(.top, 20)

                // Settings Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Settings")
                        .font(.headline)

                    Toggle(isOn: $reminderOn) {
                        VStack(alignment: .leading) {
                            Text("Remind me")
                            Text("to avoid caffeine")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }

                    NavigationLink {
                        ReminderTimePicker(reminderTimeHours: $reminderTimeHours)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Reminder Time")
                                Text("Before melatonin window")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text("\(reminderTimeHours)h")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(16)

                Spacer()

                // Learn more
                NavigationLink("Learn more") {
                    Text("Detailed info goes here.")
                        .navigationTitle("Learn more")
                }
                .font(.subheadline)
                .foregroundColor(.blue)

                Spacer()
            }
            .padding()
            .navigationTitle("Caffeine Cutoff")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ReminderTimePicker: View {
    @Binding var reminderTimeHours: Int

    var body: some View {
        Form {
            Picker("Reminder Time", selection: $reminderTimeHours) {
                ForEach(1...12, id: \.self) { hour in
                    Text("\(hour) hours").tag(hour)
                }
            }
        }
        .navigationTitle("Reminder Time")
    }
}
