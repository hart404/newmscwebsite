package newmscwebsite

class Phone {
	String number

    static constraints = {
		number(nullable: true, size: 7..12)
    }
}
