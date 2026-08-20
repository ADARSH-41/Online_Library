package com.library.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface SecUsersDAO {
    
    boolean isUserExists(String username);
}
