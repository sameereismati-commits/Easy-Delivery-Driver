import Foundation

struct DriverOrder: Identifiable {
    let id = UUID()
    let pickup: StoreLocation
    let dropoff: StoreLocation
    let payout: Double
}
