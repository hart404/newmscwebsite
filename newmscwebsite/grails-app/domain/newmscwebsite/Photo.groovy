package newmscwebsite

class Photo {
	
	static searchable = [only: ['keywords', 'allKeywords', 'artist', 'fileName']]
	
	List<String> keywords
	String allKeywords
	String artist
	String copyright
	int height
	int width
	String path
	String fileName
	Date dateCreated
	String usageRights

    static constraints = {
		path(nullable: false)
		fileName(nullable: false)
		usageRights(nullable: true)
    }
}
