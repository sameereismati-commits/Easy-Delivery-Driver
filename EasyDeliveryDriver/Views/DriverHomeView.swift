import SwiftUI

struct DriverHomeView: View {
    @StateObject private var session = DriverSessionViewModel()

    var body: some View {
        TabView {
            DeliverView(session: session)
                .tabItem {
                    Label("Deliver", systemImage: "car.fill")
                }

            ProfileView(session: session)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    DriverHomeView()
        .environmentObject(DriverAuthViewModel())
}
