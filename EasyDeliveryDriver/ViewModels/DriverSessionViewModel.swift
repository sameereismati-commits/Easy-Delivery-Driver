import Foundation
import CoreLocation
import Combine

@MainActor
final class DriverSessionViewModel: ObservableObject {
    @Published var state: DriverState = .offline
    @Published var driverCoordinate: CLLocationCoordinate2D = SampleData.driverHome.coordinate

    private var tripTask: Task<Void, Never>?
    private var nextOrderIndex = 0

    func goOnline() {
        state = .searchingForOrder
        requestNewOrder()
    }

    func goOffline() {
        tripTask?.cancel()
        state = .offline
    }

    func declineOrder() {
        state = .searchingForOrder
        requestNewOrder()
    }

    func confirmOrder(_ order: DriverOrder) {
        state = .drivingToPickup(order)
        startTrip(from: SampleData.driverHome.coordinate, to: order.pickup.coordinate) { [weak self] in
            self?.state = .arrivedAtPickup(order)
        }
    }

    func confirmPickup(_ order: DriverOrder) {
        state = .drivingToDropoff(order)
        startTrip(from: order.pickup.coordinate, to: order.dropoff.coordinate) { [weak self] in
            self?.state = .arrivedAtDropoff(order)
        }
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

    private func startTrip(
        from start: CLLocationCoordinate2D,
        to end: CLLocationCoordinate2D,
        onArrival: @escaping () -> Void
    ) {
        tripTask?.cancel()
        driverCoordinate = start

        let steps = 50
        let totalDuration = 5.0
        let stepDuration = totalDuration / Double(steps)

        tripTask = Task { [weak self] in
            for step in 1...steps {
                try? await Task.sleep(nanoseconds: UInt64(stepDuration * 1_000_000_000))
                guard let self, !Task.isCancelled else { return }
                let t = Double(step) / Double(steps)
                self.driverCoordinate = CLLocationCoordinate2D(
                    latitude: start.latitude + (end.latitude - start.latitude) * t,
                    longitude: start.longitude + (end.longitude - start.longitude) * t
                )
            }
            guard !Task.isCancelled else { return }
            onArrival()
        }
    }
}
