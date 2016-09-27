package com.javacodegeeks.examples.model;

import java.util.List;

import org.springframework.data.domain.*;
import org.springframework.data.repository.*;

public interface CityRepository extends CrudRepository<City, Long> {

    //Page<City> findAll();

    City findByNameAndCountryAllIgnoringCase(String name, String country);
    
    List<City> findByCountry(String country);

}
