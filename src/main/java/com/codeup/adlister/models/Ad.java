package com.codeup.adlister.models;

import java.sql.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private List<String> categories = new ArrayList<>();

    public Ad() {
    }

    public Ad(long id, long userId, String title, String description, List<String> categories) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.categories = categories;
    }

    public Ad(long id, long userId, String title, String description) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
    }



    public Ad(long userId, String title, String description, List<String> categories) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.categories = categories;
    }

    public Ad(long userId, String title, String description) {
        this.userId = userId;
        this.title = title;
        this.description = description;
    }

    public void addToCategories(String category){
        this.categories.add(category);
    }

    public void printCatg(){
        for (String category : categories) {
            System.out.println("c: "+ category);
        }
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<String> getCategories() {
        return categories;
    }

    public void setCategories(List<String> categories) {
        this.categories = categories;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Ad{" +
                "id=" + id +
                ", userId=" + userId +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", categories=" + categories +
                '}';
    }
}
