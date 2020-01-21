package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad_Category;

import java.util.ArrayList;

public interface AdCategory {


    Long create(Ad_Category ad_category);
    int update(Ad_Category ad_category);

}
