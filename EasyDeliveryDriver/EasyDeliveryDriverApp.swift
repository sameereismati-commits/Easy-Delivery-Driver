//
//  EasyDeliveryDriverApp.swift
//  EasyDeliveryDriver
//
//  Created by Sameer Eismati on 7/3/26.
//

import SwiftUI

@main
struct EasyDeliveryDriverApp: App {
    @StateObject private var auth = DriverAuthViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(auth)
        }
    }
}
