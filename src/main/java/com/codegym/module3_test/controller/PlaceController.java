package com.codegym.module3_test.controller;

import com.codegym.module3_test.entity.Place;
import com.codegym.module3_test.repository.BaseRepository;
import com.codegym.module3_test.repository.PlaceRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "placeController", urlPatterns = "/places/*")
public class PlaceController extends HttpServlet {
    private static PlaceRepository placeRepository  = new PlaceRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");

        // Lấy URI và context path
        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();
        String relativePath = uri.substring(contextPath.length());
        String[] pathParts = relativePath.split("/");
        String action = "";
        if (pathParts.length >= 3) {
            action = pathParts[2];
        }

        switch (action) {
            case "create":
                req.getRequestDispatcher("/view/form.jsp").forward(req, resp);
                break;
            case "delete":
                if (pathParts[3] == null) {
                    resp.sendRedirect(contextPath + "/places");
                } else {
                    int id = Integer.parseInt(pathParts[3]);
                    placeRepository.delete(id);
                    resp.sendRedirect(contextPath + "/places");
                }
                break;
            default:
                String type = req.getParameter("type");
                String num_of_floors = req.getParameter("num_of_floors");
                String start_date = req.getParameter("start_date");
                String end_date = req.getParameter("end_date");
                Map<String, String> params = new HashMap<>();
                if (type != null) {
                    params.put("type", type);
                }

                if (num_of_floors != null) {
                    params.put("num_of_floors", num_of_floors);
                }

                if (start_date != null) {
                    params.put("start_date", start_date);
                }

                if (end_date != null) {
                    params.put("end_date", end_date);
                }
                List<Place> places = placeRepository.getAll(params);
                req.setAttribute("places", places);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        int type = Integer.parseInt(req.getParameter("type"));
        int status = Integer.parseInt(req.getParameter("status"));
        double acreage = Double.parseDouble(req.getParameter("acreage"));
        int num_of_floors = Integer.parseInt(req.getParameter("num_of_floors"));
        double price = Double.parseDouble(req.getParameter("price"));
        String start_date  = req.getParameter("start_date");
        String end_date = req.getParameter("end_date");
        String description = req.getParameter("description");
        Map<String, String> errors = new HashMap<>();
        String regex = "^[a-zA-Z0-9]{3}-[a-zA-Z0-9]{2}-[a-zA-Z0-9]{2}+$";
        if (code.isEmpty()) {
            errors.put("code", "Mã mặt bằng không được phép trống");
        } else if (!code.matches(regex)) {
            errors.put("code", "Mã mặt bằng không đúng định dạng!!! Định dạng đúng là XXX-XX-XX");
        }

        if (acreage < 20) {
            errors.put("acreage", "Diện tích phải lớn hơn 20");
        }

        if (price < 1000000) {
            errors.put("price", "Giá thuê phải lớn hơn 1000000");
        }
        Place place = new Place(code, status, acreage, num_of_floors,type, price, start_date, end_date, description);
        if (errors.size() > 0) {
            req.setAttribute("errors", errors);
            req.setAttribute("place", place);
            req.getRequestDispatcher("/view/form.jsp").forward(req, resp);
        } else {

            placeRepository.save(place);

            resp.sendRedirect(req.getContextPath() + "/places");
        }
    }
}
