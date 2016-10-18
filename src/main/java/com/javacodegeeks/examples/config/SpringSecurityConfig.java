package com.javacodegeeks.examples.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@Configuration
@Order(SecurityProperties.ACCESS_OVERRIDE_ORDER)
class SpringSecurityConfig extends WebSecurityConfigurerAdapter {


	 @Autowired
	    private UserDetailsService userDetailsService;

	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http
			        .authorizeRequests()
		            .antMatchers("/","/register/**","/images/**", "/css/**", "/js/**", "/webjars/**", "/public/**").permitAll()
		            .and()
	                .formLogin()
	                .defaultSuccessUrl("/notes")
	                .loginPage("/login")
	                .failureUrl("/login?error")
	                .usernameParameter("email")
	                .permitAll()
	                .and()
	                .logout()
	                .permitAll()
	                .and()
	                .authorizeRequests()
	                .anyRequest()
	                .authenticated();
	    }

	    @Override
	    public void configure(AuthenticationManagerBuilder auth) throws Exception {
	        auth
	                .userDetailsService(userDetailsService)
	                .passwordEncoder(new BCryptPasswordEncoder());
	    }

}
