package com.library.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.library.dao.BooksDAO;
import com.library.model.Book;

public class BooksDAOImpl implements BooksDAO {

    private JdbcTemplate jdbcTemplate;
    
    @Override
    public List<Book> getAllBooks() {
        // Logic to retrieve all books from the database
        String sql = "SELECT id, title, author, publisher, publishedyear FROM books;";
        // Execute the query and map the results to a list of Book objects
        return this.jdbcTemplate.query(sql, new RowMapper<Book>() {
            @Override
            public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPublisher(rs.getString("publisher"));
                book.setPublishedDate(rs.getDate("published_date"));
                return book;
            }
        }); 
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
