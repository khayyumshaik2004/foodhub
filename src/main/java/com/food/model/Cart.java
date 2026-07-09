package com.food.model;

import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items =
            new LinkedHashMap<>();

    public void addItem(CartItem item) {

        if(items.containsKey(item.getMenuId())) {

            CartItem existing =
                    items.get(item.getMenuId());

            existing.setQuantity(
                    existing.getQuantity() + 1);
        }
        else {
            items.put(item.getMenuId(), item);
        }
    }

    public void updateItem(int menuId,int quantity) {

        if(items.containsKey(menuId)) {

            items.get(menuId)
                 .setQuantity(quantity);
        }
    }

    public void removeItem(int menuId) {

        items.remove(menuId);
    }

    public Map<Integer, CartItem> getItems() {

        return items;
    }

    public double getGrandTotal() {

        double total = 0;

        for(CartItem item : items.values()) {

            total += item.getPrice()
                     * item.getQuantity();
        }

        return total;
    }
}