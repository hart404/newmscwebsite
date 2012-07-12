package newmscwebite;

public enum Activity {
	BIKING, DOGS, HORSES, FAMILY, HANDICAP, HIKING, CLIMBING
	
	def icon() {
		switch(this) {
			case BIKING:
				return "img_bikes-97x96.png"			
			case DOGS:
				return "img_dogs-97x96.png"			
			case HORSES:
				return "img_equine-97x96.png"			
			case FAMILY:
				return "img_family-97x96.png"			
			case HANDICAP:
				return "img_handicap-97x96.png"			
			case HIKING:
				return "img_hiking-97x96.png"			
			case CLIMBING:
				return "img_climbing-97x96.png"			
		}
	}
}
