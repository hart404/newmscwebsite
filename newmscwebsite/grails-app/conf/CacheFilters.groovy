import newmscwebsite.HttpUtils

// The approach we have for this filter is to make sure URLs that the following
// pages are NOT cached:
// * authenticated pages in the admin/teacher/student areas
// * REST api responses
// Everything else, can be cached (images/css/less/bootstrap assets)
class CacheFilters {
	def filters = {
		events(uri : '/event/**') {
			before = {
				noCache(response)
			}
		}
		newItems(uri : '/newsItem/**') {
			before = {
				noCache(response)
			}
		}
		menuBar(uri : '/menuBar/**') {
			before = {
				noCache(response)
			}
		}
		menu(uri : '/menu/**') {
			before = {
				noCache(response)
			}
		}
		menuItem(uri : '/menuItem/**') {
			before = {
				noCache(response)
			}
		}
		adSpace(uri : '/adSpace/**') {
			before = {
				noCache(response)
			}
		}
		photo(uri : '/photo/**') {
			before = {
				noCache(response)
			}
		}
		widget(uri : '/widget/**') {
			before = {
				noCache(response)
			}
		}
	}
	
	void noCache(response) {
		HttpUtils.NO_CACHE_HEADERS.each  { key,value ->
			response.setHeader(key, value)
		}
	}
}
