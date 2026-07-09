package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.MenuDAO;
import com.food.model.Menu;
import com.food.util.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    @Override
    public void addMenu(Menu m) {
        String sql = "INSERT INTO menu(restaurant_id,item_name,price,category,image,rating,isAvailable,description) VALUES(?,?,?,?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, m.getRestaurantId());
            ps.setString(2, m.getItemName());
            ps.setDouble(3, m.getPrice());
            ps.setString(4, m.getCategory());
            ps.setString(5, m.getImage());
            ps.setDouble(6, m.getRating());
            ps.setBoolean(7, m.isAvailable());
            ps.setString(8, m.getDescription());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Menu getMenu(int id) {
        Menu m = null;
        String sql = "SELECT * FROM menu WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    m = new Menu(
                            rs.getInt("id"),
                            rs.getInt("restaurant_id"),
                            rs.getString("item_name"),
                            rs.getDouble("price"),
                            rs.getString("category"),
                            rs.getString("image"),
                            rs.getDouble("rating"),
                            rs.getBoolean("isAvailable"),
                            rs.getString("description")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return m;
    }

    @Override
    public void updateMenu(Menu m) {
        String sql = "UPDATE menu SET restaurant_id=?, item_name=?, price=?, category=?,image=?, rating=?, isAvailable=?, description=? WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, m.getRestaurantId());
            ps.setString(2, m.getItemName());
            ps.setDouble(3, m.getPrice());
            ps.setString(4, m.getCategory());
            ps.setString(5, m.getImage());
            ps.setDouble(6, m.getRating());
            ps.setBoolean(7, m.isAvailable());
            
            ps.setString(8, m.getDescription());
            ps.setInt(9, m.getId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMenu(int id) {
        String sql = "DELETE FROM menu WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Menu> getMenuByRestaurant(int restaurantId) {
        List<Menu> list = new ArrayList<>();
        String sql = "SELECT * FROM menu WHERE restaurant_id=?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Menu m = new Menu(
                            rs.getInt("id"),
                            rs.getInt("restaurant_id"),
                            rs.getString("item_name"),
                            rs.getDouble("price"),
                            rs.getString("category"),
                            rs.getString("image"),
                            rs.getDouble("rating"),
                            rs.getBoolean("isAvailable"),
                            rs.getString("description")
                    );
                    list.add(m);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}