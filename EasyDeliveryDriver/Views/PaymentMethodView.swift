import SwiftUI

struct PaymentMethodView: View {
    @ObservedObject var session: DriverSessionViewModel

    var body: some View {
        List {
            Section {
                HStack {
                    Text("Available Balance")
                    Spacer()
                    Text(session.todayEarnings, format: .currency(code: "USD"))
                        .bold()
                }
            }

            Section("How do you want to get your money?") {
                NavigationLink {
                    CheckPayoutView(session: session)
                } label: {
                    Label("Check", systemImage: "envelope.fill")
                }
            }
        }
        .navigationTitle("Get Paid")
    }
}

#Preview {
    NavigationStack {
        PaymentMethodView(session: DriverSessionViewModel())
    }
}
