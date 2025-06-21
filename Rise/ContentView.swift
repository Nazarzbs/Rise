//
//  ContentView.swift
//  Rise
//
//  Created by Nazar on 21/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            // Energy Tab (actual working view)
            EnergyView()
                .tabItem {
                    Image(systemName: "calendar.day.timeline.left")
                    Text("Energy")
                }
            
            // Home Tab
            VStack {
                Spacer()
                Text("Home View Coming Soon")
                    .foregroundColor(.gray)
                    .font(.title2)
                Spacer()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            // Progress Tab
            VStack {
                Spacer()
                Text("Progress View Coming Soon")
                    .foregroundColor(.gray)
                    .font(.title2)
                Spacer()
            }
            .tabItem {
                Image(systemName: "chart.line.uptrend.xyaxis")
                Text("Progress")
            }
            
            
            
            // Tools Tab
            VStack {
                Spacer()
                Text("Tools View Coming Soon")
                    .foregroundColor(.gray)
                    .font(.title2)
                Spacer()
            }
            .tabItem {
                Image(systemName: "briefcase.fill")
                Text("Tools")
            }
            
            // Guidance Tab
            VStack {
                Spacer()
                Text("Guidance View Coming Soon")
                    .foregroundColor(.gray)
                    .font(.title2)
                Spacer()
            }
            .tabItem {
                Image(systemName: "bubble.left.and.bubble.right.fill")
                Text("Guidance")
            }
        }
    }
}

struct EnergyView: View {
    // Mock data
    let totalSleepTime = "6h 51m"
    let sleepStart = 4
    let sleepEnd = 11
    let morningPeakStart = 13
    let morningPeakEnd = 15
    let afternoonDipStart = 15
    let afternoonDipEnd = 19
    let eveningPeakStart = 19
    let eveningPeakEnd = 23
    let WindDownStart = 23
    let WindDownEnd = 24
    let currentEnergy = 100
    
    var body: some View {
        VStack(spacing: 0) {
            // Header (always visible)
            HStack {
                VStack(alignment: .leading) {
                    Text("My energy schedule")
                        .font(.title2).bold()
                    HStack {
                        Text("Great ")
                            .font(.headline)
                            .foregroundColor(.green)
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.green)
                        Text("\(currentEnergy)%")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                }
                Spacer()
                Image(systemName: "person.crop.circle")
                    .font(.largeTitle)
                    .foregroundColor(.purple)
            }
            .padding(.horizontal)
            .padding(.top, 8)
            .padding(.bottom, 4)
            .background(Color.black)
            
            // Scrollable content
            ScrollView {
                HStack {
                    
                    // Timeline
                    TimelineView()
                        .padding(.leading, 4)
                    Spacer()
                    
                    
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}

struct TimelineView: View {
    let sleepStart = 4
    let sleepEnd = 11
    let morningPeakStart = 13
    let morningPeakEnd = 15
    let afternoonDipStart = 15
    let afternoonDipEnd = 19
    let eveningPeakStart = 19
    let eveningPeakEnd = 23
    let WindDownStart = 23
    let WindDownEnd = 24
    
    var body: some View {
        ZStack(alignment: .leading) {
   


            // Time ruler
            // Sleep period background
            GeometryReader { geometry in
                // Calculate y position and height based on hours
                let totalHours: CGFloat = 24
                let hourHeight = geometry.size.height / totalHours
                let rectY = hourHeight * CGFloat(sleepStart)
                let rectHeight = hourHeight * CGFloat(sleepEnd - sleepStart)
                let leftPadding: CGFloat = 35
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Total sleep time")
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                    Text("6h 51m")
                        .font(.headline)
                       
                    Spacer().frame(height: 8)
                }
                .position(x: (geometry.size.width ) / 2 - 75 , y: rectY - 30)
              
              
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.65), Color.blue.opacity(0.65)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: geometry.size.width - leftPadding, height: rectHeight, alignment: .leading)
                    .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding, y: rectY + rectHeight/2)
                    .shadow(radius: 6)
                
                VStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 60, height: 5)
                        .foregroundColor(.purple)
                    
                    Text("6h 51m")
                        .font(.headline)
                        .foregroundColor(.white)
                       
                }
                .position(x: (geometry.size.width ) / 2 - 105 , y: rectY + 15)
            }
            .allowsHitTesting(false)
            
            VStack(spacing: 30) {
                ForEach(0..<25) { hour in
                    VStack(alignment: .center, spacing: 30) {
                        Text(String(format: "%02d", hour))
                            .foregroundColor(.white)
                            .bold()
                        
                        if hour != 24 {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 7, height: 1)
                                .foregroundStyle(Color.gray)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 15, height: 2)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 7, height: 1)
                                .foregroundStyle(Color.gray)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
