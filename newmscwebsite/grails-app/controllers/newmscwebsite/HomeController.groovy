package newmscwebsite

import java.math.BigDecimal;
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Date;

import org.apache.jasper.tagplugins.jstl.core.Catch;
import org.joda.time.LocalDate
import grails.converters.JSON
import groovy.sql.Sql
import simple.cms.SCMSPhoto;
import simple.cms.SCMSStaticPage
import com.vinomis.authnet.AuthorizeNet

class HomeController {

	def homeService
	def eventService
	def dataSource
	def springSecurityService

	static navigation = [
		group:'navigationBar',
		order:1,
		title:'Home',
		action:'index'
	]

	def index = {
		def events = eventService.findEventsForHomePage()
		def map = [events: events, newsItems: NewsItem.findAllByImportant(true)]
		addWidgetsToMap(map)
		map
	}

	def storeReport() {
		def dateParts = params.date.split('/')
		def date = dateParts[2] + "-" + dateParts[0] + "-" + dateParts[1]
		def program = params.program
		def hours = params.hours
		def time = params.time

		def volunteerSession = new VolunteerSession(date: date, hours: hours, program: program, time: time)
		volunteerSession.save(failOnError:true)

		render "true"
	}

	def saveReportProblem(){
		def code_inst = params.code
		def comments_inst = params.comments
		def userid_inst = springSecurityService.currentUser.id

		def reportprb_inst = new ReportComment(code:code_inst,comments:comments_inst,userId:userid_inst)
		reportprb_inst.save(failOnError:true)

		render "true"
	}

	def testPopup(){
	}

	def search() {
		params
	}

	def addWidgetsToMap(map) {
		def page = SCMSStaticPage.findByLink('home')
		if (page == null) {
			page = homeService.generateHomePage()
		}
		page.widgets.each { widget ->
			map[widget.widgetId] = widget
		}
		SCMSStaticPage.currentPage = page
	}

	def reportInfo(){
		println("params::::::::::::::inside reportInfo :::::::::::"+params)
	}

	def donateInfo (){

		println("params::::::::::::::inside donateInfo :::::::::::"+params)
	}

	def cartInfo = {

		println("params::::::::::::::"+params)
		def amount = params.donationamount
		boolean status = checkInteger(params.donationamount)
		if(status == false){

			flash.message = "You must enter a valid dollar amount"

			//redirect(controller:"home" ,action: "index" , messge:flash.message)
		}
	}

