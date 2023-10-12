import Foundation
import SwiftUI

func calcTimeSince(date: Date) -> Int {
	let seconds = Int(-date.timeIntervalSinceNow)  // always positive
	return seconds
}

extension View {
	func centerH() -> some View {
		HStack {
			Spacer()
			self
			Spacer()
		}
	}
}
