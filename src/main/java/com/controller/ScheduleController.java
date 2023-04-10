package com.controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.model.Schedule;
import com.model.User;

import bdUtil.DbConnect;

@Controller
public class ScheduleController {
	@RequestMapping(value = "/medicineSchedule", method = RequestMethod.GET)
	public String checkScheduleSession(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		ArrayList<Schedule> medilist = new ArrayList<Schedule>();
		try {
			Connection conn = DbConnect.openConnection();
			String sql = "select * from medicineSchedule";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Schedule item = new Schedule();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDosage(rs.getInt("dosage"));
				item.setFrequency(rs.getString("frequency"));
				item.setStart_date(rs.getDate("start_date"));
				item.setEnd_date(rs.getDate("end_date"));
				medilist.add(item);

			}
			session.setAttribute("medilist", medilist);
			conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return "medicineSchedule";
	}

//	@RequestMapping("/medicineSchedule")
//	protected ModelAndView getPage(HttpServletRequest request) throws Exception {
//		ModelAndView model = new ModelAndView();
//		HttpSession session = request.getSession();
//		if (session.getAttribute("username") == null)
//			model.setViewName("redirect:/");
//		
//		model.setViewName("medicineSchedule");
//		return model;
//	}

	@RequestMapping("/addMedicine")
	public ModelAndView addMedicine(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			model.setViewName("redirect:/");
		}
		model.setViewName("add-medicine");
		return model;
	}

	@RequestMapping("/addMedicine/submit")
	public String add(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		try {
			Connection conn = DbConnect.openConnection();
			String sql = "insert into medicineSchedule(name, dosage, frequency, start_date, end_date,userid) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			User user = (User) session.getAttribute("user");
			stmt.setString(1, request.getParameter("name"));
			stmt.setInt(2, Integer.parseInt(request.getParameter("dosage")));
			stmt.setString(3, request.getParameter("frequency"));
			stmt.setDate(4, Date.valueOf(request.getParameter("start_date")));
			stmt.setDate(5, Date.valueOf(request.getParameter("end_date")));
			stmt.setInt(6, user.getId());
			stmt.executeUpdate();
			conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return "redirect:/medicineSchedule";
	}

	@RequestMapping("/updateMedicine")
	public ModelAndView updateMedicine(HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			model.setViewName("redirect:/");
		}
		Schedule item = new Schedule();
		try {
			Connection conn = DbConnect.openConnection();
			String sql = "select * from medicineSchedule WHERE id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(request.getParameter("id")));
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setDosage(rs.getInt("dosage"));
				item.setFrequency(rs.getString("frequency"));
				item.setStart_date(rs.getDate("start_date"));
				item.setEnd_date(rs.getDate("end_date"));

			}
			session.setAttribute("item", item);
			conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		model.setViewName("update-medicine");
		return model;
	}

	@RequestMapping("/updateMedicine/submit")
	public String update(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		try {
			Connection conn = DbConnect.openConnection();
			String sql = "update medicineSchedule set name = ?, dosage= ?, frequency= ?, start_date= ?, end_date= ? WHERE id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, request.getParameter("name"));
			stmt.setInt(2, Integer.parseInt(request.getParameter("dosage")));
			stmt.setString(3, request.getParameter("frequency"));
			stmt.setDate(4, Date.valueOf(request.getParameter("start_date")));
			stmt.setDate(5, Date.valueOf(request.getParameter("end_date")));
			stmt.setInt(6, Integer.parseInt(request.getParameter("id")));
			stmt.executeUpdate();
			conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return "redirect:/medicineSchedule";
	}

	@RequestMapping("/deleteMedicine")
	public String delete(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		try {
			Connection conn = DbConnect.openConnection();
			String sql = "delete FROM medicineSchedule WHERE id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(request.getParameter("id")));
			stmt.executeUpdate();
			conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return "redirect:/medicineSchedule";
	}

	@ModelAttribute
	public void addAttributes(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
	}

}