package newmscwebsite;

public enum Amenity {
	DIRECTORY, HORSE_TRAILS, INFORMATION, RESTROOM, SEATING, SHELTER, WATER
	
	def titles = ['Directory', 'Horse Trails', 'Information', 'Restrooms', 'Seating', 'Shelter', 'Water']
	
	def icon() {
		switch(this) {
			case DIRECTORY:
				return "img_directory-97x96.png"
			case HORSE_TRAILS:
				return "img_horse-trails-97x96.png"
			case INFORMATION:
				return "img_information-97x96.png"
			case RESTROOM:
				return "img_restroom-97x96.png"
			case SEATING:
				return "img_seating-97x96.png"
			case SHELTER:
				return "img_shelter-97x96.png"
			case WATER:
				return "img_water-97x96.png"
		}
	}
	
	def title() {
		titles[this.ordinal()]
	}

}
