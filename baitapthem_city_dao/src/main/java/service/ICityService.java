package service;

import model.City;
import model.Country;

import java.sql.SQLException;
import java.util.List;

public interface ICityService {
    public void insertCity(City city, int id_country) throws SQLException;

    public City selectCity(int id);

    public List<City> selectAllCities();

    public List<Country> selectAllCountries();

    public boolean deleteCity(int id) throws SQLException;

    public boolean updateCity(City city, int id_country) throws SQLException;
}
