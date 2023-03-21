//
//  AppApp.swift
//  ExampleApp
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2023/03/14.
//

import SwiftUI

@main
struct ExampleApp: App {

    init() {
        SecretsVault.prepareVault(environmentName: "Dev")
        AnalyticsLogger.instance.info("App initialized")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
