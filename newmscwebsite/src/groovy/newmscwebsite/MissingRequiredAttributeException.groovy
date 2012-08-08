package newmscwebsite

class MissingRequiredAttributeException extends RuntimeException {

    MissingRequiredAttributeException(String attribute) {
        super(String.format("Required attribute %s is missing.", attribute))
    }

}
