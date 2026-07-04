import Foundation
import Combine

@MainActor
final class DriverSessionViewModel: ObservableObject {
    @Published var isOnline = false

    func goOnline() {
        isOnline = true
    }

    func goOffline() {
        isOnline = false
    }
}
