//
//  ContentView.swift
//  ExampleApp
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2023/03/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Log it!", action: {
                AnalyticsLogger.instance.warn(
                    "Hello world button pressed",
                    attributes: ["user_id" : "12345",
                                 "view": "ContentView",
                                 "event_id": "BTN01"])
            })
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            Button("Crash it!", action: {
                let array = [0,1,2]
                let _ = array[3]
            })
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
