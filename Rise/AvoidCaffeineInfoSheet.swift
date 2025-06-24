
import SwiftUI

struct AvoidCaffeineInfoSheet: View {
    @State private var reminderOn = true
    @State private var reminderTimeHours = 10
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                
                // Header
                HStack {
                    Image(systemName: "cup.and.saucer.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.orange)
                        .padding()
                    
                    VStack(alignment: .leading) {
                       
                        Text("Caffeine Cutoff")
                            .font(.title2)
                            .bold()
                        
                        Text("13:50")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .bold()
                    }
                    Spacer()
                }
                .frame(height: 100)
                .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.orange.opacity(0.3)]), startPoint: .top, endPoint: .bottom))
               

                // Settings Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Settings")
                        .font(.title3)
                        .padding(.vertical, 20)
                        .bold()

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
                            Image(systemName: "clock.fill")
                                .foregroundStyle(.gray)

                            VStack(alignment: .leading) {
                                Text("Reminder Time")
                                    .foregroundColor(.white)
                                
                                Text("Before melatonin window")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text("\(reminderTimeHours)h")
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.white)
                        }
                    }
                }
                .padding()
                
                Spacer()
            
                HStack {
                    
                    Text("Learn more")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.white)
                }
                .padding()
        
                Spacer()
                Spacer()
            }
            .navigationTitle("Caffeine Cutoff")
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


#Preview {
    AvoidCaffeineInfoSheet()
}

