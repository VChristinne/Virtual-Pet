//
//  HeartView.swift
//  Virtual Pet
//
//  Created by Vanessa Christinne on 16/10/23.
//

import SwiftUI

struct HeartView: View {
	@StateObject private var vm = PetViewModel()
	
    var body: some View {
		HStack {
			ForEach(0..<3, id: \.self) { _ in
				Image(systemName: "heart.fill")
					.resizable()
					.scaledToFit()
					.foregroundStyle(
						vm.pet.happinessLevel == "Happy" || vm.pet.happinessLevel == "Feliz" ? .white : .gray
					)
					//.symbolEffect(.pulse)
					.frame(width: 45)
			}
		}
		.padding(.top, -100)
    }
}

#Preview ("Hearts") {
    PetView()
}
