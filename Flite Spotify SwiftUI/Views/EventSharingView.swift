import SwiftUI

struct EventSharingView: View {
    let event: Event
    @Environment(\.dismiss) private var dismiss
    @State private var showingShareSheet = false
    @State private var shareItem: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text("Share Event")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    // Balance the layout
                    Text("Cancel")
                        .opacity(0)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                
                // Event card centered in remaining space
                Spacer()
                
                EventCardView(event: event)
                    .scaleEffect(0.75)
                
                Spacer()
                
                // Sharing options pinned to bottom
                VStack(spacing: 16) {
                    Text("Share your event")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    // Scrollable horizontal row of sharing options
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 24) {
                            // Add some leading padding
                            Spacer()
                                .frame(width: 4)
                            
                            ShareOptionView(
                                systemIcon: "link",
                                title: "Copy link",
                                backgroundColor: .green
                            ) {
                                copyEventLink()
                            }
                            
                            ShareOptionView(
                                systemIcon: "message.fill",
                                title: "Messages",
                                backgroundColor: .blue
                            ) {
                                shareToMessages()
                            }
                            
                            ShareOptionView(
                                appIcon: "instagram_icon",
                                title: "Instagram"
                            ) {
                                shareToInstagram()
                            }
                            
                            ShareOptionView(
                                appIcon: "whatsapp_icon",
                                title: "WhatsApp"
                            ) {
                                shareToWhatsApp()
                            }
                            
                            ShareOptionView(
                                appIcon: "snapchat_icon",
                                title: "Snapchat"
                            ) {
                                shareToSnapchat()
                            }
                            
                            ShareOptionView(
                                appIcon: "facebook_icon",
                                title: "Facebook"
                            ) {
                                shareToFacebook()
                            }
                            
                            ShareOptionView(
                                appIcon: "twitter_icon",
                                title: "X"
                            ) {
                                shareToTwitter()
                            }
                            
                            ShareOptionView(
                                appIcon: "tiktok_icon",
                                title: "TikTok"
                            ) {
                                shareToTikTok()
                            }
                            
                            ShareOptionView(
                                systemIcon: "square.and.arrow.up",
                                title: "More",
                                backgroundColor: .gray
                            ) {
                                showMoreOptions()
                            }
                            
                            // Add some trailing padding
                            Spacer()
                                .frame(width: 4)
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.bottom, 30)
            }
            .background(Color(UIColor.systemBackground))
        }
        .sheet(isPresented: $showingShareSheet) {
            ActivityViewController(activityItems: [shareItem])
        }
    }
    
    // MARK: - Share Actions
    
    private func copyEventLink() {
        UIPasteboard.general.string = event.eventLink
        print("Event link copied: \(event.eventLink)")
    }
    
    private func shareToMessages() {
        shareItem = "Check out this event: \(event.shareableTitle)\n\(event.eventLink)"
        showingShareSheet = true
    }
    
    private func shareToInstagram() {
        // In a real app, this would generate and save the card image to photos
        // and then open Instagram stories
        print("Opening Instagram with event card")
    }
    
    private func shareToWhatsApp() {
        shareItem = "🎉 \(event.shareableTitle)\n📅 \(event.formattedDate)\n📍 \(event.city)\n\nJoin us! \(event.eventLink)"
        if let whatsappURL = URL(string: "whatsapp://send?text=\(shareItem.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") {
            if UIApplication.shared.canOpenURL(whatsappURL) {
                UIApplication.shared.open(whatsappURL)
            } else {
                showingShareSheet = true
            }
        }
    }
    
    private func shareToSnapchat() {
        print("Opening Snapchat with event card")
    }
    
    private func shareToFacebook() {
        print("Opening Facebook with event details")
    }
    
    private func shareToTwitter() {
        shareItem = "🎊 \(event.shareableTitle) on \(event.formattedDate) in \(event.city) \(event.eventLink)"
        showingShareSheet = true
    }
    
    private func shareToTikTok() {
        print("Opening TikTok with event card")
    }
    
    private func showMoreOptions() {
        shareItem = "🎊 \(event.shareableTitle)\n\n📅 \(event.formattedDate)\n📍 \(event.city)\n\nGet tickets: \(event.eventLink)"
        showingShareSheet = true
    }
}

// Helper view for native sharing
struct ActivityViewController: UIViewControllerRepresentable {
    let activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

#Preview {
    EventSharingView(event: Event.sampleEvents[0])
} 