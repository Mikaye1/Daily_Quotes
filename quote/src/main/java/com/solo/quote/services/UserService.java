package com.solo.quote.services;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.solo.quote.models.User;
import com.solo.quote.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository uRepo;
	
	public List<User> getAll(){
		return this.uRepo.findAll();
	}
	
	public User createUser(User u) {
		return this.uRepo.save(u);
	}
		
    // register user and hash their password
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return uRepo.save(user);
    }
    
    // find user by email
    public User findByEmail(String email) {
        return uRepo.findByEmail(email);
    }
    
    // find user by id
    public User findUserById(Long id) {
    	return this.uRepo.findById(id).orElse(null);
    }
    
    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = uRepo.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }
	public User getOne(Long id) {
		return this.uRepo.findById(id).orElse(null);
	}

}
