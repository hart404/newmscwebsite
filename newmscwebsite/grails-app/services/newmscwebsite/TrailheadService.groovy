package newmscwebsite

class TrailheadService {

    def brownsRanch() {
		Trailhead.findByNameLike("Brown's Ranch%")
    }
	
	def gateway() {
		Trailhead.findByNameLike("Gateway%")
	}
	
	def lostDog() {
		Trailhead.findByNameLike("Lost Dog%")
	}
	
	def tomsThumb() {
		Trailhead.findByNameLike("Tom's Thumb%")
	}
	
	def ringtail() {
		Trailhead.findByNameLike("Ringtail%")
	}
	
}