	boolean checkInteger(String input){
		try {
			Integer.parseInt(input)
		} catch (NumberFormatException e) {
			// TODO: handle exception
			return false
		}
		return true
	}
	def donateService
	def saveFullinfoData = {

		def jsonObj = JSON.parse(params.data)

		//
		String date = jsonObj.month+jsonObj.year

		//println("date ::::::::::::"+date)

		DateFormat dfDate = new SimpleDateFormat("MM-dd-yyyy");

		def currentdate =  dfDate.format(new Date());

		//println("currentdate ::::::::::::::"+currentdate)
		//if(jsonObj.from_date){
		java.util.Date parsedUtilDate = dfDate.parse(currentdate);

		java.sql.Timestamp  from_d= new java.sql.Timestamp(parsedUtilDate.getTime());

		//println("from_d:::::::::::::::hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh::::"+from_d)

		//from_date = from_d
		//println("jsonObj.description ::::::::::::::::"+jsonObj.description)

		//}


		def s = new AuthorizeNet()
		//NOTE:  If you need to override the login and transaction keys from the configuration, you can do it here:
		s.login = '6pKhTc8S9PC'
		s.transactionKey = '8W3jsZ8U8k7b3ZhY'


		s.authorizeAndCapture {

			description jsonObj.description
			firstName jsonObj.firstName
			lastName jsonObj.lastName
			address jsonObj.address
			city jsonObj.city
			state jsonObj.state
			amount jsonObj.amount
			zip jsonObj.zip
			phone jsonObj.phone
			country jsonObj.country
			ccNumber ''+jsonObj.cardnumber+''
			cvv jsonObj.cvc
			ccExpDate date
			email jsonObj.email
			invoiceId jsonObj.invoiceid

		}
		def anr = s.submit()
		println ("anr:::::::::"+anr)
		//println ("anr.responseReasonText:::::::::"+anr.responseReasonText)
		//println ("anr.transactionId:::::::::"+anr.transactionId)

		boolean recuringType

		if(jsonObj.recuringType == "One-time"){

			recuringType = false

		}else{

			recuringType = true
		}

		if(anr.responseReasonText == "This transaction has been approved."){

			//println("inside ifffffffffffffffffffffffffff"+Double.parseDouble(jsonObj.amount))




			//var myJSONText = "{'firstName':'"+firstName+
			//		"','lastName':'"+lastName+"','email':'"+email+"','address':'"+address+"','city':'"+city+
			//		"','state':'"+state+"','country':'"+country+"','zip':'"+zip+"','phone':'"+phone+"','cardnumber':'"+cardnumber+"','cvc':'"+cvc+
			//		"','invoiceid':'"+invoiceid+"','month':'"+month+"' ,'year':'"+year+"','amount':'"+amount+"'}"

			def donateinst = new Donation(firstName:jsonObj.firstName,lastName:jsonObj.lastName,city:jsonObj.city,state:jsonObj.state,
			zip:jsonObj.zip,recurring:recuringType,recurringDate:from_d,country:jsonObj.country,
			phone:jsonObj.phone,actualDonationAmount:Double.parseDouble(jsonObj.amount),tributeDonation:true,
			street:jsonObj.street,transactionId:anr.transactionId,recurringType:jsonObj.recuringType,recipientName:"McDowell Sonoran Conservancy")

			if(donateinst.save(flush:true)){
				flash.message = "This transaction has been approved."



				redirect(controller:"home" ,action: "index")
			}else{

				// println("njhhhhhhhhhhhhhhhhhhhhhhh")
				redirect(controller:"home" ,action: "index")
			}

			donateService.processDonation(jsonObj.cardnumber,jsonObj.month,jsonObj.year)

		}else{

			flash.message = anr.responseReasonText

			redirect(controller:"home" ,action: "index")
		}

	}


	def saveNameEmail = {

		println("inside saveNameEmail ::::::::::::::"+saveNameEmail)
		//var myJSONText = "{'name':'"+name+
		//"','email_id':'"+email_id+"','cvc_2':'"+cvc_2+"','invoiceid_2':'"+invoiceid_2+"'}"

		def jsonObj = JSON.parse(params.data)

		//println("jsonObj.name :::::::::::::"+jsonObj.name)

		//println("jsonObj.email_id :::::::::::::"+jsonObj.email_id)

		//println("jsonObj.cvc_2 :::::::::::::"+jsonObj.cvc_2)

		//println("jsonObj.invoiceid_2 :::::::::::::"+jsonObj.invoiceid_2)

		String date = jsonObj.month+jsonObj.year

		//println("date ::::::::::::"+date)

		DateFormat dfDate = new SimpleDateFormat("MM-dd-yyyy");

		def currentdate =  dfDate.format(new Date());

		//println("currentdate ::::::::::::::"+currentdate)
		//if(jsonObj.from_date){
		java.util.Date parsedUtilDate = dfDate.parse(currentdate);

		java.sql.Timestamp  from_d= new java.sql.Timestamp(parsedUtilDate.getTime());

		//println("from_d:::::::::::::::hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh::::"+from_d)

		///println("jsonObj.cardnumber ::::::::::::::"+jsonObj.cardnumber)

		def s = new AuthorizeNet()
		s.authorizeAndCapture {
			firstName jsonObj.name
			amount jsonObj.amount
			ccNumber ''+jsonObj.cardnumber+''
			cvv jsonObj.cvc_2
			ccExpDate date
			email jsonObj.email_id
			invoiceId jsonObj.invoiceid_2
		}
		def anr = s.submit();
		println ("anr  :::::::::::::::::::::::  "+anr)


		//println ("anr.responseReasonText:::::::::"+anr.responseReasonText)
		//println ("anr.transactionId:::::::::"+anr.transactionId)

		boolean recuringType

		if(jsonObj.recuringType == "one time donation"){

			recuringType = false

		}else{

			recuringType = true
		}

		if(anr.responseReasonText == "This transaction has been approved."){

			//println("inside ifffffffffffffffffffffffffff"+Double.parseDouble(jsonObj.amount))





			def donateinst = new Donation(firstName:jsonObj.name,recurring:recuringType,recurringDate:from_d,
			actualDonationAmount:Double.parseDouble(jsonObj.amount),tributeDonation:true,transactionId:anr.transactionId,recurringType:jsonObj.recuringType,recipientName:"McDowell Sonoran Conservancy")

			if(donateinst.save(flush:true)){
				flash.message = "This transaction has been approved."



				redirect(controller:"home" ,action: "index")
			}else{

				// println("njhhhhhhhhhhhhhhhhhhhhhhh")
				redirect(controller:"home" ,action: "index")
			}

			donateService.processDonation(jsonObj.cardnumber,jsonObj.month,jsonObj.year)

		}else{

			flash.message = anr.responseReasonText

			redirect(controller:"home" ,action: "index")
		}


	}

