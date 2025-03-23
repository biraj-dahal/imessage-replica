//
//  iMessage_replicaApp.swift
//  iMessage replica
//
//  Created by Biraj Dahal on 3/12/25.
//

import SwiftUI
import FirebaseCore

@main
struct ImessageReplica: App {

    @State private var authManager: AuthManager 

    init() {
        FirebaseApp.configure()
        authManager = AuthManager()
    }

    var body: some Scene {
        WindowGroup {
            if authManager.user != nil {
                ChatView()
                    .environment(authManager)
            } else {

                LoginView()
                    .environment(authManager)
            }
        }
    }
}
