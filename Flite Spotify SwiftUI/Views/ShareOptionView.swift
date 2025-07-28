import SwiftUI

struct ShareOptionView: View {
    let iconName: String?
    let appIconName: String?
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    // Convenience initializer for system icons
    init(systemIcon: String, title: String, backgroundColor: Color, action: @escaping () -> Void) {
        self.iconName = systemIcon
        self.appIconName = nil
        self.title = title
        self.backgroundColor = backgroundColor
        self.action = action
    }
    
    // Initializer for actual app icons
    init(appIcon: String, title: String, action: @escaping () -> Void) {
        self.iconName = nil
        self.appIconName = appIcon
        self.title = title
        self.backgroundColor = .clear
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                ZStack {
                    if let appIconName = appIconName {
                        // Create app icon with proper branding colors
                        RoundedRectangle(cornerRadius: 12)
                            .fill(appIconBackgroundColor(for: appIconName))
                            .frame(width: 56, height: 56)
                            .overlay(
                                appIconContent(for: appIconName)
                            )
                            .shadow(color: .black.opacity(0.15), radius: 1, x: 0, y: 1)
                    } else if let iconName = iconName {
                        // System icon with colored background
                        Circle()
                            .fill(backgroundColor)
                            .frame(width: 56, height: 56)
                        
                        Image(systemName: iconName)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.white)
                    }
                }
                
                Text(title)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(maxWidth: 60)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func appIconBackgroundColor(for appName: String) -> Color {
        switch appName {
        case "instagram_icon":
            return .white
        case "whatsapp_icon":
            return Color(red: 0.15, green: 0.68, blue: 0.38) // WhatsApp green
        case "snapchat_icon":
            return Color(red: 1.0, green: 0.98, blue: 0.0) // Snapchat yellow
        case "facebook_icon":
            return Color(red: 0.23, green: 0.35, blue: 0.60) // Facebook blue
        case "twitter_icon":
            return .black // X (Twitter) black
        case "tiktok_icon":
            return .black // TikTok black
        default:
            return .gray
        }
    }
    
    @ViewBuilder
    private func appIconContent(for appName: String) -> some View {
        switch appName {
        case "instagram_icon":
            // Instagram gradient camera icon
            RoundedRectangle(cornerRadius: 8)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0.79, green: 0.39, blue: 0.95), // Purple
                            Color(red: 0.98, green: 0.38, blue: 0.64), // Pink
                            Color(red: 0.96, green: 0.56, blue: 0.19)  // Orange
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 48, height: 48)
                .overlay(
                    Image(systemName: "camera")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                )
        case "whatsapp_icon":
            // WhatsApp chat bubble
            Image(systemName: "message.fill")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        case "snapchat_icon":
            // Snapchat ghost
            Image(systemName: "eye")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.black)
        case "facebook_icon":
            // Facebook 'f'
            Text("f")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
        case "twitter_icon":
            // X (Twitter) X symbol
            Text("𝕏")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
        case "tiktok_icon":
            // TikTok musical note
            Image(systemName: "music.note")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        default:
            Image(systemName: "app")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ScrollView(.horizontal) {
        HStack(spacing: 16) {
            ShareOptionView(
                systemIcon: "link",
                title: "Copy link",
                backgroundColor: .green
            ) {
                print("Copy link")
            }
            
            ShareOptionView(
                appIcon: "instagram_icon",
                title: "Instagram"
            ) {
                print("Instagram")
            }
            
            ShareOptionView(
                appIcon: "whatsapp_icon",
                title: "WhatsApp"
            ) {
                print("WhatsApp")
            }
            
            ShareOptionView(
                appIcon: "snapchat_icon",
                title: "Snapchat"
            ) {
                print("Snapchat")
            }
            
            ShareOptionView(
                appIcon: "facebook_icon",
                title: "Facebook"
            ) {
                print("Facebook")
            }
            
            ShareOptionView(
                appIcon: "twitter_icon",
                title: "X"
            ) {
                print("Twitter")
            }
        }
        .padding()
    }
} 