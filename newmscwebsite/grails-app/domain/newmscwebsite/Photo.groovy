package newmscwebsite

class Photo {
	
	static searchable = [only: ['keywords', 'allKeywords', 'artist', 'fileName', 'originalFileName', 'usageRights']]
	
	List<String> keywords
	String allKeywords
	String artist
	String copyright
	int height
	int width
	String source
	String fileName
	String originalFileName
	Date dateCreated
	String usageRights

    static constraints = {
		source(nullable: false)
		fileName(nullable: false)
		usageRights(nullable: true)
    }
}
