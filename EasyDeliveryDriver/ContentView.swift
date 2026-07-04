//
//  ContentView.swift
//  EasyDeliveryDriver
//
//  Created by Sameer Eismati on 7/3/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var auth: DriverAuthViewModel

    var body: some View {
        if auth.isLoggedIn {
            // The real home screen (going online, accepting orders, etc.) comes in a later part.
            VStack(spacing: 16) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(.green)
                Text("Logged in as \(auth.name)")
                    .font(.title3.bold())
                Button("Log Out", role: .destructive) {
                    auth.logout()
                }
            }
            .padding()
        } else {
            DriverLoginView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(DriverAuthViewModel())
}
