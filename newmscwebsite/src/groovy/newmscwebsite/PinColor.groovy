package newmscwebsite

public enum PinColor {
	WHITE('White', 'FFFFFF'),
	SILVER('Silver', 'C0C0C0'),
	GRAY('Gray', '808080'),
	BLACK('Black', '000000'),
	RED('Red', 'FF0000'),
	MAROON('Maroon', '800000'),
	YELLOW('Yellow', 'FFFF00'),
	OLIVE('Olive', '808000'),
	LIME('Lime', '00FF00'),
	GREEN('Green', '008000'),
	AQUA('Aqua', '00FFFF'),
	TEAL('Teal', '008080'),
	BLUE('Blue', '0000FF'),
	NAVY('Navy', '000080'),
	FUCHSIA('Fuchsia', 'FF00FF'),
	PURPLE('Purple', '800080'),
	ORANGE('Orange', 'FFA500')
	
	String color
	String value
	
	PinColor(String color, String value) {
		this.color = color
		this.value = value
	}
	
	String color() {
		color
	}
	
	String value() {
		value
	}
}
