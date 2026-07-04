import SwiftUI

struct DeliverView: View {
    @ObservedObject var session: DriverSessionViewModel

    var body: some View {
        NavigationStack {
            Group {
                switch session.state {
                case .offline:
                    OfflineView(goOnline: session.goOnline)

                case .searchingForOrder:
                    SearchingForOrderView(goOffline: session.goOffline)

                case .orderReceived(let order):
                    OrderOfferView(
                        order: order,
                        onAccept: { session.confirmOrder(order) },
                        onDecline: session.declineOrder
                    )

                case .drivingToPickup(let order):
                    TripMapView(
                        headline: "Driving to pickup",
                        originName: SampleData.driverHome.name,
                        originCoordinate: SampleData.driverHome.coordinate,
                        destinationName: order.pickup.name,
                        destinationCoordinate: order.pickup.coordinate,
                        driverCoordinate: session.driverCoordinate,
                        actionTitle: nil,
                        action: nil
                    )

                case .arrivedAtPickup(let order):
                    TripMapView(
                        headline: "Arrived at pickup",
                        originName: SampleData.driverHome.name,
                        originCoordinate: SampleData.driverHome.coordinate,
                        destinationName: order.pickup.name,
                        destinationCoordinate: order.pickup.coordinate,
                        driverCoordinate: order.pickup.coordinate,
                        actionTitle: "Picked Up",
                        action: { session.confirmPickup(order) }
                    )

                case .drivingToDropoff(let order):
                    TripMapView(
                        headline: "Driving to drop-off",
                        originName: order.pickup.name,
                        originCoordinate: order.pickup.coordinate,
                        destinationName: order.dropoff.name,
                        destinationCoordinate: order.dropoff.coordinate,
                        driverCoordinate: session.driverCoordinate,
                        actionTitle: nil,
                        action: nil
                    )

                case .arrivedAtDropoff(let order):
                    TripMapView(
                        headline: "Arrived at drop-off",
                        originName: order.pickup.name,
                        originCoordinate: order.pickup.coordinate,
                        destinationName: order.dropoff.name,
                        destinationCoordinate: order.dropoff.coordinate,
                        driverCoordinate: order.dropoff.coordinate,
                        actionTitle: "Delivered",
                        action: { session.confirmDelivered() }
                    )
                }
            }
            .navigationTitle("Easy Delivery Driver")
        }
    }
}

#Preview {
    DeliverView(session: DriverSessionViewModel())
        .environmentObject(DriverAuthViewModel())
}
