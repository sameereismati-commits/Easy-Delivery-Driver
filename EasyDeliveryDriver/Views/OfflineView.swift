import SwiftUI

struct OfflineView: View {
    let goOnline: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "moon.zzz.fill")
                .font(.system(size: 50))
                .foregroundStyle(.secondary)
            Text("You're offline")
                .font(.title2.bold())
            Text("Go online to start receiving delivery orders.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            Button("Go Online", action: goOnline)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    OfflineView(goOnline: {})
}
