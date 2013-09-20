package newmscwebsite

class TrailReport {
	TrailSection trailSection
	String comment
	
	static constraints = {
		comment(size: 0..2048)
	}

}