	def saveNonData = {


		//println("inside saveNonData ::::::::::")

		def jsonObj = JSON.parse(params.data)


		//var myJSONText = "{'cvc_3':'"+cvc_3+"','invoiceid_3':'"+invoiceid_3+
		//"','month':'"+month_3+"' ,'year':'"+year_3+"','amount':'"+amount+"','cardnumber':'"+cardnumber_3+"','recuringType':'"+recuringType+"'}"

		//println("jsonObj.cvc_3 :::::::::::::"+jsonObj.cvc_3)
		//println("jsonObj.invoiceid_3 :::::::::::::"+jsonObj.invoiceid_3)
		//println("jsonObj.month :::::::::::::"+jsonObj.month)
		///println("jsonObj.year :::::::::::::"+jsonObj.year)
		//println("jsonObj.amount :::::::::::::"+jsonObj.amount)
		//println("jsonObj.cardnumber :::::::::::::"+jsonObj.cardnumber)
		//println("jsonObj.recuringType :::::::::::::"+jsonObj.recuringType)

		String date = jsonObj.month+jsonObj.year

		//println("date ::::::::::::"+date)

		DateFormat dfDate = new SimpleDateFormat("MM-dd-yyyy");

		def currentdate =  dfDate.format(new Date());

		//println("currentdate ::::::::::::::"+currentdate)
		//if(jsonObj.from_date){
		java.util.Date parsedUtilDate = dfDate.parse(currentdate);

		java.sql.Timestamp  from_d= new java.sql.Timestamp(parsedUtilDate.getTime());

		//println("from_d:::::::::::::::hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh::::"+from_d)


		def s = new AuthorizeNet()
		s.authorizeAndCapture {
			amount jsonObj.amount
			ccNumber ''+jsonObj.cardnumber+''
			cvv jsonObj.cvc_3
			ccExpDate date
			invoiceId jsonObj.invoiceid_3
		}
		def anr = s.submit();
		println ("anr  :::::::::::::::::::::::  "+anr)



		//println ("anr.responseReasonText:::::::::"+anr.responseReasonText)
		// println ("anr.transactionId:::::::::"+anr.transactionId)

		boolean recuringType

		if(jsonObj.recuringType == "one time donation"){

			recuringType = false

		}else{

			recuringType = true
		}

		if(anr.responseReasonText == "This transaction has been approved."){

			//println("inside ifffffffffffffffffffffffffff"+Double.parseDouble(jsonObj.amount))






			def donateinst = new Donation(recurring:recuringType,recurringDate:from_d,
			actualDonationAmount:Double.parseDouble(jsonObj.amount),tributeDonation:true,transactionId:anr.transactionId,recurringType:jsonObj.recuringType,recipientName:"McDowell Sonoran Conservancy")

			if(donateinst.save(flush:true)){
				flash.message = "This transaction has been approved."



				redirect(controller:"home" ,action: "index")
			}else{

				// println("njhhhhhhhhhhhhhhhhhhhhhhh")
				redirect(controller:"home" ,action: "index")
			}

			donateService.processDonation(jsonObj.cardnumber,jsonObj.month,jsonObj.year)

		}else{

			flash.message = anr.responseReasonText

			redirect(controller:"home" ,action: "index")
		}
	}

