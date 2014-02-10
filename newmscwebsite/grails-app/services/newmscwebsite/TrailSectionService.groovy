package newmscwebsite

class TrailSectionService {

	def retrievePins(Boolean southArea, Boolean northArea) {
		def criteria = TrailSection.createCriteria()
		def trailSections = criteria {
			eq('enabled', true)
			eq('northPins', northArea)
			eq('southPins', southArea)
		}
		return trailSections
	}
}
