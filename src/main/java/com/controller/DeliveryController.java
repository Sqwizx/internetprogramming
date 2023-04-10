package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.model.Delivery;
import com.model.User;

import bdUtil.DbConnect;

@Controller
public class DeliveryController {
	@RequestMapping(value = "/medicineDelivery", method = RequestMethod.GET)
	public String checkStressLevel(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		return "medicineDelivery";
	}

	@RequestMapping("/trackDelivery")
	protected ModelAndView trackDelivery(HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null)
			model.setViewName("redirect:/");
		Delivery item = new Delivery();
		int id = Integer.parseInt(request.getParameter("deliveryId"));
		try {
			Connection conn = DbConnect.openConnection();
			String sql = "select * from delivery JOIN user ON delivery.iduser=user.id WHERE delivery.id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				item.setId(rs.getInt("delivery.id"));
				item.setRecipientName(rs.getString("user.last_name"));
				item.setDeliveryAddress(rs.getString("user.address"));
				item.setStatus(rs.getString("delivery.status"));
			}
			request.setAttribute("delivery", item);
			conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		model.setViewName("delivery-status");
		return model;
	}

	
	@RequestMapping("/setInTransit")
	protected ModelAndView setInTransit(HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null)
			model.setViewName("redirect:/");
//		String role = (String) session.getAttribute("role");
//		if (!role.equals("admin")) {
//			model.setViewName("unauthorized");
//			return model;
//		}
		Delivery item = new Delivery();
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			Connection conn = DbConnect.openConnection();
			String sql = "Update delivery set status = 'In Transit' WHERE delivery.id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.executeUpdate();
			sql = "select * from delivery JOIN user ON delivery.iduser=user.id WHERE delivery.id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				item.setId(rs.getInt("delivery.id"));
				item.setRecipientName(rs.getString("user.last_name"));
				item.setDeliveryAddress(rs.getString("user.address"));
				item.setStatus(rs.getString("delivery.status"));
			}
			request.setAttribute("delivery", item);
			conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		model.setViewName("delivery-status");
		return model;
	}


	@RequestMapping("/setDelivered")
	protected ModelAndView setDelivered(HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null)
			model.setViewName("redirect:/");
		Delivery item = new Delivery();
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			Connection conn = DbConnect.openConnection();
			String sql = "Update delivery set status = 'Delivered' WHERE delivery.id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.executeUpdate();
			sql = "select * from delivery JOIN user ON delivery.iduser=user.id WHERE delivery.id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				item.setId(rs.getInt("delivery.id"));
				item.setRecipientName(rs.getString("user.last_name"));
				item.setDeliveryAddress(rs.getString("user.address"));
				item.setStatus(rs.getString("delivery.status"));
			}
			request.setAttribute("delivery", item);
			conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		model.setViewName("delivery-status");
		return model;
	}

	@RequestMapping("/setError")
	protected ModelAndView setError(HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null)
			model.setViewName("redirect:/");
		Delivery item = new Delivery();
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			Connection conn = DbConnect.openConnection();
			String sql = "Update delivery set status = 'Error' WHERE delivery.id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.executeUpdate();
			sql = "select * from delivery JOIN user ON delivery.iduser=user.id WHERE delivery.id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				item.setId(rs.getInt("delivery.id"));
				item.setRecipientName(rs.getString("user.last_name"));
				item.setDeliveryAddress(rs.getString("user.address"));
				item.setStatus(rs.getString("delivery.status"));
			}
			request.setAttribute("delivery", item);
			conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		model.setViewName("delivery-status");
		return model;
	}

	@ModelAttribute
	public void addAttributes(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
	}

}
