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
            DriverHomeView()
        } else {
            DriverLoginView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(DriverAuthViewModel())
}
