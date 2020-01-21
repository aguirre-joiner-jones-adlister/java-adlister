package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Ad_Category;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    Ad getAdById(Long id);
    int editAd(Ad ad);
    int delete(Long id);

    void insertAdCat(Ad_Category adCat);
}
