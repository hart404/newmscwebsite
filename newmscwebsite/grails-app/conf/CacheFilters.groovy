import newmscwebsite.HttpUtils

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

// The approach we have for this filter is to make sure URLs that the following
// pages are NOT cached:
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
		widget(uri : '/lightbox/**') {
			before = {
				noCache(response)
			}
		}
		widget(uri : '/document/**') {
			before = {
				noCache(response)
			}
		}
		trailSections(uri : '/trailSection/**') {
			before = {
				noCache(response)
			}
		}
		content(uri : '/content/pages') {
			before = {
				// Ensure that pages that can possibly be edited are not cached
				if (SpringSecurityUtils.ifAnyGranted("ROLE_WEB,ROLE_ADMIN,ROLE_LEADER")) {
					noCache(response)
				}
			}
		}
//		cors(uri : '/*') {
//			before = {
//				corsHeaders(response)
//			}
//		}
	}
	
	void noCache(response) {
		HttpUtils.NO_CACHE_HEADERS.each  { key,value ->
			response.setHeader(key, value)
		}
	}
	
	void corsHeaders(response) {
		HttpUtils.CORS_HEADERS.each  { key,value ->
			response.setHeader(key, value)
		}
	}
}