	def cartListDetailsJSON(){

		def db = new Sql(dataSource)
		def prod_list = []
		def list_data = []
		def main_list_data = []

		def sessionId = request.getSession().id
		//println("sessionId   "+sessionId)

		def query ="SELECT clt.product_id as prod_id,p.product_image_url as image,clt.id, "+
				"p.product_title as product,clt.unit_price as price,clt.quantity as quantity, "+
				"clt.total_line_item_price as total_price "+
				"FROM `cart_line_item` clt ,product p "+
				"where p.id = clt.product_id "+
				"and session_id='"+sessionId+"' and clt.id not in(SELECT cart_line_item_id FROM `cart` where session_id='"+sessionId+"') "



		//println("product_query "+query)
		try {

			db.eachRow(query) {

				prod_list<< it.toRowResult()
			}
		}catch (Exception e) {

		}

		def results = prod_list?.collect {

			list_data.add("<a href='#'><img src='../"+it.image+"'  height='20' width='20' ></a>")

			list_data.add(it.product)
			list_data.add(it.price)
			list_data.add(it.quantity)
			list_data.add(it.total_price)
			list_data.add("<a href='#'><img src='../images/delete_icon.png' alt=''  height='20' width='20' onclick='deleteData("+it.prod_id+")'></a>")
			main_list_data.add(list_data)
			list_data = []
		}
		render main_list_data as JSON
	}

	def deleteCartItem(){

		def currentsessionId = request.getSession().id
		//                def query = "DELETE FROM cart_item_list WHERE product_id= '"+params.product_id+"' AND session_id='"+sessionId+"';"
		//                db.executeQuery(query)
		def product_inst = Product.get(params.product_id)
		def cart_item_list_inst = CartLineItem.findWhere(product:product_inst , sessionId:currentsessionId)
		//
		def delete_inst = cart_item_list_inst.delete()
		//
		//  if(!cart_item_list_inst){
		//
		//   render "success"
		//  }else{
		//
		//     render "failure"
		//
		//  }
		render "true"
	}

	def productPrevData = {

		println("println productNextData :::::::::;"+params )
		def prod_map = [:]

		def db = new Sql(dataSource)
		//println("db :::::::::::::"+db)
		def showing_data = ""
		def prod_list = []


		def total_data = params.total_record

		def start_limit
		def end_limit
		def page_count = Integer.parseInt(params.page_count)
		def last_index

		if(Integer.parseInt(total_data) < (page_count*8) + 8){


			showing_data = ((page_count*8) +1) + " - "+ Integer.parseInt(total_data)
			start_limit = page_count*8
			end_limit = 8

			last_index = Integer.parseInt(total_data)


		}else{

			showing_data = ((page_count*8) +1) + " - "+ ((page_count*8) +8)
			start_limit = page_count*8
			end_limit = 8

			last_index = (page_count*8) +8
		}

		def product_query = "SELECT product_name ,product_title,product_image_url, "+
				"unit_price as prod_price FROM `product` limit "+start_limit +" ,8 "

		//println("product_query "+product_query)
		try {

			db.eachRow(product_query) {

				prod_list<< it.toRowResult()
			}
		}catch (Exception e) {

		}

		prod_map.put("prod_details",prod_list)
		prod_map.put("showing_data",showing_data)
		prod_map.put("total_data",total_data)
		prod_map.put("last_index",last_index)

		render prod_map as JSON






	}

