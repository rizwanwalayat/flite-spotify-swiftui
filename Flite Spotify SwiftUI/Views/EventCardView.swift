import SwiftUI

struct EventCardView: View {
    let event: Event
    @State private var cardImage: UIImage?
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black.opacity(0.4)]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack(spacing: 0) {
                // Event Name at the top
                Text(event.name)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.top, 30)
                
                Spacer()
                
                // Main flyer/image section
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.orange.gradient)
                        .frame(width: 280, height: 340)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    VStack(spacing: 12) {
                        // Flyer placeholder (in real app, this would be the actual flyer image)
                        RoundedRectangle(cornerRadius: 15)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.orange, Color.red.opacity(0.8)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 240, height: 220)
                            .overlay(
                                VStack {
                                    Image(systemName: "calendar.badge.clock")
                                        .font(.system(size: 40))
                                        .foregroundColor(.white)
                                    Text("EVENT")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                }
                            )
                        
                        // Event details overlay
                        VStack(spacing: 8) {
                            Text(event.name)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                            
                            Text(event.organizerInstagram)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white.opacity(0.9))
                            
                            HStack(spacing: 16) {
                                VStack(alignment: .leading, spacing: 2) {
                                    Image(systemName: "calendar")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.8))
                                    Text(event.formattedDate)
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.white)
                                }
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Image(systemName: "location")
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.8))
                                    Text(event.city)
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .padding(20)
                }
                
                Spacer()
                
                // Flite branding at bottom
                HStack {
                    Text("Flite")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 30)
            }
        }
        .frame(width: 320, height: 568) // Instagram story dimensions
        .background(Color.black)
        .cornerRadius(20)
    }
}

#Preview {
    EventCardView(event: Event.sampleEvents[0])
} 