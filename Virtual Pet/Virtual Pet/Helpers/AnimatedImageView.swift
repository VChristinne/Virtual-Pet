import SwiftUI
import FLAnimatedImage

struct GifView: UIViewRepresentable {
	let animatedView = FLAnimatedImageView()
	var url: URL?
	
	func makeUIView(context: UIViewRepresentableContext<GifView>) -> UIView {
		let view = UIView()
		
		if let url = url {
			URLSession.shared.dataTask(with: url) { data, _, _ in
				if let data = data {
					DispatchQueue.main.async {
						let gif = FLAnimatedImage(animatedGIFData: data)
						self.animatedView.animatedImage = gif
					}
				}
			}.resume()
		}
		
		animatedView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(animatedView)
		
		NSLayoutConstraint.activate([
			animatedView.heightAnchor.constraint(equalTo: view.heightAnchor),
			animatedView.widthAnchor.constraint(equalTo: view.widthAnchor)
		])
		
		return view
	}
	
	func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<GifView>) {
	}
}
