import SwiftUI

struct CheckPayoutView: View {
    @ObservedObject var session: DriverSessionViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""
    @State private var street = ""
    @State private var city = ""
    @State private var zipCode = ""
    @State private var didRequestCheck = false

    private var isValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty
            && !street.trimmingCharacters(in: .whitespaces).isEmpty
            && !city.trimmingCharacters(in: .whitespaces).isEmpty
            && zipCode.count == 5 && zipCode.allSatisfy(\.isNumber)
    }

    var body: some View {
        Form {
            Section("Mailing Address") {
                TextField("Full Name", text: $name)
                TextField("Street Address", text: $street)
                TextField("City", text: $city)
                TextField("ZIP Code", text: $zipCode)
                    .keyboardType(.numberPad)
            }

            Section {
                HStack {
                    Text("Amount")
                    Spacer()
                    Text(session.todayEarnings, format: .currency(code: "USD"))
                        .bold()
                }
            }

            Section {
                Button("Request Check") {
                    session.cashOut()
                    didRequestCheck = true
                }
                .disabled(!isValid || session.todayEarnings <= 0)
            }
        }
        .navigationTitle("Check")
        .alert("Check Requested", isPresented: $didRequestCheck) {
            Button("OK") { dismiss() }
        } message: {
            Text("Your check will be mailed to \(street), \(city) \(zipCode) and should arrive within a few business days.")
        }
    }
}

#Preview {
    NavigationStack {
        CheckPayoutView(session: DriverSessionViewModel())
    }
}
