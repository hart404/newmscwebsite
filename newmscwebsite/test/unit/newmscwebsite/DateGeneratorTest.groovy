package newmscwebsite

import grails.test.*

class DateGeneratorTest extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testDateGenerator1() {
		def generator = new DateGenerator(2, 2012)
		assert(generator.getMonthName() == "February")
		assert(generator.getDaysInMonth() == 29)
		assert(generator.getDaysToDisplayInPreviousMonth() == 3)
		assert(generator.getDaysToDisplayInNextMonth() == 3)
		assert(generator.getNumberOfWeeksToDisplay() == 5)
    }
	
	void testDateGenerator2() {
		def generator = new DateGenerator(4, 2012)
		assert(generator.getMonthName() == "April")
		assert(generator.getDaysInMonth() == 30)
		assert(generator.getDaysToDisplayInPreviousMonth() == 0)
		assert(generator.getDaysToDisplayInNextMonth() == 5)
		assert(generator.getNumberOfWeeksToDisplay() == 5)
	}
	
	void testDateGenerator3() {
		def generator = new DateGenerator(6, 2012)
		assert(generator.getMonthName() == "June")
		assert(generator.getDaysInMonth() == 30)
		assert(generator.getDaysToDisplayInPreviousMonth() == 5)
		assert(generator.getDaysToDisplayInNextMonth() == 0)
		assert(generator.getNumberOfWeeksToDisplay() == 5)
	}
	
	void testDateGenerator4() {
		def generator = new DateGenerator(9, 2012)
		assert(generator.getMonthName() == "September")
		assert(generator.getDaysInMonth() == 30)
		assert(generator.getDaysToDisplayInPreviousMonth() == 6)
		assert(generator.getDaysToDisplayInNextMonth() == 6)
		assert(generator.getNumberOfWeeksToDisplay() == 6)
	}
	
	void testDateGenerator5() {
		def generator = new DateGenerator(2, 2012)
		println generator.getCalendarRows()
	}

}

