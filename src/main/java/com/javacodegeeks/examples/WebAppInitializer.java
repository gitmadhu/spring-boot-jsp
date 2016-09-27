package com.javacodegeeks.examples;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;

import com.javacodegeeks.examples.model.City;
import com.javacodegeeks.examples.model.CityRepository;


@SpringBootApplication
@ComponentScan("com.javacodegeeks.examples")
public class WebAppInitializer{

	private static final Logger log = LoggerFactory.getLogger(WebAppInitializer.class);
    public static void main(String[] args) throws Exception{
        SpringApplication.run(WebAppInitializer.class, args);
    }
    
    @Bean
	public CommandLineRunner demo(CityRepository repository) {
		return (args) -> {
			// save a couple of customers
			repository.save(new City("Hyderabad", "India"));
			repository.save(new City("Bangalore", "India"));
			repository.save(new City("London", "Briton"));
			repository.save(new City("California", "USA"));
			repository.save(new City("New Jersey", "USA"));

			// fetch all Citys
			log.info("Citys found with findAll():");
			log.info("-------------------------------");
			for (City customer : repository.findAll()) {
				log.info(customer.toString());
			}
            log.info("");

			// fetch an individual City by ID
            City customer = repository.findOne(1L);
			log.info("City found with findOne(1L):");
			log.info("--------------------------------");
			log.info(customer.toString());
            log.info("");

			// fetch customers by last name
			log.info("City found with findByLastName('India'):");
			log.info("--------------------------------------------");
			for (City bauer : repository.findByCountry("India")) {
				log.info(bauer.toString());
			}
            log.info("");
		};
	}
}

