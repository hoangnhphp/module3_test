package com.codegym.module3_test.repository;

import com.codegym.module3_test.entity.Place;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class PlaceRepository {
    private static String selectAll = "select * from places";

    public List<Place> getAll(Map<String, String> search) {
        List<Place> places = new ArrayList<Place>();
        SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        String query = selectAll;
        if (search.containsKey("status")) {
            query += " where status = " + search.get("status");
        }
        if (search.containsKey("type")) {
            query += " where type = " + search.get("type");
        }
        if (search.containsKey("num_of_floor")) {
            query += " where num_of_floor = " + search.get("num_of_floor");
        }
        if (search.containsKey("start_date")) {
            String startDate = "";
            try {
                Date date = inputFormat.parse(search.get("start_date"));
                startDate = outputFormat.format(date);
            } catch (ParseException e) {
                System.out.println("Lỗi phân tích ngày: " + e.getMessage());
            }
            query += " where start_date >= " + startDate;
        }
        if (search.containsKey("end_date")) {
            String endDate = "";
            try {
                Date date = inputFormat.parse(search.get("end_date"));
                endDate = outputFormat.format(date);
            } catch (ParseException e) {
                System.out.println("Lỗi phân tích ngày: " + e.getMessage());
            }
            query += " where end_date <= " + endDate;
        }
        query += " order by  acreage";
        try (
            Connection connection = BaseRepository.getConnection();
            PreparedStatement statement = connection.prepareStatement(query)
        ) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Place place = new Place(
                    rs.getInt("id"),
                    rs.getString("code"),
                    rs.getInt("status"),
                    rs.getDouble("acreage"),
                    rs.getInt("num_of_floors"),
                    rs.getInt("type"),
                    rs.getDouble("price"),
                    rs.getString("start_date"),
                    rs.getString("end_date"),
                    rs.getString("description")
                );
                places.add(place);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return places;
    }

    public void save(Place place) {
        SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        String start = "";
        String end = "";
        try {
            Date date = inputFormat.parse(place.getStart_date());
            Date date2 = inputFormat.parse(place.getEnd_date());
            start = outputFormat.format(date);
            end = outputFormat.format(date2);
        } catch (ParseException e) {
            System.out.println("Lỗi phân tích ngày: " + e.getMessage());
        }
        try {
            PreparedStatement statement = BaseRepository.getConnection().prepareStatement("insert into places (code, status ,acreage ,num_of_floors ,type ,price ,start_date,end_date ,description) values (?,?,?,?,?,?,?,?,?)");
            statement.setString(1, place.getCode());
            statement.setString(2, String.valueOf(place.getStatus()));
            statement.setString(3, String.valueOf(place.getAcreage()));
            statement.setString(4, String.valueOf(place.getNum_of_floors()));
            statement.setString(5, String.valueOf(place.getType()));
            statement.setString(6, String.valueOf(place.getPrice()));
            statement.setString(7, start);
            statement.setString(8, end);
            statement.setString(9, place.getDescription());

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void delete (int id) {
        String deleteSql = "DELETE FROM places WHERE id = ?";
        try (
                Connection connection = BaseRepository.getConnection();
                PreparedStatement deleteStmt = connection.prepareStatement(deleteSql)
        ) {
            deleteStmt.setString(1, String.valueOf(id));
            deleteStmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating product specifications", e);
        }
    }
}
