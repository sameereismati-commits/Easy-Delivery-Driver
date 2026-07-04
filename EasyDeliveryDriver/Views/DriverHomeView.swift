import SwiftUI

struct DriverHomeView: View {
    @StateObject private var session = DriverSessionViewModel()
    @EnvironmentObject private var auth: DriverAuthViewModel

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

                case .delivering(let order):
                    DeliveringView(order: order, onDelivered: session.confirmDelivered)
                }
            }
            .navigationTitle("Easy Delivery Driver")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Log Out") {
                        session.goOffline()
                        auth.logout()
                    }
                }
            }
        }
    }
}

#Preview {
    DriverHomeView()
        .environmentObject(DriverAuthViewModel())
}
