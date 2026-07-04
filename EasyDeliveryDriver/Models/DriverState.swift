import Foundation

enum DriverState: Equatable {
    case offline
    case searchingForOrder
    case orderReceived(DriverOrder)
    case drivingToPickup(DriverOrder)
    case arrivedAtPickup(DriverOrder)
    case drivingToDropoff(DriverOrder)
    case arrivedAtDropoff(DriverOrder)

    static func == (lhs: DriverState, rhs: DriverState) -> Bool {
        switch (lhs, rhs) {
        case (.offline, .offline), (.searchingForOrder, .searchingForOrder):
            return true
        case let (.orderReceived(a), .orderReceived(b)):
            return a.id == b.id
        case let (.drivingToPickup(a), .drivingToPickup(b)):
            return a.id == b.id
        case let (.arrivedAtPickup(a), .arrivedAtPickup(b)):
            return a.id == b.id
        case let (.drivingToDropoff(a), .drivingToDropoff(b)):
            return a.id == b.id
        case let (.arrivedAtDropoff(a), .arrivedAtDropoff(b)):
            return a.id == b.id
        default:
            return false
        }
    }
}
