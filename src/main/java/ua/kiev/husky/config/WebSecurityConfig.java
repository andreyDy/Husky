package ua.kiev.husky.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;


@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserDetailsService authenticationService;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(authenticationService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                   .antMatchers("/", "/registration/**", "/resources/**",
                           "/image/**").permitAll()
                   .anyRequest().authenticated()
                   .and()
                .formLogin()
                   .loginPage("/login")
                   .usernameParameter("email")
                   .failureUrl("/login?error=true")
                   .defaultSuccessUrl("/profile")
                   .permitAll()
                   .and()
                .logout()
                   .logoutUrl("/logout")
                   .logoutSuccessUrl("/login")
                   .permitAll()
                   .and()
                .csrf().disable();
        ;
    }
}
