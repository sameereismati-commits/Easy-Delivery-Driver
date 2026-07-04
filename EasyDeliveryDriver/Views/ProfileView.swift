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

#Preview {
    ProfileView(session: DriverSessionViewModel())
        .environmentObject(DriverAuthViewModel())
}
