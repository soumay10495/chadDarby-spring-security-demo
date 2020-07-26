package demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private DataSource dataSource;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource);
/*
       User.UserBuilder users = User.withDefaultPasswordEncoder();
       auth.inMemoryAuthentication()
                .withUser(users.username("John").password("1234").roles("EMPLOYEE"))
                .withUser(users.username("Mary").password("1234").roles("EMPLOYEE","MANAGER"))
                .withUser(users.username("Susan").password("1234").roles("EMPLOYEE","ADMIN"));
*/
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        /*
        http.authorizeRequests()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/loginPage")
                .loginProcessingUrl("/authenticateUser")
                .permitAll()
                .and()
                .logout()
                .permitAll();
        */

        http.authorizeRequests()
                //.antMatchers("/").permitAll()  // allow public access to home page
                .antMatchers("/").hasRole("EMPLOYEE")
                .antMatchers("/manager/**").hasRole("MANAGER")
                .antMatchers("/admin/**").hasRole("ADMIN")
                .and()
                .formLogin()
                .loginPage("/loginPage")
                .loginProcessingUrl("/authenticateUser")
                .permitAll()
                .and()
                .logout()
                //.logoutSuccessUrl("/")  // after logout then redirect to landing page (root)
                .permitAll()
                .and()
                .exceptionHandling()
                .accessDeniedPage("/accessDenied");
    }
}
