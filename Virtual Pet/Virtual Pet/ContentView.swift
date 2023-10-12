import SwiftUI

struct ContentView: View {
	@StateObject private var vm = ViewModel()
	private let timer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()
	
	var body: some View {
		Form {
			Section("Pet") {
				TextField("Name your pet!", text: $vm.pet.name)
				
				Image(vm.pet.happinessLevel == "Happy" || vm.pet.happinessLevel == "Feliz" ? "happy-pet-01" : "sad-pet")
					.resizable()
					.scaledToFill()
					.frame(width: 200, height: 200)
					.centerH()
				
				Text("Age: **\(vm.pet.ageDescription)**")
				Text("Status: **\(vm.pet.happinessLevel)**")
				Text("Hunger: **\(vm.pet.hunger)**")
				Text("Thirst: **\(vm.pet.thirst)**")
			}
			
			Section("Actions") {
				Button("Feed", action: vm.feed)
				Button("Give water", action: vm.giveWater)
			}
		}
		.onReceive(timer) {_ in
			vm.saveData()
		}
	}
}

#Preview ("Home") {
	ContentView()
}
