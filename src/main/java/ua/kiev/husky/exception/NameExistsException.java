package ua.kiev.husky.exception;

public class NameExistsException extends RuntimeException {
    public NameExistsException(String message) {
        super(message);
    }

    public NameExistsException(String message, Throwable cause) {
        super(message, cause);
    }
}