	def productNextData = {

		//println("println productNextData :::::::::;"+params )
		def prev_dat_list = params.showing_data.replace(" ","").split("-")



		def page_data = Integer.parseInt(prev_dat_list[1].toString())
		def second_limit_num = (page_data/8) + 1

		def second_limit = second_limit_num * 8

		def page_count = Integer.parseInt(params.page_count)


		def db = new Sql(dataSource)

		def showing_data = ""
		def prod_list = []

		def last_index

		def prod_map = [:]



		def total_data = params.total_record

		def start_limit
		def end_limit

		if(Integer.parseInt(total_data) < (page_count*8) + 8){


			showing_data = ((page_count*8) +1) + " - "+ Integer.parseInt(total_data)
			start_limit = page_count*8
			end_limit = 8

			last_index = Integer.parseInt(total_data)


		}else{

			showing_data = ((page_count*8) +1) + " - "+ ((page_count*8) +8)
			start_limit = page_count*8
			end_limit = 8

			last_index = (page_count*8) +8
		}

		def product_query = "SELECT id as prod_id,product_name ,product_title,product_image_url, "+
				"unit_price as prod_price FROM `product` limit "+start_limit +" ,8 "

		//println("product_query "+product_query)
		try {

			db.eachRow(product_query) {

				prod_list<< it.toRowResult()
			}
		}catch (Exception e) {

		}



		prod_map.put("prod_details",prod_list)
		prod_map.put("showing_data",showing_data)
		prod_map.put("total_data",total_data)
		prod_map.put("last_index",last_index)

		render prod_map as JSON



	}

	def productList = {

		//println("params inside productList "+params)

		def db = new Sql(dataSource)

		//println("db :::::::::::::"+db)
		def prod_list = []

		def prod_map = [:]

		def product_query = "SELECT id as prod_id,product_name ,product_title,product_image_url,unit_price as prod_price FROM `product`"
		try {

			db.eachRow(product_query) {

				prod_list<< it.toRowResult()
			}
		}catch (Exception e) {

		}

		def total_data = prod_list.size()

		def page_num = Math.round(Math.floor(prod_list.size() /8))


		def remaining_data = total_data - 8*page_num



		prod_map.put("total_data",total_data)
		def showing_data = ""



		showing_data = "1 - 8"



		prod_map.put("showing_data",showing_data)
		def prod_list_data = []

		def product_query_data = "SELECT id as prod_id,product_name ,product_title,product_image_url,unit_price as prod_price FROM `product`  limit 0,8"
		try {

			db.eachRow(product_query_data) {

				prod_list_data<< it.toRowResult()
			}
		}catch (Exception e) {

		}
		prod_map.put("prod_details",prod_list_data)


		def last_list = showing_data.replace(" ","").split("-")



		def  last_index = Integer.parseInt(last_list[1].toString())


		prod_map.put("last_index",last_index)

		render prod_map as JSON

	}

	def productDetail = {

		def db = new Sql(dataSource)

		//println("db :::::::::::::"+db)
		def prod_list = []

		def prod_map = [:]

		def product_query = "SELECT id as prod_id,product_name ,product_description, product_title,product_image_url,unit_price as prod_price FROM `product` where id="+params.product_id+" "
		try {

			db.eachRow(product_query) {

				prod_list<< it.toRowResult()
			}
		}catch (Exception e) {

		}

		//println("prod_list "+prod_list)
		render prod_list as JSON

	}

