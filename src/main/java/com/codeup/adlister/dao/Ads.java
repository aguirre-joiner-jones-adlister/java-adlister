package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Ad_Category;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad, String[] categories);
    Ad getAdById(Long id);
    void editAd(Ad ad, String[] categories);
    int delete(Long id);
    List<Ad> searchAds(String searchTerm);

    void insertAdCat(Ad_Category adCat);
}
