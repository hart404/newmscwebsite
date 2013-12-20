package newmscwebsite

class CartLineItem {
	
	String quantity
	String unitPrice
	String totalLineItemPrice
	String sessionId
	Boolean ordered = false
	
	
	static belongsTo = [product:Product]

    static constraints = {
		
		sessionId(nullable:true)
    }
}
