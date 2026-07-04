import Foundation
import Combine

@MainActor
final class DriverSessionViewModel: ObservableObject {
    @Published var state: DriverState = .offline

    private var nextOrderIndex = 0

    func goOnline() {
        state = .searchingForOrder
        requestNewOrder()
    }

    func goOffline() {
        state = .offline
    }

    func declineOrder() {
        state = .searchingForOrder
        requestNewOrder()
    }

    func confirmOrder(_ order: DriverOrder) {
        state = .delivering(order)
    }

    func confirmDelivered() {
        state = .searchingForOrder
        requestNewOrder()
    }

    private func requestNewOrder() {
        Task { [weak self] in
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            guard let self, !Task.isCancelled, self.state == .searchingForOrder else { return }
            let order = SampleData.orders[self.nextOrderIndex % SampleData.orders.count]
            self.nextOrderIndex += 1
            self.state = .orderReceived(order)
        }
    }
}
