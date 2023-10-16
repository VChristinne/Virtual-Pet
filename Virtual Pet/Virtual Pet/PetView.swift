import SwiftUI
import FLAnimatedImage

struct PetView: View {
	@State var isActive = true
	@StateObject private var vm = PetViewModel()
	
	var body: some View {
		
		ZStack {
			LinearGradient(colors: [Color("Bubblegum-Magenta"),
									Color("Lavander-Grape"),
									Color("Orchid-Blueberry")],
						   startPoint: .top,
						   endPoint: .bottom)
			
			//TextField("Name your pet!", text: $vm.pet.name)
			
			VStack {
				PetGifView()
			}
		}
		.ignoresSafeArea(edges: .all)
	}
}

#Preview ("Pet View") {
	PetView()
}
