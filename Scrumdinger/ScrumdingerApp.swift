//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Elliot Knight on 25/08/2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
			NavigationView {
			ScrumsView(scurms: DailyScrum.sampleData)
			}
        }
    }
}
