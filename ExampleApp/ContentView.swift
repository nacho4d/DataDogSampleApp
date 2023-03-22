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
            Button("Log it!") {
                AnalyticsLogger.instance.warn(
                    "Hello world button pressed",
                    attributes: ["user_id" : "12345",
                                 "view": "ContentView",
                                 "event_id": "BTN01"])
            }
            Button("Crash it!") {
                let array = [0,1,2]
                let _ = array[3]
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
