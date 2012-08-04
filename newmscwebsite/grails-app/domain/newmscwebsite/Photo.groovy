package newmscwebsite

/*
 * Note: the URL for the photo is source + path + fileName
 */
class Photo {
	
	static searchable = [only: ['keywords', 'allKeywords', 'artist', 'fileName', 'originalFileName', 'usageRights']]
	
	List<String> keywords
	String allKeywords
	String artist
	String copyright
	int height
	int width
	String source
	String path
	String fileName
	String originalFileName
	Date dateCreated
	String usageRights

    static constraints = {
		source(nullable: false)
		fileName(nullable: false)
		usageRights(nullable: true)
    }
	
	def fullPath() {
		def url = source + '/' + path + '/' + fileName
		println url
		url
	}
	
	String toString() {
		originalFileName
	}
}
