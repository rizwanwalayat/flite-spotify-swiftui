//
//  ContentView.swift
//  Flite Spotify SwiftUI
//
//  Created by Techtiz PM on 29/07/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showingEventSharing = false
    @State private var selectedEvent = Event.sampleEvents[0]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // App branding
                VStack(spacing: 16) {
                    Text("Flite")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                    
                    Text("Event Sharing Demo")
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
                
                // Sample events list
                VStack(spacing: 16) {
                    Text("Sample Events")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    ForEach(Event.sampleEvents) { event in
                        EventRowView(event: event) {
                            selectedEvent = event
                            showingEventSharing = true
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Main share button
                Button(action: {
                    showingEventSharing = true
                }) {
                    HStack(spacing: 12) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title2)
                        Text("Share Event")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 16)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.purple]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(25)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Flite Events")
            .navigationBarTitleDisplayMode(.inline)
        }
        .fullScreenCover(isPresented: $showingEventSharing) {
            EventSharingView(event: selectedEvent)
        }
    }
}

struct EventRowView: View {
    let event: Event
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                // Event icon
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.orange.gradient)
                    .frame(width: 50, height: 50)
                    .overlay(
                        Image(systemName: "calendar.badge.clock")
                            .foregroundColor(.white)
                            .font(.title3)
                    )
                
                // Event details
                VStack(alignment: .leading, spacing: 4) {
                    Text(event.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    
                    Text("\(event.city) • \(event.formattedDate)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            .padding(16)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ContentView()
}
