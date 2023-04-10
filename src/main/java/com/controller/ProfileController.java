package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.model.User;
import bdUtil.DbConnect;

@Controller
public class ProfileController {

	@RequestMapping(value = "/manageProfile", method = RequestMethod.GET)
	public String checkStressLevel(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		User user = (User) session.getAttribute("user");
		int id = user.getId();

		Connection conn = DbConnect.openConnection();
		PreparedStatement stmt = conn.prepareStatement("SELECT * FROM user WHERE id = ?");
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			user.setFirst_name(rs.getString("first_name"));
			user.setLast_name(rs.getString("last_name"));
			user.setEmail(rs.getString("email"));
			user.setAddress(rs.getString("address"));
			model.addAttribute("user", user);
			return "manageProfile";
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/saveChanges", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("user") User user, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		int id = ((User) session.getAttribute("user")).getId();
		Connection conn = DbConnect.openConnection();
		PreparedStatement stmt = conn
				.prepareStatement("UPDATE user SET first_name = ?, last_name = ?, email = ?, address = ? WHERE id = ?");
		stmt.setString(1, user.getFirst_name());
		stmt.setString(2, user.getLast_name());
		stmt.setString(3, user.getEmail());
		stmt.setString(4, user.getAddress());
		stmt.setInt(5, id);
		stmt.executeUpdate();
		conn.close();
		ModelAndView model = new ModelAndView();
		model.addObject("message", "Changes saved successfully!");
		return "redirect:/manageProfile";
	}

	@ModelAttribute
	public void addAttributes(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
	}
}