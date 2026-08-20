package com.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.dao.SecUsersDAO;

@Controller
public class HomeController {

    @Autowired
    SecUsersDAO secUsersDAO;

    // Displays the Login Page
    @GetMapping("/login")
    public String login() {
        return "login"; // Resolves to /WEB-INF/views/login.jsp
    }

    @PostMapping("/login")
    public String handleLogin(@RequestParam String username, @RequestParam String password, Model model) {
        boolean isAuthenticated = secUsersDAO.isUserExists(username); // Check if the user exists in the database
        if(isAuthenticated) {
            // User exists, redirect to homepage or dashboard
            return "redirect:/homepage";
        } else {
            // User does not exist, show error message on login page
            model.addAttribute("error", "Invalid username or password");
            return "login"; // Stay on the login page
        }
    }

    @PostMapping("/register")
    @ResponseBody
    public String registration() {
        return "registration";
    }

    @GetMapping("/homepage")
    public String homePage(){
        
        return "homepage"; // Resolves to /WEB-INF/views/homepage.jsp
    }

    @RequestMapping("/test")
    @ResponseBody
    public String testApp() {
        return "Spring MVC is working inside VS Code!";
    }
}
