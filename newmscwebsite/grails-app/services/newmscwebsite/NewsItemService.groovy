package newmscwebsite

import org.joda.time.LocalDate

class NewsItemService {

    static transactional = true

    def getHomePageNewsItems() {
		// Return only the important news items
		def newsItems = NewsItem.findAllByImportant(true)
		def yesterday = LocalDate.now().minusDays(1)
		def tomorrow = LocalDate.now().plusDays(1)
		newsItems = newsItems.collect { newsItem -> 
			yesterday.isBefore(newsItem.displayStartDate) && newsItem.displayEndDate.isBefore(tomorrow)
		} 
		newsItems
    }
	
	def getAllCurrentNewsItems(params) {
		def today = LocalDate.now()
		def criteria = NewsItem.createCriteria()
		if (params.offset) params.offset = params.offset as Integer
		if (params.max) params.max = params.max as Integer
		criteria.list {
			and {
				le("displayStartDate", today)
				ge("displayEndDate", today)
			}
			order("displayStartDate", "asc")
			firstResult(params.offset ?: 0)
			maxResults(params.max ?: 5)
		}
	}
	
	def countAllCurrentNewsItems() {
		def today = LocalDate.now()
		def criteria = NewsItem.createCriteria()
		criteria.count {
			and {
				le("displayStartDate", today)
				ge("displayEndDate", today)
			}
		}
	}
}
