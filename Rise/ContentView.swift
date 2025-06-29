//
//  ContentView.swift
//  Rise
//
//  Created by Nazar on 21/6/25.
//

import SwiftUI

struct VerticalSineWaveView: View {
    // Sample data - replace with your actual data
    let dataPoints = [
        DataPoint(time: 12, value: -1.5),
        DataPoint(time: 13, value: 0.2),
        DataPoint(time: 14, value: 0.5),
        DataPoint(time: 15, value: 0.2),
        DataPoint(time: 16, value: -0.1),
        DataPoint(time: 17, value: -1.4),
        DataPoint(time: 18, value: -1.4),
        DataPoint(time: 19, value: -1.4),
        DataPoint(time: 20, value: -1.5),
        DataPoint(time: 21, value: -1.5)
    ]
    
    var body: some View {
        ZStack {
         
            VStack(spacing: 0) {

                    // Data-driven curved graph
                DataDrivenCurve(dataPoints: dataPoints)
                   
                        .stroke(
                            LinearGradient(colors: [.purple, .cyan, .green, .purple],
                                         startPoint: .top,
                                         endPoint: .bottom),
                            lineWidth: 3
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding(.horizontal, 20)
        }
    }
}


struct ContentView: View {
    @State private var showSheet = true
    @State private var selectedTab = 2
    
    var body: some View {
        VStack {
            EnergyView()
        }
        .sheet(isPresented: .constant(true)) {
            TabView(selection: $selectedTab) {
                
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
                
                // Energy Tab (actual working view)
                SheetView()
                    .tabItem {
                        Image(systemName: "calendar.day.timeline.left")
                        Text("Energy")
                    }
                    .tag(2)
                
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
            .presentationDetents([.height(120)])
            .presentationDragIndicator(.visible)
            .presentationBackgroundInteraction(.enabled) // Allows interaction with background
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
                        
                        Circle()
                            .frame(width: 13, height: 13)
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
    
    @State private var showAvoidCaffeineSheet = false
    @State private var showPeakActivitiesSheet = false
    @State private var showWindDownSheet = false
    @State private var showMelatoninWindowSheet = false
    
    
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
                
              
                HStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(Color.white.opacity(1))
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.65), Color.blue.opacity(0.65)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: geometry.size.width - leftPadding - 100, height: rectHeight, alignment: .leading)
                        .position(x: (geometry.size.width - leftPadding) / 2 - 15 + 1, y: rectY + rectHeight/2)
                        .shadow(radius: 6)
                    ZStack {
                   
                        RoundedRectangle(cornerRadius: 16)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.65), Color.blue.opacity(0.65)]), startPoint: .top, endPoint: .bottom))
                            .frame(width: 100, height: rectHeight, alignment: .leading)
                            .position(x: 146,y: rectY + rectHeight/2)
                            .shadow(radius: 6)
                        
                        Text("Phone")
                                .position(x: 142,y: rectY + 13)
                                
                    }
                }
                
                VStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 60, height: 5)
                        .foregroundColor(.purple)
                    
                    HStack {
                        Image(systemName: "zzz")
                            .frame(width: 20, height: 20)
                        Text("4:18")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                       
                }
                .position(x: (geometry.size.width) / 2 - 85 , y: rectY + 15)
                
                VStack(spacing: 0) {
                  
                    HStack {
                       
                        Text("11:09")
                            .font(.headline)
                            .foregroundColor(.white)
                        Image(systemName: "sun.max.fill")
                            .frame(width: 20, height: 20)
                    }
                    
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 70, height: 5)
                        .foregroundColor(.purple)
                       
                }
                .position(x: (geometry.size.width) / 2 + 35, y: rectY + rectHeight - 15)
                
                
                
                HStack {
                    Image(systemName: "scissors")
                        .frame(width: 20, height: 20)
                    Text("Press to add awake time")
                        .bold()
                        .font(.footnote)
                        .foregroundColor(.white)
                        
                }
                .position(x: (geometry.size.width ) / 2 - 25 , y: rectY * 2)
            }
            .zIndex(1000)
            
            
            GeometryReader { geometry in
                let totalHours: CGFloat = 36
                let hourHeight = geometry.size.height / totalHours
                let rectY = hourHeight * CGFloat(11)
                let rectHeight = hourHeight * CGFloat(13 - 11)
                let leftPadding: CGFloat = 0
                let rightPadding: CGFloat = 100
                
                Image(.groggsness)
                    .resizable()
                    .frame(width: geometry.size.width - leftPadding - rightPadding,
                           height: rectHeight - 8,
                           alignment: .leading)
                    .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding - rightPadding / 2,
                              y: rectY + rectHeight / 2 + 2)
                    .shadow(radius: 6)
                    .mask(
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: geometry.size.width - leftPadding - rightPadding,
                                   height: rectHeight - 8)
                            .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding - rightPadding / 2,
                                      y: rectY + rectHeight / 2 + 2)
                    )
                    .zIndex(-1)
                    
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Grogginess")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                }
                .position(x: (geometry.size.width ) / 2 - 95 , y: rectY + 20)
                
            }
            
            GeometryReader { geometry in
                let totalHours: CGFloat = 36
                let hourHeight = geometry.size.height / totalHours
                let rectY = hourHeight * CGFloat(morningPeakStart)
                let rectHeight = hourHeight * CGFloat(morningPeakEnd - morningPeakStart)
                let leftPadding: CGFloat = 0
                let rightPadding: CGFloat = 100
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.4)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: geometry.size.width - leftPadding - rightPadding, height: rectHeight - 3, alignment: .leading)
                    .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding - rightPadding / 2, y: rectY + rectHeight/2)
                    .shadow(radius: 6)
                
                Button(action: {
                    showAvoidCaffeineSheet = true
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "cup.and.saucer.fill")
                            .foregroundColor(.orange)
                            .padding(.leading, 4)
                        Text("Avoid caffeine")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .bold()
                        Spacer()
                    }
                    .frame(width: 175)
                    .padding(.vertical, 2)
                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.init(uiColor: .systemGray5)))
                }
                .position(x: geometry.size.width  - 85, y: rectY + rectHeight/2)
                .sheet(isPresented: $showAvoidCaffeineSheet) {
                    AvoidCaffeineInfoSheet()
                        .presentationDetents([.large])
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Morning Peak")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 0) {
                        Circle()
                            .frame(width: 6, height: 6)
                        
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: geometry.size.width, height: 1, alignment: .trailing)
                        
                    }
                    .offset(x: -10)
                    
                    HStack {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(.yellow)
                        Text("8m shorter")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                
                }
                .position(x: geometry.size.width - 141, y: rectY + 35)
               
            }
            .zIndex(1000)
            
            GeometryReader { geometry in
                let totalHours: CGFloat = 36
                let hourHeight = geometry.size.height / totalHours
                let rectY = hourHeight * CGFloat(afternoonDipStart)
                let rectHeight = hourHeight * CGFloat(afternoonDipEnd - afternoonDipStart)
                let leftPadding: CGFloat = 0
                let rightPadding: CGFloat = 100
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: geometry.size.width - leftPadding - rightPadding, height: rectHeight - 3, alignment: .leading)
                    .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding - rightPadding / 2, y: rectY + rectHeight/2)
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
                .position(x: (geometry.size.width ) / 2 - 95, y: rectY + 35)
            }
            .zIndex(1000)
            
            GeometryReader { geometry in
                let totalHours: CGFloat = 36
                let hourHeight = geometry.size.height / totalHours
                let rectY = hourHeight * CGFloat(eveningPeakStart)
                let rectHeight = hourHeight * CGFloat(eveningPeakEnd - eveningPeakStart)
                let leftPadding: CGFloat = 0
                let rightPadding: CGFloat = 100
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: geometry.size.width - leftPadding - rightPadding, height: rectHeight - 3, alignment: .leading)
                    .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding - rightPadding / 2, y: rectY + rectHeight/2)
                    .shadow(radius: 6)
                
                Button(action: {
                    showPeakActivitiesSheet = true
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "figure.run")
                            .foregroundColor(.orange)
                            .padding(.leading, 4)
                        Text("Peak activities")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .bold()
                        Spacer()
                    }
                    .frame(width: 175)
                    .padding(.vertical, 2)
                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.init(uiColor: .systemGray5)))
                }
                .position(x: geometry.size.width  - 85, y: rectY + rectHeight/2)
                .sheet(isPresented: $showPeakActivitiesSheet) {
                    PeakActivitiesSheet()
                        .presentationDetents([.large])
                }
                    
                
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
                .position(x: (geometry.size.width ) / 2 - 95, y: rectY + 35)
            }
            .zIndex(1000)
            
            GeometryReader { geometry in
                let totalHours: CGFloat = 36
                let hourHeight = geometry.size.height / totalHours
                let rectY = hourHeight * CGFloat(windDownStart)
                let rectHeight = hourHeight * CGFloat(windDownEnd - windDownStart)
                let leftPadding: CGFloat = 0
                let rightPadding: CGFloat = 100
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                    .frame(width: geometry.size.width - leftPadding - rightPadding, height: rectHeight - 3, alignment: .leading)
                    .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding - rightPadding / 2, y: rectY + rectHeight/2)
                    .shadow(radius: 6)
                
                Button(action: {
                    showWindDownSheet = true
                }) {
                    HStack(spacing: 2) {
                        Image(systemName: "wind")
                            .foregroundColor(.orange)
                            .padding(.leading, 4)
                        Text("Wind-down activities")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .bold()
                        Spacer()
                    }
                    .frame(width: 175)
                    .padding(.vertical, 2)
                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.init(uiColor: .systemGray5)))
                }
                .position(x: geometry.size.width  - 85, y: rectY + rectHeight/2)
                .sheet(isPresented: $showWindDownSheet) {
                    WindDownSheet()
                        .presentationDetents([.large])
                }
                
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
                .position(x: (geometry.size.width ) / 2 - 105, y: rectY + 35)
            }
            .zIndex(1000)
            
            GeometryReader { geometry in
                let totalHours: CGFloat = 36
                let hourHeight = geometry.size.height / totalHours
                let rectY = hourHeight * CGFloat(melatoninWindowStart)
                let rectHeight = hourHeight * CGFloat(melatoninWindowEnd - melatoninWindowStart)
                let leftPadding: CGFloat = 0
                let rightPadding: CGFloat = 100
                
                Image(.melatonin)
                    .resizable()
                    .frame(width: geometry.size.width - leftPadding - rightPadding,
                           height: rectHeight - 8,
                           alignment: .leading)
                    .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding - rightPadding / 2,
                              y: rectY + rectHeight / 2 + 2)
                    .shadow(radius: 6)
                    .mask(
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: geometry.size.width - leftPadding - rightPadding,
                                   height: rectHeight - 8)
                            .position(x: (geometry.size.width - leftPadding) / 2 + leftPadding - rightPadding / 2,
                                      y: rectY + rectHeight / 2 + 2)
                    )