	def addToCart = {



		//println("params addToCart::::::::::: "+params)

		def sessionId = request.getSession().id

		def product_inst = Product.get(params.product_id)

		def unit_price_data = product_inst.unitPrice.replace('$',"").toString()
		def unit_price = unit_price_data.replace(" ","")
		def quantity = Integer.parseInt(params.quantity)

		def total_price
		def total_qant

		def exist_line_cart_inst = CartLineItem.findWhere(product:product_inst,sessionId:sessionId)
		if(exist_line_cart_inst){

			def exist_quantity = exist_line_cart_inst.quantity

			total_qant = Integer.parseInt(exist_quantity) + quantity

			def total_quantity = total_qant.toString()


			total_price ='$'+total_qant * Integer.parseInt(unit_price)


			exist_line_cart_inst.setQuantity(total_quantity)
			exist_line_cart_inst.setTotalLineItemPrice(total_price)

			if(exist_line_cart_inst.save(flush:true)){


				render "success"
				println("save")
			}else{

				render "failure"

				println("not save")

			}


		}else{

			total_price ='$'+Integer.parseInt(unit_price)*quantity

			def line_cart_inst = new CartLineItem(quantity:quantity,unitPrice:product_inst.unitPrice,
			totalLineItemPrice:total_price,product:product_inst,sessionId:sessionId)

			if(line_cart_inst.save()){


				render "success"
				println("save")
			}else{

				render "failure"

				println("not save")

			}

		}


	}
	def test(){
		def s = new AuthorizeNet()
		try{

			//

			s.authorizeAndCapture {
				amount '100.00'
				ccNumber '370000000000002'
				cvv '122'
				ccExpDate '12014'
				email 'john@acme.com'
				invoiceId '123'
			}

			def anr = s.submit()
			//println(" anr ::::::::::::::"+anr)
		}catch(Exception e){



		}


	}

