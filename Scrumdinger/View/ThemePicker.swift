//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Elliot Knight on 25/08/2022.
//

import SwiftUI

struct ThemePicker: View {
	@Binding var selection: Theme
    var body: some View {
		Picker("Theme", selection: $selection) {
			ForEach(Theme.allCases) { theme in
				Text(theme.rawValue)
					.tag(theme)
			}
		}
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
		ThemePicker(selection: .constant(.buttercup))
    }
}
