package movie.pro.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	UsersUserDetailService usersUserDetailService;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests().antMatchers("/").permitAll();
		
		 //http.authorizeRequests().antMatchers("/mainpage").authenticated();//인증에 통과만
		http.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN");
		http.authorizeRequests().antMatchers("/qnabd/insert","qnabd/udate/**").hasRole("ADMIN");
		http.csrf().disable();
		http.formLogin().loginPage("/login");
		http.exceptionHandling();
		http.logout().invalidateHttpSession(true).deleteCookies().logoutSuccessUrl("/mainpage");
		
		http.userDetailsService(usersUserDetailService);
		
	}
	
	  @Bean public PasswordEncoder passwordEncoder() { return
	  PasswordEncoderFactories.createDelegatingPasswordEncoder(); }
	 
}