//                    .zIndex(-1)
                
                Button(action: {
                    showMelatoninWindowSheet = true
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "moon.haze")
                            .foregroundColor(.purple)
                            .padding(.leading, 4)
                        Text("Melatonin window")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .bold()
                        Spacer()
                    }
                   
                    .frame(width: 175)
                    .padding(.vertical, 2)
                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.init(uiColor: .systemGray5)))
                }
                .position(x: geometry.size.width  - 85, y: rectY + 13)
                .sheet(isPresented: $showMelatoninWindowSheet) {
                    MelatoninWindowSheet()
                        .presentationDetents([.large])
                }
               
               
              
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
                    .offset(x: 30)
                       
                }
                .position(x: (geometry.size.width ) / 2 - 75, y: rectY + 35)
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Sleep Need")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    
                        Text("8h 30m")
                            .font(.footnote)
                            .foregroundColor(.white)
                   
                       
                }
                .position(x: (geometry.size.width ) / 2 - 105, y: rectY + 35 + rectHeight - 4)
            }
            
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
            .zIndex(1000)
            
            GeometryReader { geometry in
                let hourHeight = geometry.size.height / 36
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 3, height: hourHeight * 36, alignment: .leading)
                    .foregroundStyle(.black)
                    .position(x: 34, y: hourHeight * 18)
                Spacer()
                
                UsageBarView()
                    .position(x: geometry.size.width - 48, y: 934)
            }
            
            GeometryReader { geometry in
                let hourHeight = geometry.size.height / 36
                VerticalSineWaveView()
                    .frame(height: hourHeight * 32, alignment: .leading)
                    .position(x: 190, y: hourHeight * 27 + 100)
                    .zIndex(1)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
