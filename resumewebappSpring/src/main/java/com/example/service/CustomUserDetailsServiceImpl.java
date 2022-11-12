package com.example.service;

import com.example.dao.impl.UserRepositoryCustom;
import com.example.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Service("userDetailsService")
public class CustomUserDetailsServiceImpl implements UserDetailsService {
    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
    @Autowired
    @Qualifier("userDao1")
    private UserRepositoryCustom userRepo;
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException{
      User user=userRepo.findByEmail(email);

        if(user!=null){
            UserBuilder builder=org.springframework.security.core.userdetails.User.withUsername(email);

            builder.disabled(false);
            builder.password(user.getPassword());

            String[] authoritiesArr=new String[]{"ADMIN","USER","USER_ROLE"};
            builder.authorities(authoritiesArr);
            return builder.build();
        }else{
            throw new UsernameNotFoundException("User not found.");
        }
    }
}
