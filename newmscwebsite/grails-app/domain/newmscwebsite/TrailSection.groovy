package newmscwebsite

class TrailSection {
	GeographicCoordinates pinLocation
	String pinName
	String notes
	
	static embedded = ['pinLocation']
}
