//
//  LexxiStoreApp.swift
//  LexxiStore
//
//  Created by Yerasyl on 02.05.2024.
//

import SwiftUI
import Firebase

@main
struct LexxiStoreApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
