import Foundation

struct Pet: Codable {
	var name: String
	var birthday = Date()
	var lastMeal: Date
	var lastDrink: Date
	var lastMedicine: Date
	
	var happinessLevel: String {
		if hunger == "Hungry" || hunger == "Esfomiado" || thirst == "Thirsty" || thirst == "Com sede" {
			return NSLocalizedString("Unhappy", comment: "")
		} else {
			return NSLocalizedString("Happy", comment: "")
		}
	}
	
	var ageDescription: String {
		let timeSince = calcTimeSince(date: birthday)
		
		if timeSince >= 86_400 {
			let timeSinceDays = timeSince / 86_400
			return String(format: NSLocalizedString("%d days", comment: ""), Int(timeSinceDays))
		} else {
			let timeSinceHours = timeSince / 3_600
			return String(format: NSLocalizedString("%d hours", comment: ""), Int(timeSinceHours))
		}
	}
	
	var hunger: String {
		let timeSince = calcTimeSince(date: lastMeal)
		var string = ""
		
		switch timeSince {
			case 0..<30: string = NSLocalizedString("Satiated", comment: "")
			case 30..<60: string = NSLocalizedString("Getting hungry...", comment: "")
			case 60...: string = NSLocalizedString("Hungry", comment: "")
			default: string = NSLocalizedString("Idk", comment: "")
		}
		
		return string
	}
	
	var thirst: String {
		let timeSince = calcTimeSince(date: lastDrink)
		var string = ""
		
		switch timeSince {
			case 0..<30: string = NSLocalizedString("Satiated", comment: "")
			case 30..<60: string = NSLocalizedString("Getting thirsty...", comment: "")
			case 60...: string = NSLocalizedString("Thirsty", comment: "")
			default: string = NSLocalizedString("Idk", comment: "")
		}
		
		return string
	}
	
	var sick: String {
		let timeSince = calcTimeSince(date: lastMedicine)
		var string = ""
		
		switch timeSince {
			case 0..<60: string = NSLocalizedString("Healthy", comment: "")
			case 60..<120: string = NSLocalizedString("Getting sick...", comment: "")
			case 120...: string = NSLocalizedString("Sick", comment: "")
			default: string = NSLocalizedString("Idk", comment: "")
		}
		
		return string
	}
}
