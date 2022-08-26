//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Elliot Knight on 25/08/2022.
//

import SwiftUI

struct ScrumsView: View {
	@Binding var scurms: [DailyScrum]
	var body: some View {
		List {
			ForEach($scurms) { $scrum in
				NavigationLink(destination: DetailView(scrum: $scrum)) {
					CardView(scrum: scrum)
				}
				.listRowBackground(scrum.theme.mainColor)

			}
		}
		.navigationTitle("Daily scrums")
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button(action: {}, label: {
					Image(systemName: "plus")
				})
				.accessibilityLabel("New scrum")
			}
		}
	}
}

struct ScrumsView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			ScrumsView(scurms: .constant(DailyScrum.sampleData))
		}
	}
}
