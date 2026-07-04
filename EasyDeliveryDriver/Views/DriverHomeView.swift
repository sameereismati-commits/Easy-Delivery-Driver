import SwiftUI

struct DriverHomeView: View {
    @StateObject private var session = DriverSessionViewModel()
    @EnvironmentObject private var auth: DriverAuthViewModel

    var body: some View {
        NavigationStack {
            Group {
                if session.isOnline {
                    SearchingForOrderView(goOffline: session.goOffline)
                } else {
                    OfflineView(goOnline: session.goOnline)
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
