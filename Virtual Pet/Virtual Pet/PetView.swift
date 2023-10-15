import SwiftUI
import FLAnimatedImage

struct PetView: View {
	@State var isActive = true
	@StateObject private var vm = ViewModel()
	private let timer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()
	
	var body: some View {
		
		ZStack {
			
			LinearGradient(colors: [Color("Bubblegum-Magenta"),
									Color("Lavander-Grape"),
									Color("Orchid-Blueberry")],
						   startPoint: .top,
						   endPoint: .bottom)
			
			//TextField("Name your pet!", text: $vm.pet.name)
			
			VStack {
				
				HStack {
					ForEach(0..<3, id: \.self) { _ in
						Image(systemName: "heart.fill")
							.resizable()
							.scaledToFit()
							.foregroundStyle(vm.pet.happinessLevel == "Happy" || vm.pet.happinessLevel == "Feliz" ? .white : .gray)
							//.symbolEffect(.pulse)
							.frame(width: 45)
							.padding(.top, -120)
					}
				}
				
				
				if (vm.pet.happinessLevel == "Happy" || vm.pet.happinessLevel == "Feliz") {
					if let url = URL(string: "https://github.com/VChristinne/Virtual-Pet/raw/main/Pet/happy-pet.gif") {
						GeometryReader { geometry in
							GifView(url: url)
								.scaledToFill()
								.frame(width: 100, height: 300)
						}
						.aspectRatio(contentMode: .fit)
						.frame(width: 150)
						.padding(.leading, 30)
						.shadow(radius: 10)

					}
				}
				
				if (vm.pet.happinessLevel == "Unhappy" || vm.pet.happinessLevel == "Triste") {
					if let url = URL(string: "https://github.com/VChristinne/Virtual-Pet/raw/main/Pet/sad-pet.gif") {
						GeometryReader { geometry in
							GifView(url: url)
								.scaledToFill()
								.frame(width: 100, height: 300)
						}
						.aspectRatio(contentMode: .fit)
						.frame(width: 150)
						.padding(.leading, 30)
						.shadow(radius: 10)
						
					}
				}
				
				/*
				// MARK: STATUS
				VStack {
					Text("Age: **\(vm.pet.ageDescription)**")
					Text("Status: **\(vm.pet.happinessLevel)**")
					Text("Hunger: **\(vm.pet.hunger)**")
					Text("Thirst: **\(vm.pet.thirst)**")
				}
				*/
				
				// MARK: ACTIONS
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
		.ignoresSafeArea(edges: .all)
		
		.onReceive(timer) {_ in
			vm.saveData()
		}
	}
}

#Preview ("Pet View") {
	PetView()
}
