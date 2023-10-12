import Foundation
import SwiftUI

extension ContentView {
	class ViewModel: ObservableObject {
		
		@Published var pet: Pet
		private var repository = PetData()
		
		init() {
			// Load the initial data
			pet = repository.loadData()
		}
		
		func saveData() {
			objectWillChange.send()
			repository.saveData(pet: pet)
		}
		
		func feed() {
			pet.lastMeal = Date()
			saveData()
		}
		
		func giveWater() {
			pet.lastDrink = Date()
			saveData()
		}
	}
}
