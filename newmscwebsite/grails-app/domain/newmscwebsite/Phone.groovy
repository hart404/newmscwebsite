package newmscwebsite

class Phone {
	String number

    static constraints = {
		number(nullable: true, blank: true, size: 0..24)
    }
}
