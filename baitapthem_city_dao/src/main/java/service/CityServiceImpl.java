package service;

import connection.MyConnection;
import model.City;
import model.Country;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CityServiceImpl implements ICityService {
    private static final String INSERT_CITY_SQL = "insert into cities (name, popular, area, gdp, id_country) value (?, ?, ?, ?, ?);";
    private static final String SELECT_CITY_BY_ID = "select id, name, popular, area, gdp, country from cities_country where id = ?;";
    private static final String SELECT_ALL_CITIES = "select cities.id, cities.name, cities.popular, cities.area, cities.gdp, countries.country from cities\n" +
        "join countries on cities.id_country = countries.id_country order by cities.id;";
    private static final String SELECT_ALL_COUNTRIES = "select * from countries;";
    private static final String DELETE_CITY_SQL = "delete from cities where id = ?;";
    private static final String UPDATE_CITY_SQL = "update cities set name = ?, popular = ?, area = ?, gdp = ?, id_country = ? where id = ?;";
    MyConnection myConnection = new MyConnection();

    @Override
    public void insertCity(City city, int id_country) throws SQLException {
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CITY_SQL);
            preparedStatement.setString(1, city.getName());
            preparedStatement.setDouble(2, city.getPopular());
            preparedStatement.setDouble(3, city.getArea());
            preparedStatement.setDouble(4, city.getGDP());
            preparedStatement.setInt(5, id_country);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public City selectCity(int id) {
        City city = null;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CITY_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id_city = rs.getInt("id");
                String name = rs.getString("name");
                double popular = rs.getDouble("popular");
                double area = rs.getDouble("area");
                double GDP = rs.getDouble("gdp");
                String country = rs.getString("country");
                city = new City(id_city, name, popular, area, GDP, country);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return city;
    }

    @Override
    public List<City> selectAllCities() {

        List<City> cites = new ArrayList<>();
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CITIES);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id_city = rs.getInt("id");
                String name = rs.getString("name");
                double popular = rs.getDouble("popular");
                double area = rs.getDouble("area");
                double GDP = rs.getDouble("gdp");
                String country = rs.getString("country");
                cites.add(new City(id_city, name, popular, area, GDP, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cites;
    }

    @Override
    public List<Country> selectAllCountries() {

        List<Country> countries = new ArrayList<>();

        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_COUNTRIES);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id_country = rs.getInt("id_country");
                String country = rs.getString("country");
                countries.add(new Country(id_country, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return countries;
    }

    @Override
    public boolean deleteCity(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = myConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_CITY_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateCity(City city, int id_country) throws SQLException {

        boolean rowUpdated;
        try (Connection connection = myConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_CITY_SQL);) {
            statement.setString(1, city.getName());
            statement.setDouble(2, city.getPopular());
            statement.setDouble(3, city.getArea());
            statement.setDouble(4, city.getGDP());
            statement.setInt(5, id_country);
            statement.setInt(6, city.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
