class UrlMappings {

	static mappings = {

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}	
		
		"/paws"(controller: "redirector", action: "paws")
		"/ranch"(controller: "redirector", action: "ranch")
		"/visit"(controller: "redirector", action: "visit")
		"/hikes"(controller: "redirector", action: "hikes")
		"/steward"(controller: "redirector", action: "steward")
		"/volunteer"(controller: "redirector", action: "volunteer")
		"/freefamilyfun"(controller: "redirector", action: "freeFamilyFun")
		"/photocontest"(controller: "redirector", action: "photoContest")
		"/kids"(controller: "redirector", action: "kids")
		"/women"(controller: "redirector", action: "women")
		"/partners"(controller: "redirector", action: "partners")
		"/legacy"(controller: "redirector", action: "legacy")
		"/preserve"(controller: "redirector", action: "preserve")
		"/opening"(controller: "redirector", action: "opening")
		"/maps"(controller: "redirector", action: "maps")
		"/shop"(controller: "redirector", action: "shop")
		
		"/event/displayEventCategory/$categoryString?"(controller: "event", action: "displayEventCategory")

		"/"(controller: "home", action: "index")
		"500"(view: '/error')
		"404"(view: '/error')
		
		"/login/$action?"(controller: "login")
		"/logout/$action?"(controller: "logout")
		
	}
}
