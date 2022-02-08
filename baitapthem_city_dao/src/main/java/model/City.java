package model;

public class City {
    private int id;
    private String name;
    private double popular;
    private double area;
    private double GDP;
    private String country;

    public City() {
    }

    public City(String name, double popular, double area, double GDP, String country) {
        this.name = name;
        this.popular = popular;
        this.area = area;
        this.GDP = GDP;
        this.country = country;
    }

    public City(int id, String name, double popular, double area, double GDP, String country) {
        this.id = id;
        this.name = name;
        this.popular = popular;
        this.area = area;
        this.GDP = GDP;
        this.country = country;
    }

    public City(String name, double popular, double area, double GDP) {
        this.name = name;
        this.popular = popular;
        this.area = area;
        this.GDP = GDP;
    }

    public City(int id, String name, double popular, double area, double GDP) {
        this.id = id;
        this.name = name;
        this.popular = popular;
        this.area = area;
        this.GDP = GDP;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPopular() {
        return popular;
    }

    public void setPopular(double popular) {
        this.popular = popular;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public double getGDP() {
        return GDP;
    }

    public void setGDP(double GDP) {
        this.GDP = GDP;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
