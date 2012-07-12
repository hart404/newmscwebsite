package newmscwebsite

class GeographicCoordinates {
	BigDecimal latitude
	BigDecimal longitude

    static constraints = {
		latitude(nullable: false)
		longitude(nullable: false)
    }

	@Override
	String toString() {
		return "$latitude,$longitude"
	}	
	
}
