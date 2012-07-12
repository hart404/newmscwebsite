package newmscwebsite

class Hike {
	
	String name 					// e.g. "Gateway Loop"
	String description
	String noteworthyFeatures
	String directions
	String kmlFileName
	int elevationGain
	BigDecimal roundTripDistance	// from the designated trailhead
	String elevationProfile			// file name assumed to be in the folder DEFAULT_MAP_URI
	def photoGallery = []
	
	static DEFAULT_MAP_URI = "/maps/"

    static constraints = {
		name(blank: false, size: 10..50)
		description(blank: false, size: 10..1000)
		noteworthyFeatures(blank:false, size: 10..2000)
		directions(blank: false, size: 10..2000)
		kmlFileName(nullable: true)
		elevationGain(min: 0, max: 3000)
		roundTripDistance(min: 0.1, max: 25.0)
		elevationProfile(nullable: true)
		photoGallery(size: 0..30)
    }
}
