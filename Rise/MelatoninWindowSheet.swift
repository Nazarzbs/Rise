import SwiftUI

struct MelatoninWindowSheet: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    HStack {
                        Image(systemName: "moon.stars.fill")
                            .foregroundColor(.purple)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text("Melatonin Window")
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("Reminder")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .bold()
                        }
                        
                        Spacer()
                    }
                   
                    
                    HStack {
                        
                        TimeScaleView()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                                .strokeBorder(Color.white.opacity(1), style: StrokeStyle(lineWidth: 1, dash: [4]))
                                .background(
                                    ZStack {
                                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black]), startPoint: .top, endPoint: .bottom)
                                        Image(systemName: "moon.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30)
                                            .foregroundColor(.purple)
                                            .opacity(0.8)
                                    }
                                )
                                .frame(height: 115)
                            
                            VStack {
                                
                                HStack {
                                    Spacer()
                                    Image(systemName: "bell.fill")
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 6)
                                        .padding(.top, 4)
                                }
                                
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("Melatonin Window")
                                        .foregroundColor(.white)
                                        .bold()
                                        .padding(.horizontal, 6)
                                        .padding(.bottom, 4)
                                }
                            }
                            .frame(height: 115)
                        }
                    }
                }
                
                HStack {
                    Text("Data seem off?")
                        .foregroundColor(.purple)
                        .font(.footnote)
                        .bold()
                        
                        
                    Spacer()
                }
                
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "arrow.up.arrow.down")
                        .foregroundColor(.white)
                        .font(.title)

                    Text("**Your window shifts daily** based on your recent sleep times. The more consistent your sleep schedule the less the window will shift.")
                        .font(.default)
                        .foregroundColor(.white)
                }
                .padding(.vertical, 30)
                
                VStack(spacing: 40) {
                    HStack {
                        Text("Settings")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }

                    HStack {
                        Text("Learn more")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                }
                .padding(.vertical, 20)

                Spacer()
            }
            .padding()
            .background(Color.black.opacity(0.9).ignoresSafeArea())
            .navigationTitle("Melatonin Window")
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
    MelatoninWindowSheet()
}

import SwiftUI

struct MelatoninWindowView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Title
            

            // Time and window
           

            // Info link
           
            // Description
           
            // Settings and Learn More
            
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

import SwiftUI

struct TimeScaleView: View {
    let times: [String] = ["", "23:50", "", "", "", "", "", "", "", "", "00:50", ""]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(0..<times.count, id: \.self) { index in
                HStack(alignment: .center, spacing: 8) {
                    if !times[index].isEmpty {
                        Text(times[index])
                            .font(.caption)
                            .foregroundColor(.white)
                            .frame(width: 45, alignment: .leading)
                    } else {
                        
                        // The bar
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.4))
                                .frame(height: 3)
                            
                            Rectangle()
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [.purple, .blue]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                                .frame(width: 10, height: 3)
                        }
                    }
                }
            }
        }
        .frame(width: 35)
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
        .background(Color.black)
    }
}

