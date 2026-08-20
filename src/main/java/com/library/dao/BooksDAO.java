package com.library.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.library.model.Book;

@Repository
public interface BooksDAO {

    List<Book> getAllBooks();
}
