package newmscwebsite

import org.joda.time.LocalDate

class NewsItemService {

    static transactional = true

    def getHomePageNewsItems() {
		// Return only the important news items
		def newsItems = getAllCurrentNewsItems()
		newsItems = newsItems.findAll { newsItem -> 
			newsItem.important
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
	
	def getAllCurrentNewsItems() {
		def today = LocalDate.now()
		def criteria = NewsItem.createCriteria()
		criteria.list {
			and {
				le("displayStartDate", today)
				ge("displayEndDate", today)
			}
			order("displayStartDate", "asc")
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
