//
//  SecretsVault.swift
//  ExampleApp
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2023/03/14.
//

import Foundation

struct SecretsVault {

    static public func prepareVault(environmentName name: String) {
        // TODO: Read secrets for `name` environment and set instance
        current = SecretsVault(storage: [
        ])
    }

    static private (set) public var current: SecretsVault!

    private var storage: [String: String]

    private func salt(unsaltedValue: String) -> String {
        // do salt here
        return unsaltedValue
    }

    private func unsalt(saltedValue: String) -> String {
        // do unsalt here
        return saltedValue
    }

    private init(storage: [String: String]) {
        self.storage = storage
    }

}

extension SecretsVault {
    var dataDogRumApplicationId: String {
        unsalt(saltedValue: storage["dataDogRumApplicationId"]!)
    }
    var datadogClientToken: String {
        unsalt(saltedValue: storage["datadogClientToken"]!)
    }
    var datadogEnvironment: String {
        unsalt(saltedValue: storage["datadogEnvironment"]!)
    }
}
