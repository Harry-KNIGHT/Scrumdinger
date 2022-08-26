//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Elliot Knight on 25/08/2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
	@State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
			NavigationView {
			ScrumsView(scurms: $scrums)
			}
        }
    }
}
