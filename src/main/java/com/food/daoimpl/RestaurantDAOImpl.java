package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.RestaurantDAO;
import com.food.model.Restaurant;
import com.food.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    // ➕ ADD RESTAURANT
    @Override
    public void addRestaurant(Restaurant r) {
        String sql = "INSERT INTO restaurant(name, cuisine, address, rating, active, image) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, r.getName());
            ps.setString(2, r.getCuisine());
            ps.setString(3, r.getAddress());
            ps.setDouble(4, r.getRating());
            ps.setBoolean(5, r.isActive());   // ✅ boolean field
            ps.setString(6, r.getImage());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 🔍 GET BY ID
    @Override
    public Restaurant getRestaurant(int id) {
        Restaurant r = null;
        String sql = "SELECT * FROM restaurant WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    r = new Restaurant(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("cuisine"),
                        rs.getString("address"),
                        rs.getDouble("rating"),
                        rs.getBoolean("active"),   // ✅ boolean
                        rs.getString("image")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }

    // ✏️ UPDATE RESTAURANT
    @Override
    public void updateRestaurant(Restaurant r) {
        String sql = "UPDATE restaurant SET name=?, cuisine=?, address=?, rating=?, active=?, image=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, r.getName());
            ps.setString(2, r.getCuisine());
            ps.setString(3, r.getAddress());
            ps.setDouble(4, r.getRating());
            ps.setBoolean(5, r.isActive());   // ✅ boolean
            ps.setString(6, r.getImage());
            ps.setInt(7, r.getId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ❌ DELETE RESTAURANT
    @Override
    public void deleteRestaurant(int id) {
        String sql = "DELETE FROM restaurant WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 📋 GET ALL RESTAURANTS
    @Override
    public List<Restaurant> getAllRestaurants() {
        List<Restaurant> list = new ArrayList<>();
        String sql = "SELECT * FROM restaurant";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Restaurant r = new Restaurant(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("cuisine"),
                    rs.getString("address"),
                    rs.getDouble("rating"),
                    rs.getBoolean("active"),   // ✅ IMPORTANT
                    rs.getString("image")
                );
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}