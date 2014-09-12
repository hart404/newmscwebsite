package newmscwebsite

class MapController {

    def showMap() { 
		println "Latitude: ${params.latitude}, longitude: ${params.longitude}, pinName: ${params.pinName}"
		["latitude": params.latitude, "longitude": params.longitude, "pinName": params.pinName]
	}
}
