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
    let windDownStart = 23
    let windDownEnd = 24
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
    let windDownStart = 23
    let windDownEnd = 24
    let melatoninWindowStart = 24
    let melatoninWindowEnd = 25
    
    var body: some View {
        ZStack(alignment: .leading) {
   
            // Time ruler
            // Sleep period background
            GeometryReader { geometry in
                // Calculate y position and height based on hours
                let totalHours: CGFloat = 36
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
                    
                    Text("4h 18m")
                        .font(.headline)
                        .foregroundColor(.white)
                       
                }
                .position(x: (geometry.size.width ) / 2 - 85 , y: rectY + 15)
                
            }
            .allowsHitTesting(false)
            
            
            GeometryReader { geometry in
                let totalHours: CGFloat = 36
                let hourHeight = geometry.size.height / totalHours
                let rectY = hourHeight * CGFloat(morningPeakStart)
                let rectHeight = hourHeight * CGFloat(morningPeakEnd - morningPeakStart)
                let leftPadding: CGFloat = 0
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.4)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: geometry.size.width - leftPadding, height: rectHeight - 3, alignment: .leading)
                    .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding, y: rectY + rectHeight/2)
                    .shadow(radius: 6)
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Morning Peak")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(.yellow)
                        
                        Text("8m shorter")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                       
                }
                .position(x: (geometry.size.width ) / 2 - 85 , y: rectY + 35)
            }
            .allowsHitTesting(false)
            
            GeometryReader { geometry in
                let totalHours: CGFloat = 36
                let hourHeight = geometry.size.height / totalHours
                let rectY = hourHeight * CGFloat(afternoonDipStart)
                let rectHeight = hourHeight * CGFloat(afternoonDipEnd - afternoonDipStart)
                let leftPadding: CGFloat = 0
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: geometry.size.width - leftPadding, height: rectHeight - 3, alignment: .leading)
                    .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding, y: rectY + rectHeight/2)
                    .shadow(radius: 6)
                    
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Afternoon Dip")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(.purple)
                        
                        Text("6m letter")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                       
                }
                .position(x: (geometry.size.width ) / 2 - 85, y: rectY + 35)
            }
            .allowsHitTesting(false)
            
            GeometryReader { geometry in
                let totalHours: CGFloat = 36
                let hourHeight = geometry.size.height / totalHours
                let rectY = hourHeight * CGFloat(eveningPeakStart)
                let rectHeight = hourHeight * CGFloat(eveningPeakEnd - eveningPeakStart)
                let leftPadding: CGFloat = 0
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: geometry.size.width - leftPadding, height: rectHeight - 3, alignment: .leading)
                    .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding, y: rectY + rectHeight/2)
                    .shadow(radius: 6)
                    
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Evening Peak")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(.orange)
                        
                        Text("6m letter")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                       
                }
                .position(x: (geometry.size.width ) / 2 - 85, y: rectY + 35)
            }
            .allowsHitTesting(false)
            
            GeometryReader { geometry in
                let totalHours: CGFloat = 36
                let hourHeight = geometry.size.height / totalHours
                let rectY = hourHeight * CGFloat(windDownStart)
                let rectHeight = hourHeight * CGFloat(windDownEnd - windDownStart)
                let leftPadding: CGFloat = 0
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: geometry.size.width - leftPadding, height: rectHeight - 3, alignment: .leading)
                    .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding, y: rectY + rectHeight/2)
                    .shadow(radius: 6)
                    
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Wind-down")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(.purple)
                        
                        Text("6m letter")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                       
                }
                .position(x: (geometry.size.width ) / 2 - 85, y: rectY + 35)
            }
            .allowsHitTesting(false)
            
            GeometryReader { geometry in
                let totalHours: CGFloat = 36
                let hourHeight = geometry.size.height / totalHours
                let rectY = hourHeight * CGFloat(melatoninWindowStart)
                let rectHeight = hourHeight * CGFloat(melatoninWindowEnd - melatoninWindowStart)
                let leftPadding: CGFloat = 0
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue]), startPoint: .top, endPoint: .bottom))
                    .frame(width: geometry.size.width - leftPadding, height: rectHeight - 3, alignment: .leading)
                    .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding, y: rectY + rectHeight/2)
                    .shadow(radius: 6)
                    
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Melatonin Window")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(.purple)
                        
                        Text("6m letter")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                       
                }
                .position(x: (geometry.size.width ) / 2 - 55, y: rectY + 35)
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Sleep Need")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    
                        Text("8h 30m")
                            .font(.footnote)
                            .foregroundColor(.white)
                   
                       
                }
                .position(x: (geometry.size.width ) / 2 - 85, y: rectY + 35 + rectHeight - 4)
            }
            .allowsHitTesting(false)
            
            VStack(spacing: 30) {
                ForEach(0..<37) { hour in
                    VStack(alignment: .center, spacing: 30) {
                        if hour >= 24 {
                            Text(String(format: "%02d", hour - 24))
                                .foregroundColor(.white)
                                .bold()
                        } else {
                            Text(String(format: "%02d", hour))
                                .foregroundColor(.white)
                                .bold()
                        }
                        
                        if hour != 36 {
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
            .padding(.leading, 6)
            
            GeometryReader { geometry in
                let hourHeight = geometry.size.height / 36
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 3, height: hourHeight * 36, alignment: .leading)
                    .foregroundStyle(.black)
                    .position(x: 34, y: hourHeight * 18)
            }
        }
    }
}

#Preview {
    ContentView()
}
