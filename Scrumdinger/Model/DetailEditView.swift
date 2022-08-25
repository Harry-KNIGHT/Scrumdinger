//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Elliot Knight on 25/08/2022.
//

import SwiftUI

struct DetailEditView: View {
	@Binding public var data: DailyScrum.Data
	@State private var newAttendeeName: String = ""
	var body: some View {
		Form {
			Section(header: Text("Meeting Info")) {
				TextField("Title", text: $data.title)

				HStack {
					Slider(value: $data.lengthInMinutes, in: 0...40) {
						Text("Lenght")
					}
					.accessibilityValue("\(data.lengthInMinutes) minutes")
					Spacer()
					Text("\(Int(data.lengthInMinutes)) minutes")
						.accessibilityHidden(true)
				}
			}

			ThemePicker(selection: $data.theme)
			Section(header: Text("Attendees")) {
				ForEach(data.attendees) { attendee in
					Text(attendee.name)
				}
				.onDelete { indice in
					data.attendees.remove(atOffsets: indice)
				}
				HStack {
					TextField("John Doe", text: $newAttendeeName)
					Spacer()
					Button(action: {
						withAnimation {
							let attendee = DailyScrum.Attendee(name: newAttendeeName)
							data.attendees.append(attendee)
							newAttendeeName = ""
						}
					}, label: {
						Image(systemName: "plus.circle.fill")
							.accessibilityLabel("Add attendee")
					})
					.disabled(newAttendeeName.isEmpty)
				}
			}
		}
	}
}

struct DetailEditView_Previews: PreviewProvider {
	static var previews: some View {
		DetailEditView(data: .constant(DailyScrum.sampleData[0].data))
	}
}
