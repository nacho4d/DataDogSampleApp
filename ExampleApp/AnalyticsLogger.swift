//
//  AnalyticsLogger.swift
//  ExampleApp
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2023/03/14.
//

import Foundation
import Datadog

/// Logger and Crash report getter tool for analysis
class AnalyticsLogger {

    static let instance = AnalyticsLogger()

    private let ddLogger: DDLogger

    /// Initializer
    init() {
        /// Initialize Datadog
        Datadog.initialize(
            appContext: .init(),
            trackingConsent: .granted,
            configuration: Datadog.Configuration
                .builderUsing(clientToken: SecretsVault.current.datadogClientToken, environment: "dev1")
                .build()
        )

        /// Initialize logger
        ddLogger = DDLogger.builder
            .sendNetworkInfo(true)
            .sendLogsToDatadog(true)
            .set(loggerName: "Analytics")
            .set(serviceName: "ExampleApp")
            .printLogsToConsole(true, usingFormat: .shortWith(prefix: "[Datadog] "))
            .build()
    }

    /// Sends an INFO log message.
    /// - Parameters:
    ///   - message: the message to be logged
    ///   - error: `Error` instance to be logged with its properties
    ///   - attributes: a dictionary of attributes to add for this message. If an attribute with
    /// the same key already exist in this logger, it will be overridden (just for this message).
    public func info(_ message: StaticString, error: Error? = nil, attributes: [AttributeKey: AttributeValue]? = nil) {
        ddLogger.info(message.description, error: error, attributes: attributes)
    }

    /// Sends a WARN log message.
    /// - Parameters:
    ///   - message: the message to be logged
    ///   - error: `Error` instance to be logged with its properties
    ///   - attributes: a dictionary of attributes to add for this message. If an attribute with
    /// the same key already exist in this logger, it will be overridden (just for this message).
    public func warn(_ message: StaticString, error: Error? = nil, attributes: [AttributeKey: AttributeValue]? = nil) {
        ddLogger.warn(message.description, error: error, attributes: attributes)
    }

    /// Sends an ERROR log message.
    /// - Parameters:
    ///   - message: the message to be logged
    ///   - error: `Error` instance to be logged with its properties
    ///   - attributes: a dictionary of attributes to add for this message. If an attribute with
    /// the same key already exist in this logger, it will be overridden (just for this message).
    public func error(_ message: StaticString, error: Error? = nil, attributes: [AttributeKey: AttributeValue]? = nil) {
        ddLogger.error(message.description, error: error, attributes: attributes)
    }
}
