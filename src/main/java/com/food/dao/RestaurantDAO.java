package com.food.dao;

import java.util.List;

import com.food.model.Restaurant;


public interface RestaurantDAO {
    void addRestaurant(Restaurant r);
    List<Restaurant> getAllRestaurants();

    Restaurant getRestaurant(int restaurantId);

    void updateRestaurant(Restaurant restaurant);

    void deleteRestaurant(int restaurantId);
}