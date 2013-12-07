package newmscwebsite

class ReportComment {
    Integer version = 0
    String code
    String comments
	String placeName
	String latitude
	String longitude
    BigInteger userId
    
    static belongsTo = [
		userId: SecUser
	]

    static constraints = {
        version(nullable: false)
        userId(nullable:false)
        code(nullable:false)
        comments(nullable:false,size:1..300)
    }
}
