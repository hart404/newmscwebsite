package newmscwebsite

class Product {	
	String productName
	String productTitle
	String productDescription
	String unitPrice
	String promotionalPrice
	String productImageUrl
	String quantity

    static constraints = {
		
		quantity(nullable:true)
		promotionalPrice(nullable:true)
    }
	
}

