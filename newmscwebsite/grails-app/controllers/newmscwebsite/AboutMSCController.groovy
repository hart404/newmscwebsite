package newmscwebsite

import java.text.SimpleDateFormat

class AboutMSCController {

	static navigation = [
		group:'navigationBar',
		order:3,
		title:'About The Conservancy',
		action:'index'
	]

	def index = { }

	def history = {
		render(contentType: "text/xml") {
			data() {
				//Special date format which is needed for the timeline control
				String startDate = new Date(91, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Conservancy Incorporates", 'link':"http://localhost:8080/richuitest/person/show/1", "Our campaign to inform the public of the need to protect this land begins in earnest.")

				startDate = new Date(92, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"MMTF Created", 'link':"http://localhost:8080/richuitest/person/show/2", "The Conservancy asks the Scottsdale City Council to create a McDowell Mountain and Sonoran Desert preservation plan.")

				startDate = new Date(93, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Preserve Created", 'link':"http://localhost:8080/richuitest/person/show/3", "Based upon the MMTF recommendations, Scottsdale establishes the McDowell Sonoran Preserve Commission (MSPC) and appoints five MSC Board members to the nine-person Commission.")

				startDate = new Date(94, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Preserve dedication", 'link':"http://localhost:8080/richuitest/person/show/3", "Scottsdale formally dedicates the initial McDowell Sonoran Preserve, which consists of three parcels of land totaling approximately 5 square miles.")

				startDate = new Date(95, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Voters approve tax increase", 'link':"http://localhost:8080/richuitest/person/show/3", "Voters approve the preservation sales tax by 64%!")

				startDate = new Date(96, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Voters approve bonds", 'link':"http://localhost:8080/richuitest/person/show/3", "The Conservancy begins a trailbuilding program that trains volunteers for work in the Preserve.")

				startDate = new Date(97, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Expansion recommended", 'link':"http://localhost:8080/richuitest/person/show/3", "The Conservancy hires its first staff member, a full time Executive Director, Sandy Bahr.")

				startDate = new Date(98, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"State Trust Land conserved", 'link':"http://localhost:8080/richuitest/person/show/3", "Scottsdale purchases DC Ranch property in the RSB resulting in 87% of the planned Preserve being protected.")

				startDate = new Date(99, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Voters approve more bonds", 'link':"http://localhost:8080/richuitest/person/show/3", "Scottsdale voters approve the sale of general obligation bonds - to be repaid using the existing preservation tax, to expedite land purchases at a lower interest rate - by a 77% margin.")

				startDate = new Date(100, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Preserve expanded further", 'link':"http://localhost:8080/richuitest/person/show/3", "In partnership with the City, Conservancy purchases 31 acres of land outside of the RSB and donates it to the Preserve.")

				startDate = new Date(101, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"State Land Reclassified", 'link':"http://localhost:8080/richuitest/person/show/3", "On August 30th, State Land Commissioner Michael Anable signs an order reclassifying 78% of the land (13,021 acres) and commits to hold off public auction on the remaining 22%, thereby giving Scottsdale time to explore funding options to purchase the land.")

				startDate = new Date(102, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Stewards report record hours", 'link':"http://localhost:8080/richuitest/person/show/3", "In conjunction with the 8th Annual McDowell Sonoran Month, Conservancy Stewards are honored for the 4,572 hours they donated over the past year patrolling and protecting the Preserve while at the same time saving money for the taxpayers of Scottsdale.")

				startDate = new Date(103, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Sunrise Trailhead approved", 'link':"http://localhost:8080/richuitest/person/show/3", "Plans for the Sunrise Trailhead on the southeastern flank of the Preserve are approved by City Council after successful Conservancy advocacy helps to address issues raised by new neighbors in the adjacent Hidden Hills subdivision.")

				startDate = new Date(104, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Voters approve tax increase", 'link':"http://localhost:8080/richuitest/person/show/3", "Scottsdale voters approved an additional .15% increase in the sales tax for land acquisition and for access area amenities. When completed, the McDowell Sonoran Preserve will be one of the largest urban preserves. The Preserve will be larger than Tempe and Paradise Valley combined.")

				startDate = new Date(105, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Lost Dog construction starts", 'link':"http://localhost:8080/richuitest/person/show/3", "Due to drought conditions and heat lightning, the Preserve closed early in the summer to prevent potential wildfires. Conservancy provides vital assistance in enforcing the closure. Construction began on the Lost Dog Wash Trailhead at 124th street north of Via Linda.")

				startDate = new Date(106, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Conservancy office opens", 'link':"http://localhost:8080/richuitest/person/show/3", "Thanks to the generosity of the Pederson Group Inc., Conservancy opens its first office in the Scottsdale Promenade Corporate Complex.  And - it came with a beautiful view of the Preserve through the front door!")

				startDate = new Date(107, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Lost Dog wins top award", 'link':"http://localhost:8080/richuitest/person/show/3", "Lost Dog Wash Trailhead was awarded the top Honor Award by the American Institute of Architects, Western Mountain Region for its sustainable design and sensitivity to the desert habitat within the McDowell Sonoran Preserve in September.")
				
				startDate = new Date(108, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"100 more stewards added", 'link':"http://localhost:8080/richuitest/person/show/3", "The addition of 100 newly trained Stewards brings the total volunteer team to more than 300 strong.")

				startDate = new Date(109, 0, 1, 0, 0, 0).format("MMM dd yyyy HH:mm:ss")
				event('start': startDate, 'title':"Gateway opens", 'link':"http://localhost:8080/richuitest/person/show/3", "The LEED Platinum Gateway Trailhead opens. It features a state-of-the-art green building, amphitheater, and new trail connectivity. Conservancy donates, designs, and creates a new, barrier-free nature trail at the Gateway.  The Bajada Nature Trail opens the Preserve to those with mobility challenges and quickly becomes a family favorite!")
			}
		}
	}
}
