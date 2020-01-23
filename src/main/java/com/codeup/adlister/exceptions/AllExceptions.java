package com.codeup.adlister.exceptions;

public class AllExceptions extends Exception {
    private String message;

    public AllExceptions(String message) {
        super(String.format("%s", message));
    }
}
