package newmscwebsite

import com.vinomis.authnet.AuthorizeNet

class TestController {

    def index() { }
	
	def test(){
		
		def s = new AuthorizeNet()
		s.authorizeAndCapture {
			amount '100.00'
			ccNumber '370000000000002'
			cvv '122'
			ccExpDate '012011'
			email 'john@acme.com'
			invoiceId '123'
		}
	   def anr = s.submit()
	   println(" anr ::::::::::::::"+anr)
		
	}
	
	def donateInfo (){
		
		println("params::::::::vvvvvvvvvvvvvvvvvvvvvvvvvvvvv::::::inside donateInfo :::::::::::"+params)
	}

}
