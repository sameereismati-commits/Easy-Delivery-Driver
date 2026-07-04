import SwiftUI

struct DeliveringView: View {
    let order: DriverOrder
    let onDelivered: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Image(systemName: "shippingbox.fill")
                .font(.system(size: 50))
                .foregroundStyle(.tint)

            Text("Delivering order…")
                .font(.title2.bold())

            VStack(alignment: .leading, spacing: 8) {
                Label(order.pickup.name, systemImage: "mappin.circle")
                Label(order.dropoff.name, systemImage: "flag.checkered")
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)

            Text("A live pickup/drop-off map is coming in a later part.")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            Button("Mark Delivered", action: onDelivered)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    DeliveringView(order: SampleData.orders[0], onDelivered: {})
}
