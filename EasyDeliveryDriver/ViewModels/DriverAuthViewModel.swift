import Foundation
import Combine

@MainActor
final class DriverAuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var name = ""
    @Published var email = ""

    func login(name: String, email: String) {
        self.name = name
        self.email = email
        isLoggedIn = true
    }

    func logout() {
        isLoggedIn = false
        name = ""
        email = ""
    }
}
