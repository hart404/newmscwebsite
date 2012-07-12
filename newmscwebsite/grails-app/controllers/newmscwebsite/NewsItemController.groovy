package newmscwebsite

class NewsItemController {

    def index = { 
		[newsItems: NewsItem.findAll()]
	}
	
	def displayNewsItem = {
		[newsItem: NewsItem.findById(params.id)]
	}
}
