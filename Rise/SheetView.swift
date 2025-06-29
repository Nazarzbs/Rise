//
//  SheetView.swift
//  Rise
//
//  Created by Nazar on 29/6/25.
//
import SwiftUI

struct SheetView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Main content area
            HStack {
                // Left button - Home/Up arrow
                Button(action: {}) {
                    Image(systemName: "chevron.up")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .frame(width: 44, height: 44)
                }
                
                Spacer()
                
                // Center content
                HStack(spacing: 16) {
                    // Refresh button with plus badge
                    Spacer()
                        Button(action: {}) {
                            Image(systemName: "alarm")
                                .font(.title2)
                                .foregroundColor(.gray)
                        }
                    
                    // Auto label with lightning bolt
                    HStack(spacing: 6) {
                        Image(systemName: "zzz")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("Auto")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(Color.gray.opacity(0.3))
                    )
                }
                
                Spacer()
                
                // Right button - Plus
                Button(action: {}) {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .frame(width: 44, height: 44)
                }
            }
            
            .padding(.horizontal, 16)
            
        }
        .background(Color.clear)
    }
}
