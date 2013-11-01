package newmscwebsite

class GeographicCoordinates {
	BigDecimal latitude
	BigDecimal longitude

    static constraints = {
		latitude(nullable: false, scale: 6)
		longitude(nullable: false, scale: 6)
    }

	@Override
	String toString() {
		return "$latitude,$longitude"
	}	
	
}
