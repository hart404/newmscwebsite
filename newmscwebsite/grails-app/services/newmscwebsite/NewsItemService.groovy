package newmscwebsite

class NewsItemService {

    static transactional = true

    def getHomePageNewsItems() {
		// Return only the important news items
		NewsItem.findAllByImportant(true)
    }
}
