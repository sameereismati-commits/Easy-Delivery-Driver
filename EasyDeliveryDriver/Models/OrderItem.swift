import Foundation

struct OrderItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let quantity: Int
}
