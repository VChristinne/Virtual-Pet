import SwiftUI
import FLAnimatedImage

struct PetView: View {
	@State var isActive = true
	@StateObject private var vm = PetViewModel()
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
				
				HeartView()
				
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
				
				// StatusPetView()
				
				ActionsView()

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