	def saveTransationForShoppingCart(){

		def db = new Sql(dataSource)

		//println("saveTransationForShoppingCart :::::;;;"+params)
		def prod_list = []
		def sessionId = request.getSession().id

		def cartIdList = []

		println("sessionId  saveTransationForShoppingCart :::::;;;"+sessionId)

		def query = "select total_line_item_price as price from cart_line_item where session_id = '"+sessionId+"' and "+
				"id not in(SELECT cart_line_item_id FROM `cart` where session_id='"+sessionId+"') "

		//println("query ::::::::::saveTransationForShoppingCart::::::::"+query)
		try {

			db.eachRow(query) {

				prod_list<< it.toRowResult()
			}
		}catch (Exception e) {

		}

		def total1 = 0


		def results = prod_list?.collect {

			def amount = it.price.replace('$','').toString()
			def amount1 = Integer.parseInt(amount)

			total1 = amount1 + total1


		}
		//println("total :::::::::::"+total1)

		def total_3  = total1.toString()


		def  total = Double.parseDouble(total_3)

		def total_data  =  total.toString()






		def jsonObj = JSON.parse(params.data)

		String date = jsonObj.month+jsonObj.year

		DateFormat dfDate = new SimpleDateFormat("MM-dd-yyyy");

		def currentdate =  dfDate.format(new Date());

		java.util.Date parsedUtilDate = dfDate.parse(currentdate);

		java.sql.Timestamp  from_d= new java.sql.Timestamp(parsedUtilDate.getTime());



		def s = new AuthorizeNet()
		//NOTE:  If you need to override the login and transaction keys from the configuration, you can do it here:
		s.login = '6pKhTc8S9PC'
		s.transactionKey = '8W3jsZ8U8k7b3ZhY'


		if(jsonObj.billing_address){


			s.authorizeAndCapture {
				custId '20'
				description 'orderDescription'
				firstName jsonObj.firstName
				lastName jsonObj.lastName
				address jsonObj.address
				city jsonObj.city
				state jsonObj.state
				amount total_data
				zip jsonObj.zip
				phone jsonObj.phone
				country jsonObj.country
				company 'Acme Inc.'
				ccNumber ''+jsonObj.cardnumber+''
				cvv jsonObj.cvc
				ccExpDate date
				email jsonObj.email
				invoiceId jsonObj.invoiceid
				shipToLastName 'Doe'
				shipToFirstName 'John'
				shipToAddress jsonObj.billing_address
				shipToCity jsonObj.billing_city
				shipToState jsonObj.billing_state
				shipToZip jsonObj.billing_zip
				shipToPhone '7241112222'
				shipToCountry jsonObj.billing_country

			}


		}else{



			s.authorizeAndCapture {
				custId '20'
				description 'orderDescription'
				firstName jsonObj.firstName
				lastName jsonObj.lastName
				address jsonObj.address
				city jsonObj.city
				state jsonObj.state
				amount total_data
				zip jsonObj.zip
				phone jsonObj.phone
				country jsonObj.country
				company 'Acme Inc.'
				ccNumber ''+jsonObj.cardnumber+''
				cvv jsonObj.cvc
				ccExpDate date
				email jsonObj.email
				invoiceId jsonObj.invoiceid
				shipToLastName 'Doe'
				shipToFirstName 'John'
				shipToAddress jsonObj.address
				shipToCity jsonObj.city
				shipToState jsonObj.state
				shipToZip jsonObj.zip
				shipToPhone '7241112222'
				shipToCountry jsonObj.country



			}
		}


		def anr = s.submit()
		println ("anr.responseReasonText:::::::::"+anr.responseReasonText)
		//println ("anr.transactionId:::::::::"+anr.transactionId)

		def cart_inst

		def line_item_query = "SELECT id from cart_line_item where session_id = '"+sessionId+"' and "+
				"id not in(SELECT cart_line_item_id FROM `cart` where session_id='"+sessionId+"')"

		def line_item_list = []

		try {

			db.eachRow(line_item_query) {

				line_item_list<< it.toRowResult()
			}
		}catch (Exception e) {

		}


		def save_status = ""





		if(anr.responseReasonText == "This transaction has been approved."){

			def result = line_item_list?.collect {

				def line_item_inst = CartLineItem.get(it.id)

				if(jsonObj.billing_address){

					cart_inst = new Cart(totalAmount:total1,transationId:anr.transactionId,firstName:jsonObj.firstName,

					lastName:jsonObj.lastName,phoneNumber:jsonObj.phone,

					email:jsonObj.email,billingAddress1:jsonObj.address,

					billingCity:jsonObj.city,billingState:jsonObj.state,

					billingZip:jsonObj.zip,

					billingStreet:jsonObj.street,billingCountry:jsonObj.country,

					shippingAddress1:jsonObj.billing_address,shippingCity:jsonObj.billing_city,

					shippingState:jsonObj.billing_city,shippingZip:jsonObj.billing_zip,

					shippingStreet:jsonObj.billing_street,shippingCountry:jsonObj.billing_country,

					sessionId:sessionId,cartLineItem:line_item_inst)
				}else{


					cart_inst = new Cart(totalAmount:total1.toString(),transationId:anr.transactionId,firstName:jsonObj.firstName,

					lastName:jsonObj.lastName,phoneNumber:jsonObj.phone,

					email:jsonObj.email,billingAddress1:jsonObj.address,

					billingCity:jsonObj.city,billingState:jsonObj.state,

					billingZip:jsonObj.zip,

					billingStreet:jsonObj.street,billingCountry:jsonObj.country,

					sessionId:sessionId,cartLineItem:line_item_inst)

				}

				if(cart_inst.save(flush:true)){
					//println("cart_inst ::::::::::::;"+cart_inst)
					save_status = "true"

					cartIdList.add(cart_inst.id)

				}

			}

			//println("cartIdList ::::::::::::::"+cartIdList)


			if(save_status == "true"){

				chain(controller:"home" ,action: "shoppingCart", model: [transaction_message: "success",session_id:sessionId,cart_id_List_data:cartIdList])

			}



		}else{

			//println("enddddddddddddddddddddddddddddddddddd ")

			redirect(controller:"home" ,action: "shoppingCart")
		}


	}

	def showShoppingProductList = {



		println("params inside :::::   showShoppingProductList :::::!!!!!!!!!!!!!!!!!!"+params)
	}





	def shoppingCart(){


		//println("println :::::::::::::::::::"+params)
	}

	def giftShop(){



	}

	def detailProduct(){

		//println("session.Username  111111 ")


	}

	def cartList(){

		//println("params::::::::::::::inside cartList :::::::::::"+params)

	}

	def shoppingProductList(){



	}


}
