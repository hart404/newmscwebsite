package newmscwebsite
// scarfed these values from various google searches
// to make sure we get the most coverage on browser cache
// quirks, add to it as is necessary
class HttpUtils {
	static def NO_CACHE_HEADERS = [
		'Expires' : '-1',
		'Cache-Control' : 'no-cache,no-store',
		'Pragma' : 'no-cache'
	]
}
