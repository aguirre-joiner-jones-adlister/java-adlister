package com.codeup.adlister.models;

public class Ad_Category {
    private Long adId;
    private Long categoryId;

    public Ad_Category() {
    }

    public Ad_Category(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Ad_Category(Long adId, Long categoryId) {
        this.adId = adId;
        this.categoryId = categoryId;
    }

    public Long getAdId() {
        return adId;
    }

    public void setAdId(Long adId) {
        this.adId = adId;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Ad_Category{" +
                "adId=" + adId +
                ", categoryId=" + categoryId +
                '}';
    }
}
