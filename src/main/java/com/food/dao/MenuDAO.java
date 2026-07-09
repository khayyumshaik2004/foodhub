package com.food.dao;



import java.util.List;

import com.food.model.Menu;


public interface MenuDAO {
    void addMenu(Menu m);
    Menu getMenu(int menuId);

    void updateMenu(Menu menu);

    void deleteMenu(int menuId);

    List<Menu> getMenuByRestaurant(int restaurantId);
}