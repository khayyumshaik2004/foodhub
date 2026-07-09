package com.food.model;

public class Menu {

    private int id;
    private int restaurantId;
    private String itemName;
    private double price;
    private String category;
    private double rating;
    private boolean isAvailable;
    private String image;
    private String description;

    public Menu() {
    }

    // Constructor with all fields
    public Menu(int id, int restaurantId, String itemName,
                double price, String category,String image
                ,double rating, boolean isAvailable,
                 String description) {

        this.id = id;
        this.restaurantId = restaurantId;
        this.itemName = itemName;
        this.price = price;
        this.category = category;
        this.image = image;
        this.rating = rating;
        this.isAvailable = isAvailable;
        
        this.description = description;
    }

    // Constructor without id
    public Menu(int restaurantId, String itemName,
                double price, String category,String image,
                double rating, boolean isAvailable,
                 String description) {

        this.restaurantId = restaurantId;
        this.itemName = itemName;
        this.price = price;
        this.category = category;
        this.image = image;
        this.rating = rating;
        this.isAvailable = isAvailable;
        
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Menu [id=" + id +
                ", restaurantId=" + restaurantId +
                ", itemName=" + itemName +
                ", price=" + price +
                ", category=" + category +
                ", image=" + image +
                ", rating=" + rating +
                ", isAvailable=" + isAvailable +
                ", description=" + description + "]";
    }
}