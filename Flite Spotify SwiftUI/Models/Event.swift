import Foundation

struct Event: Identifiable {
    let id = UUID()
    let name: String
    let flyerImageName: String
    let organizerInstagram: String
    let date: Date
    let city: String
    let venue: String?
    let eventLink: String
    
    // Sample data for demonstration
    static let sampleEvents = [
        Event(
            name: "ZEN & TONIC YOGA",
            flyerImageName: "zen_tonic_flyer",
            organizerInstagram: "@NuggetAtNight",
            date: Calendar.current.date(from: DateComponents(year: 2024, month: 7, day: 23, hour: 18, minute: 30)) ?? Date(),
            city: "Tampa, FL",
            venue: "Hula Bay",
            eventLink: "https://flite.app/events/zen-tonic-23"
        ),
        Event(
            name: "SUMMER VIBES FESTIVAL",
            flyerImageName: "summer_vibes_flyer",
            organizerInstagram: "@SummerVibesOfficial",
            date: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 15, hour: 19, minute: 0)) ?? Date(),
            city: "Miami, FL",
            venue: "Bayfront Park",
            eventLink: "https://flite.app/events/summer-vibes"
        )
    ]
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, h:mm a"
        return formatter.string(from: date)
    }
    
    var shareableTitle: String {
        return "\(name) - \(city)"
    }
} 