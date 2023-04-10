package com.controller;

import java.sql.Connection;
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

import com.model.BMI;
//import com.model.Booking;
//import com.model.Booking;
import com.model.Delivery;
import com.model.Schedule;
import com.model.Stress;
import com.model.User;

import bdUtil.DbConnect;

@Controller
public class ReportController {
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String checkReportSession(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		return "report";
	}

	@RequestMapping("/reportaction")
	protected ModelAndView getAction(HttpServletRequest request) throws Exception {
		ModelAndView model = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null)
			model.setViewName("redirect:/");
		ArrayList<Schedule> medlist = new ArrayList<Schedule>();
		ArrayList<BMI> bmilist = new ArrayList<BMI>();
		ArrayList<Stress> stresslist = new ArrayList<Stress>();
		ArrayList<Delivery> deliverylist = new ArrayList<Delivery>();
//		ArrayList<Booking> bookinglist = new ArrayList<Booking>();
//		ArrayList<model> variable = new ArrayList<model>();
		try {
			User user = (User) session.getAttribute("user");
			Connection conn = DbConnect.openConnection();
			String sql = "";
//			if(request.getParameter("Filter").equals("BH")) {
//				sql="SELECT * FROM";
//			}else if(request.getParameter("Filter").equals("PM")) {
//				sql="SELECT * FROM";
//			}
			if (request.getParameter("Filter").equals("MS")) {
				sql = "SELECT * FROM medicineSchedule JOIN user ON medicineSchedule.userid=user.id WHERE medicineSchedule.userid=?";
			} else if (request.getParameter("Filter").equals("BMI")) {
				sql = "SELECT * FROM bmi_Data JOIN user ON bmi_Data.user_id=user.id WHERE bmi_Data.user_id=?";
			} else if (request.getParameter("Filter").equals("SL")) {
				sql = "SELECT * FROM stress JOIN user ON stress.userID=user.id WHERE stress.userID=?";
			} else if (request.getParameter("Filter").equals("MDS")) {
				sql = "SELECT * FROM delivery JOIN user ON delivery.iduser=user.id WHERE delivery.iduser=?";
//			} else if (request.getParameter("Filter").equals("BH")) {
//				sql = "SELECT * FROM booking JOIN doctor ON booking.doctorID=doctor.id";
			}
			PreparedStatement stmt = conn.prepareStatement(sql);
//			if (request.getParameter("Filter").equals("SL")||request.getParameter("Filter").equals("MS")||request.getParameter("Filter").equals("BMI")||request.getParameter("Filter").equals("MDS")) {
//				stmt.setInt(1, user.getId());
//			}
			stmt.setInt(1, user.getId());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
//				if(request.getParameter("Filter").equals("BH")) {
//					sql="SELECT * FROM";
//				}else if(request.getParameter("Filter").equals("PM")) {
//					sql="SELECT * FROM";
//				}
//				}else if(request.getParameter("Filter").equals("SL")) {
//					sql="SELECT * FROM stress";
//				}else 
				if (request.getParameter("Filter").equals("MS")) {
					Schedule item = new Schedule();
					item.setId(rs.getInt("id"));
					item.setName(rs.getString("name"));
					item.setDosage(rs.getInt("dosage"));
					item.setFrequency(rs.getString("frequency"));
					item.setStart_date(rs.getDate("start_date"));
					item.setEnd_date(rs.getDate("end_date"));
					medlist.add(item);
				} else if (request.getParameter("Filter").equals("BMI")) {
					BMI item = new BMI();
					item.setId(rs.getInt("id"));
					item.setWeight(rs.getDouble("weight"));
					item.setHeight(rs.getDouble("height"));
					item.setBmi(rs.getDouble("bmi"));
					item.setAge(rs.getInt("age"));
					item.setDescription(rs.getString("description"));
					bmilist.add(item);
				} else if (request.getParameter("Filter").equals("SL")) {
					Stress item = new Stress();
					item.setGender(rs.getString("gender"));
					item.setAge(rs.getString("age"));
//					item.setHealthConditions(rs.getArray("healthCondition"));
					item.setStressLevelResult(rs.getString("stressLevelResult"));
					item.setStressLevel(rs.getInt("stressLevel"));
					stresslist.add(item);
				} else if (request.getParameter("Filter").equals("MDS")) {
					Delivery item = new Delivery();
					item.setId(rs.getInt("id"));
					item.setStatus(rs.getString("status"));
					deliverylist.add(item);

//				} else if (request.getParameter("Filter").equals("BH")) {
//					Booking item = new Booking();
//					item.setId(rs.getInt("id"));
//					item.setDate(rs.getString("date"));
//					item.setTime(rs.getString("time"));
//					bookinglist.add(item);

				}
//			else if(request.getParameter("Filter").equals("PM")) {
//				session.setAttribute("", );
//			}
//			}else 
				if (request.getParameter("Filter").equals("MS")) {
					model.addObject("medlist", medlist);
				} else if (request.getParameter("Filter").equals("BMI")) {
					model.addObject("bmilist", bmilist);
				} else if (request.getParameter("Filter").equals("SL")) {
					model.addObject("stresslist", stresslist);
				} else if (request.getParameter("Filter").equals("MDS")) {
					model.addObject("deliverylist", deliverylist);
//				} else if (request.getParameter("Filter").equals("BH")) {
//					model.addObject("bookinglist", bookinglist);
				}

			}

			conn.close();

		}

		catch (SQLException ex) {
			ex.printStackTrace();
		}

		model.setViewName("report");
		return model;
	}

	@ModelAttribute
	public void addAttributes(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
	}

}