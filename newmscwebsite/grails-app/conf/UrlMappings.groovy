class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		
		"/event/displayEventCategory/$categoryString?"(controller: "event", action: "displayEventCategory")

		"/"(controller: "home", action: "index")
		"500"(view: '/error')
		"404"(view: '/error')
		
		"/login/$action?"(controller: "login")
		"/logout/$action?"(controller: "logout")
		
	}
}
