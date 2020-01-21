package com.codeup.adlister.dao;


import com.codeup.adlister.config.Config;
import com.codeup.adlister.models.Ad_Category;

public class DaoFactory {
    private static Ads adsDao;
    private static Users usersDao;
    private static Ad_Category ad_categoryDao;
    private static Config config = new Config();

    public static Ads getAdsDao() {
        if (adsDao == null) {
            adsDao = new MySQLAdsDao(config);
        }
        return adsDao;
    }

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new MySQLUsersDao(config);
        }
        return usersDao;
    }

    public static Ad_Category getAd_categoryDao(){
        if(ad_categoryDao == null) {
            ad_categoryDao = new MySQLAdsCategoryDao(config);
        }
        return ad_categoryDao;
    }
}
