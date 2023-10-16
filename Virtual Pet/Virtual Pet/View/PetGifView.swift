import SwiftUI
import FLAnimatedImage

struct PetGifView: View {
	@StateObject private var vm = PetViewModel()
	private let timer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()
	
	var body: some View {
		
		// MARK: HEARTS ICON
		HStack {
			ForEach(0..<3, id: \.self) { _ in
				Image(systemName: "heart.fill")
					.resizable()
					.scaledToFit()
					.foregroundStyle(vm.pet.happinessLevel == "Happy" || vm.pet.happinessLevel == "Feliz" ? .white : .gray)
					.symbolEffect(.pulse)
					.frame(width: 45)
			}
		}
		.padding(.top, 100)
		
		// MARK: STATUS
		VStack {
			Text("Age: **\(vm.pet.ageDescription)**")
			Text("Status: **\(vm.pet.happinessLevel)**")
			Text("Hunger: **\(vm.pet.hunger)**")
			Text("Thirst: **\(vm.pet.thirst)**")
			Text("Health: **\(vm.pet.sick)**")
		}
		.padding(.top)
		
		.onReceive(timer) {_ in
			vm.saveData()
		}
		
		// MARK: GIF PET
		ZStack {
			//TextField("Name your pet!", text: $vm.pet.name)
			
			if (vm.pet.happinessLevel == "Happy" || vm.pet.happinessLevel == "Feliz") {
				if let url = URL(string: "https://github.com/VChristinne/Virtual-Pet/raw/main/Pet/happy-pet.gif") {
					GeometryReader { geometry in
						GifView(url: url)
							.scaledToFill()
							.frame(width: 100, height: 300)
					}
					.aspectRatio(contentMode: .fit)
					.frame(width: 120, height: 80)
					.shadow(radius: 10)
					.padding(.top, 100)  // pet posY
				}
			}
			
			if (vm.pet.happinessLevel == "Unhappy" || vm.pet.happinessLevel == "Triste") {
				if let url = URL(string: "https://github.com/VChristinne/Virtual-Pet/raw/main/Pet/unhappy-pet.gif") {
					GeometryReader { geometry in
						GifView(url: url)
							.scaledToFill()
							.frame(width: 100, height: 300)
					}
					.aspectRatio(contentMode: .fit)
					.frame(width: 120, height: 80)
					.shadow(radius: 10)
					.padding(.top, 100)  // pet posY
				}
			}
			
			if (vm.pet.happinessLevel == "Sick" || vm.pet.happinessLevel == "Doente") {
				if let url = URL(string: "https://github.com/VChristinne/Virtual-Pet/raw/main/Pet/sad-pet.gif") {
					GeometryReader { geometry in
						GifView(url: url)
							.scaledToFill()
							.frame(width: 100, height: 300)
					}
					.aspectRatio(contentMode: .fit)
					.frame(width: 120, height: 80)
					.shadow(radius: 10)
					.padding(.top, 100)  // pet posY
				}
			}

		}		
		.ignoresSafeArea(edges: .all)
		
		// MARK: ACTION BUTTONS
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
			
			Button(action: vm.giveMedicine) {
				Image(systemName: "cross.case.fill")
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
		.position(CGPoint(x: UIScreen.main.bounds.width / 2, y: 360.0))
	}
}
