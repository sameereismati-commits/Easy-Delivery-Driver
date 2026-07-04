import Foundation

enum DriverState: Equatable {
    case offline
    case searchingForOrder
    case orderReceived(DriverOrder)
    case delivering(DriverOrder)

    static func == (lhs: DriverState, rhs: DriverState) -> Bool {
        switch (lhs, rhs) {
        case (.offline, .offline), (.searchingForOrder, .searchingForOrder):
            return true
        case let (.orderReceived(a), .orderReceived(b)):
            return a.id == b.id
        case let (.delivering(a), .delivering(b)):
            return a.id == b.id
        default:
            return false
        }
    }
}
