package newmscwebsite

class ContentManagedTagLib {
	static namespace = "cm"
		
	def htmlWidget = { attributes, body ->
		out << attributes.html
	}

}
