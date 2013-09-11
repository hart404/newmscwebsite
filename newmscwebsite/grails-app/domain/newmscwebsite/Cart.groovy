package newmscwebsite

class Cart {
	
	String totalAmount
	
	
	
	Date dateCreated
	Date lastUpdated
	
	
	String transationId
	
	
	String firstName
	String lastName
	String phoneNumber
	String email
	
	
	String shippingAddress1
	String shippingCity
	String shippingState
	String shippingZip
	String shippingStreet
	String shippingCountry
	
	
	String billingAddress1
	String billingCity
	String billingState
	String billingZip
	String billingStreet
	String billingCountry

	
	String sessionId
	
	static belongsTo = [cartLineItem:CartLineItem]


    static constraints = {
		
		 transationId(nullable:true)
		
		 shippingAddress1(nullable:true)
		 shippingCity(nullable:true)
		 shippingState(nullable:true)
		 shippingZip(nullable:true)
		 shippingStreet(nullable:true)
		 shippingCountry(nullable:true)
		
		
		 billingAddress1(nullable:true)
		 billingCity(nullable:true)
		 billingState(nullable:true)
		 billingZip(nullable:true)
		 billingStreet(nullable:true)
		 billingCountry(nullable:true)
		 
		 phoneNumber(nullable:true)
		 email(nullable:true)
		 
    }
}
