package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class BmiController {
	
	@RequestMapping(value = "/bmiCalculator", method = RequestMethod.GET)
	public String checkStressLevel(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		return "bmiCalculator";
	}

	@RequestMapping(value = "/bmiResult", method = RequestMethod.POST)
	public ModelAndView calculateBMI(HttpServletRequest request, HttpServletResponse response, double height,
			double weight, int age, String name) throws ServletException, IOException {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			modelAndView.setViewName("redirect:/");
		}

		height = height / 100.0;
		double bmi = weight / (height * height);
		String description = "";
//	    User user = (User) request.getAttribute("user");
//	    int userId = user.getId();

//        user=(User) request.getAttribute("user");
		if (age <= 20) {
			if (age >= 2 && age <= 3) {
				if (bmi <= 14.5)
					description = "Underweight";
				else if (bmi > 14.5 && bmi < 17.5)
					description = "Healthy weight";
				else if (bmi >= 17.5 && bmi < 18.5)
					description = "At risk of overweight";
				else if (bmi >= 18.5)
					description = "Overweight";
			} else if (age >= 4 && age <= 5) {
				if (bmi <= 14)
					description = "Underweight";
				else if (bmi > 14 && bmi <= 16.75)
					description = "Healthy weight";
				else if (bmi > 16.75 && bmi <= 17.75)
					description = "At risk of overweight";
				else if (bmi > 17.75)
					description = "Overweight";
			} else if (age >= 6 && age <= 7) {
				if (bmi <= 13.75)
					description = "Underweight";
				else if (bmi > 13.75 && bmi <= 17)
					description = "Healthy weight";
				else if (bmi > 17 && bmi <= 18.75)
					description = "At risk of overweight";
				else if (bmi > 18.75)
					description = "Overweight";
			} else if (age >= 8 && age <= 9) {
				if (bmi <= 13.75)
					description = "Underweight";
				else if (bmi > 13.75 && bmi <= 18.25)
					description = "Healthy weight";
				else if (bmi > 18.25 && bmi <= 20.5)
					description = "At risk of overweight";
				else if (bmi > 20.5)
					description = "Overweight";
			} else if (age >= 10 && age <= 11) {
				if (bmi <= 14.25)
					description = "Underweight";
				else if (bmi > 14.25 && bmi <= 19.75)
					description = "Healthy weight";
				else if (bmi > 19.75 && bmi <= 22.5)
					description = "At risk of overweight";
				else if (bmi > 22.5)
					description = "Overweight";
			} else if (age >= 12 && age <= 13) {
				if (bmi <= 15.25)
					description = "Underweight";
				else if (bmi > 15.25 && bmi <= 21.5)
					description = "Healthy weight";
				else if (bmi > 21.5 && bmi <= 24.5)
					description = "At risk of overweight";
				else if (bmi > 24.5)
					description = "Overweight";
			} else if (age >= 14 && age <= 15) {
				if (bmi <= 16.25)
					description = "Underweight";
				else if (bmi > 16.25 && bmi <= 23)
					description = "Healthy weight";
				else if (bmi > 23 && bmi <= 26.5)
					description = "At risk of overweight";
				else if (bmi > 26.5)
					description = "Overweight";
			} else if (age >= 16 && age <= 17) {
				if (bmi <= 17.25)
					description = "Underweight";
				else if (bmi > 17.25 && bmi <= 24.5)
					description = "Healthy weight";
				else if (bmi > 24.5 && bmi <= 28)
					description = "At risk of overweight";
				else if (bmi > 28)
					description = "Overweight";
			} else if (age >= 18 && age <= 19) {
				if (bmi <= 18.5)
					description = "Underweight";
				else if (bmi > 18.5 && bmi <= 26)
					description = "Healthy weight";
				else if (bmi > 26 && bmi <= 29.25)
					description = "At risk of overweight";
				else if (bmi > 29.25)
					description = "Overweight";
			} else if (age == 20) {
				if (bmi <= 19)
					description = "Overweight";
				else if (bmi > 19 && bmi <= 26.5)
					description = "Healthy weight";
				else if (bmi > 26.5 && bmi <= 30.5)
					description = "At risk of overweight";
				else if (bmi > 30.5)
					description = "Overweight";
			}
		} else if (age > 20) {
			if (bmi < 16)
				description = "Severe Thinness";
			else if (bmi >= 16 && bmi <= 17)
				description = "Moderate Thinness";
			else if (bmi > 17 && bmi <= 18.5)
				description = "Mild Thinness";
			else if (bmi > 18.5 && bmi < 25)
				description = "Normal";
			else if (bmi >= 25 && bmi < 30)
				description = "Overweight";
			else if (bmi >= 30)
				description = "Obese";
		}

		modelAndView.setViewName("bmi_result");
		modelAndView.addObject("bmi", bmi);
		modelAndView.addObject("description", description);
		modelAndView.addObject("age", age);
//	    modelAndView.addObject("user",user);
		Connection conn = null;
		conn = DbConnect.openConnection();
		PreparedStatement statement = null;
		try {
			User user = (User) session.getAttribute("user");
			statement = conn.prepareStatement(
					"insert into bmi_data (name,weight,height,bmi,age,description,user_id) VALUES (?, ?, ?, ?, ?,?,?)");
			statement.setString(1, name);
			statement.setDouble(2, weight);
			statement.setDouble(3, height);
			statement.setDouble(4, bmi);
			statement.setInt(5, age);
			statement.setString(6, description);
			statement.setInt(7, user.getId());

			statement.executeUpdate();
			// insert into bmi_data (name,weight,height,bmi,age,description,user_id) values
			// ("save 1",60,170,20.76,20,"Healthy weight",1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return modelAndView;
//	    return new ModelAndView(new RedirectView("/another/resource"));
	}

	@ModelAttribute
	public void addAttributes(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
	}

}
