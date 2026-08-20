package com.library.dao.impl;

import org.springframework.jdbc.core.JdbcTemplate;

import com.library.dao.SecUsersDAO;

public class SecUsersDAOImpl implements SecUsersDAO {
    
    public JdbcTemplate jdbcTemplate;

    @Override
    public boolean isUserExists(String username) {
        String sql = "SELECT COUNT(*) FROM sec_users WHERE username = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, username);
        return count != null && count > 0;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
