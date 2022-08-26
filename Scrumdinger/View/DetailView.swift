//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Elliot Knight on 25/08/2022.
//

import SwiftUI

struct DetailView: View {
	@Binding var scrum: DailyScrum
	@State private var data = DailyScrum.Data()

	@State private var isPresentingEditingView = false


	var body: some View {
		List {
			Section(header: Text("Meeting infos")) {
				NavigationLink(destination: MeetingView(scrum: $scrum)) {
					Label("Start Meeting", systemImage: "timer")
						.font(.headline)
						.foregroundColor(.blue)
				}
				HStack {
					Label("Lenght", systemImage: "clock")
					Spacer()
					Text("\(scrum.lengthInMinutes) minutes")
				}
				.accessibilityElement(children: .combine)

				HStack {
					Label("Theme", systemImage: "paintpalette")
					Spacer()
					Text(scrum.theme.name)
						.padding(5)
						.foregroundColor(scrum.theme.accentColor)
						.background(scrum.theme.mainColor)
						.cornerRadius(5)
				}
				.accessibilityElement(children: .combine)

			}
			Section(header: Text("Attendee")) {
				ForEach(scrum.attendees) { attendee in
					Label("\(attendee.name)", systemImage: "person")
				}
			}
			.navigationTitle(scrum.title)
			.toolbar {
				Button("Edit") {
					self.isPresentingEditingView = true
					data = scrum.data
				}

			}.sheet(isPresented: $isPresentingEditingView) {
				NavigationView {
					DetailEditView(data: $data)
						.navigationTitle(scrum.title)
						.toolbar {
							ToolbarItem(placement: .cancellationAction) {
								Button("Cancel") {
									self.isPresentingEditingView = false
								}
							}
							ToolbarItem(placement: .confirmationAction) {
								Button("Done") {
									isPresentingEditingView = false
									scrum.update(from: data)
								}
							}
						}
				}
			}
		}
	}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			DetailView(scrum: .constant(DailyScrum.sampleData[0]))
		}
	}
}
