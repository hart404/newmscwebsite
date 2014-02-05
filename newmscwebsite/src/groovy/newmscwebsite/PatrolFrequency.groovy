package newmscwebsite

public enum PatrolFrequency {
	FREQUENCY_A("Frequency A"),
	FREQUENCY_B("Frequency B"),
	FREQUENCY_C("Frequency C"),
	FREQUENCY_D("Frequency D"),
	FREQUENCY_Z("Other")
	
	private final String value
	
	PatrolFrequency(String value) {
		this.value = value
	}
	
	String value() {
		value
	}
	
	String representation() {
		value
	}
}
