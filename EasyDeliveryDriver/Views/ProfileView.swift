import SwiftUI

struct ProfileView: View {
    @ObservedObject var session: DriverSessionViewModel
    @EnvironmentObject private var auth: DriverAuthViewModel

    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(auth.name)
                            .font(.title3.bold())
                        Text(auth.email)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 4)
                }

                Section("Today") {
                    StatRow(title: "Earnings", value: session.todayEarnings.formatted(.currency(code: "USD")))
                    StatRow(title: "Miles Delivered", value: String(format: "%.1f mi", session.totalMilesDelivered))
                }

                Section {
                    Button("Log Out", role: .destructive) {
                        session.goOffline()
                        auth.logout()
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

private struct StatRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ProfileView(session: DriverSessionViewModel())
        .environmentObject(DriverAuthViewModel())
}
