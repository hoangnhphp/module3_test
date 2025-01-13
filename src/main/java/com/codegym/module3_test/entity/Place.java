package com.codegym.module3_test.entity;

import java.util.Objects;

public class Place {
    private int id;
    private String code;
    private int status;
    private double acreage;
    private int num_of_floors;
    private int type;
    private double price;
    private String start_date;
    private String end_date;
    private String description;

    public Place() {}

    public Place(int id, String code, int status, double acreage, int num_of_floors, int type, double price, String start_date, String end_date, String description) {
        this.id = id;
        this.code = code;
        this.status = status;
        this.acreage = acreage;
        this.num_of_floors = num_of_floors;
        this.type = type;
        this.price = price;
        this.start_date = start_date;
        this.end_date = end_date;
        this.description = description;
    }

    public Place(String code, int status, double acreage, int num_of_floors, int type, double price, String start_date, String end_date, String description) {
        this.code = code;
        this.status = status;
        this.acreage = acreage;
        this.num_of_floors = num_of_floors;
        this.type = type;
        this.price = price;
        this.start_date = start_date;
        this.end_date = end_date;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getAcreage() {
        return acreage;
    }

    public void setAcreage(double acreage) {
        this.acreage = acreage;
    }

    public int getNum_of_floors() {
        return num_of_floors;
    }

    public void setNum_of_floors(int num_of_floors) {
        this.num_of_floors = num_of_floors;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Place place = (Place) o;
        return id == place.id;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}
