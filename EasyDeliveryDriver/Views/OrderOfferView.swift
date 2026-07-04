import SwiftUI

struct OrderOfferView: View {
    let order: DriverOrder
    let onAccept: () -> Void
    let onDecline: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "shippingbox.fill")
                .font(.system(size: 44))
                .foregroundStyle(.tint)
                .padding(.top, 20)

            Text("New Delivery Request")
                .font(.title2.bold())

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
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

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Items to pick up (\(order.items.count))")
                            .font(.headline)

                        ForEach(order.items) { item in
                            HStack {
                                Text("\(item.quantity)x \(item.name)")
                                Spacer()
                                Text(item.price * Double(item.quantity), format: .currency(code: "USD"))
                                    .foregroundStyle(.secondary)
                            }
                            .font(.subheadline)
                        }
                    }
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal)
                .padding(.vertical, 4)
            }

            HStack(spacing: 16) {
                Button("Decline", role: .cancel, action: onDecline)
                    .buttonStyle(.bordered)
                    .controlSize(.large)

                Button("Accept", action: onAccept)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

#Preview {
    OrderOfferView(order: SampleData.orders[0], onAccept: {}, onDecline: {})
}
