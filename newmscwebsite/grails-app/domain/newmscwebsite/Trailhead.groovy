package newmscwebsite

import newmscwebite.Activity;
import newmscwebite.Amenity;

class Trailhead {
	
	String name
	String description
	StreetAddress address
	GeographicCoordinates coordinates
	String internalName
	List<Activity> activities
	List<Amenity> amenities
	def photoGallery = []
	
	static embedded = ['address', 'coordinates']
	
	static hasMany = [
		hikes: Hike,
		activities: Activity, 
		amenities: Amenity
	]
	
	static constraints = {
		name(size: 5..100)
		description(size: 10..1000)
		address(nullable: false)
		coordinates(nullable: false)
		internalName(nullable: false, size: 1..20)
		hikes(nullable: true)
	}
	
	public String toString() {
		"${name}"
	}
	
	def getHikesInOrder() {
		def result = this.hikes.toArray()
		result = result.sort {it.name}
		result
	}
	
}
