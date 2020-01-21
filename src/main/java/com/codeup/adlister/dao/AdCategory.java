package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad_Category;

import java.util.ArrayList;

public interface AdCategory {

    ArrayList<Ad_Category> all();
    Ad_Category getById(Long id);
    Long create(Ad_Category ad_category);
    int update(Ad_Category ad_category);

}
