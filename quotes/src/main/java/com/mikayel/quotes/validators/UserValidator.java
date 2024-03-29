package com.mikayel.quotes.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import com.mikayel.quotes.models.User;
import com.mikayel.quotes.repositories.UserRepository;


@Component
public class UserValidator implements Validator {
	
	@Autowired
	private UserRepository uRepo;

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirmation", "Match", "Password is incorrect");
        }                
        if (this.uRepo.findByEmail(user.getEmail()) !=null) {
        	errors.rejectValue("email", "Unique", "Email adress already exists");
        }
    }
}
