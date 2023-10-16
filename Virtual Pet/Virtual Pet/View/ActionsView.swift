//
//  ActionsView.swift
//  Virtual Pet
//
//  Created by Vanessa Christinne on 16/10/23.
//

import SwiftUI

struct ActionsView: View {
	@StateObject private var vm = PetViewModel()
	
    var body: some View {
		HStack(spacing: 20) {
			Button(action: vm.feed) {
				Image(systemName: "fish.fill")
					.resizable()
					.scaledToFit()
					.frame(width: 50, height: 50)
					.padding(10)
					.background(Color.white)
					.clipShape(Circle())
					.overlay(Circle().stroke(Color.black, lineWidth: 1))
			}
			
			Button(action: vm.giveWater) {
				Image(systemName: "waterbottle.fill")
					.resizable()
					.scaledToFit()
					.frame(width: 50, height: 50)
					.padding(10)
					.background(Color.white)
					.clipShape(Circle())
					.overlay(Circle().stroke(Color.black, lineWidth: 1))
			}
		}
		.tint(.blue)
		.padding(10)
		.background(.thinMaterial)
		.clipShape(Capsule())
		.padding(.top, 180)
    }
}

#Preview {
    PetView()
}
