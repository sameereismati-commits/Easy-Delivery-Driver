import SwiftUI

struct OrderOfferView: View {
    let order: DriverOrder
    let onAccept: () -> Void
    let onDecline: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Image(systemName: "shippingbox.fill")
                .font(.system(size: 50))
                .foregroundStyle(.tint)

            Text("New Delivery Request")
                .font(.title2.bold())

            VStack(alignment: .leading, spacing: 12) {
                Label(order.pickup.name, systemImage: "mappin.circle.fill")
                Label(order.dropoff.name, systemImage: "flag.checkered")
                HStack {
                    Text("Payout")
                    Spacer()
                    Text(order.payout, format: .currency(code: "USD"))
                        .bold()
                }
            }
            .padding()
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)

            HStack(spacing: 16) {
                Button("Decline", role: .cancel, action: onDecline)
                    .buttonStyle(.bordered)
                    .controlSize(.large)

                Button("Accept", action: onAccept)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    OrderOfferView(order: SampleData.orders[0], onAccept: {}, onDecline: {})
}
