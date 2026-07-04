import SwiftUI

struct SearchingForOrderView: View {
    let goOffline: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            ProgressView()
                .controlSize(.large)
            Text("Looking for orders nearby…")
                .font(.title3.bold())
            Text("You're online. We'll notify you the moment a delivery request comes in.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            Button("Go Offline", role: .destructive, action: goOffline)
                .buttonStyle(.bordered)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    SearchingForOrderView(goOffline: {})
}
