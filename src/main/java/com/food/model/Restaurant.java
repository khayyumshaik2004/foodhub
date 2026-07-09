package com.food.model;

public class Restaurant {

    private int id;
    private String name;
    private String cuisine;
    private String address;
    private double rating;
    private boolean active;
    private String image;

    public Restaurant() {
    }

    public Restaurant(int id, String name, String cuisine, String address,
                      double rating, boolean active, String image) {
        this.id = id;
        this.name = name;
        this.cuisine = cuisine;
        this.address = address;
        this.rating = rating;
        this.active = active;
        this.image = image;
    }

    public Restaurant(String name, String cuisine, String address,
                      double rating, boolean active, String image) {
        this.name = name;
        this.cuisine = cuisine;
        this.address = address;
        this.rating = rating;
        this.active = active;
        this.image = image;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCuisine() { return cuisine; }
    public void setCuisine(String cuisine) { this.cuisine = cuisine; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }

    public boolean isActive() { return active; }
    public void setActive(boolean active) { this.active = active; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    @Override
    public String toString() {
        return "Restaurant{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", cuisine='" + cuisine + '\'' +
                ", address='" + address + '\'' +
                ", rating=" + rating +
                ", active=" + active +
                ", image='" + image + '\'' +
                '}';
    }
}