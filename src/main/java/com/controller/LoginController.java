package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.User;

import bdUtil.DbConnect;

@Controller
public class LoginController {

	@RequestMapping("")
	public String login(Model model) {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String handleLogin(HttpServletRequest request, Model model) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try {
			Connection conn = DbConnect.openConnection();
			String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				HttpSession session = request.getSession();
				/*
				 * session.setAttribute("username", username); session.setAttribute("password",
				 * password); session.setAttribute("first_name", rs.getString("first_name"));
				 * session.setAttribute("last_name", rs.getString("last_name"));
				 * session.setAttribute("role", rs.getString("role"));
				 * session.setAttribute("id", rs.getInt("id"));
				 */
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(username);
				user.setPassword(password);
				user.setFirst_name(rs.getString("first_name"));
				user.setLast_name(rs.getString("last_name"));
				user.setRole(rs.getString("role"));
				user.setCity(rs.getString("city"));
				session.setAttribute("user", user);
				return "redirect:/index";
			} else {
				model.addAttribute("error", "Invalid username or password");
				return "login";
			}
		} catch (SQLException e) {
			model.addAttribute("error", "Error while checking the username and password");
			return "login";
		}
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		return "index";
	}

	@RequestMapping("/logout")
	protected String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/registerForm")
	public String getRegisterForm(Model model) {
		return "register";
	}

	@ModelAttribute
	public void addAttributes(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
	}

}
