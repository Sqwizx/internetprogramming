package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
public class StressController {

	@RequestMapping(value = "/stressChecker", method = RequestMethod.GET)
	public String checkStressLevel(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		return "stressChecker";
	}

	@RequestMapping(value = "/stressResult", method = RequestMethod.POST)
	public ModelAndView calculateStressLevel(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("stressResult");
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			model.setViewName("redirect:/");
		}
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String[] healthConditions = request.getParameterValues("health");

		int stressLevel = 0;
		StringBuilder stressLevelAnalysis = new StringBuilder();
		stressLevelAnalysis.append("<<-- Stress level calculation -->></br>");
		// stressLevelAnalysis.append("Gender: ").append(gender).append("</br>");
		// stressLevelAnalysis.append("Age: ").append(age).append("</br>");

		if (healthConditions != null) {
			for (int i = 0; i < healthConditions.length; i++) {
				stressLevelAnalysis.append("Health condition: ").append(healthConditions[i]).append("</br>");
				if (healthConditions[i].equals("Asthma")) {
					stressLevel += 8;
					stressLevelAnalysis.append("> Adding 8 to stress level (Asthma)</br></br>");
				} else if (healthConditions[i].equals("Diabetes")) {
					stressLevel += 12;
					stressLevelAnalysis.append("> Adding 12 to stress level (Diabetes)</br></br>");
				} else if (healthConditions[i].equals("Heart Disease")) {
					stressLevel += 18;
					stressLevelAnalysis.append("> Adding 18 to stress level (Heart Disease)</br></br>");
				} else if (healthConditions[i].equals("Obesity")) {
					stressLevel += 4;
					stressLevelAnalysis.append("> Adding 4 to stress level (Obesity)</br></br>");
				}
			}
		}

		String upsetFrequency1 = request.getParameter("q1");
		stressLevelAnalysis.append("[Q1] Upset frequency: ").append(upsetFrequency1).append("</br>");
		if (upsetFrequency1.equals("Never")) {
			stressLevel += 0;
			stressLevelAnalysis.append("> Adding 0 to stress level (Never)</br></br>");
		} else if (upsetFrequency1.equals("Seldom")) {
			stressLevel += 2;
			stressLevelAnalysis.append("> Adding 2 to stress level (Seldom)</br></br>");
		} else if (upsetFrequency1.equals("Sometime")) {
			stressLevel += 7;
			stressLevelAnalysis.append("> Adding 7 to stress level (Sometime)</br></br>");
		} else if (upsetFrequency1.equals("Often")) {
			stressLevel += 15;
			stressLevelAnalysis.append("> Adding 15 to stress level (Often)</br></br>");
		}

		String upsetFrequency2 = request.getParameter("q2");
		stressLevelAnalysis.append("[Q2]Upset frequency: ").append(upsetFrequency2).append("</br>");
		if (upsetFrequency2.equals("Never")) {
			stressLevel += 0;
			stressLevelAnalysis.append("> Adding 0 to stress level (Never)</br></br>");
		} else if (upsetFrequency2.equals("Seldom")) {
			stressLevel += 1;
			stressLevelAnalysis.append("> Adding 1 to stress level (Seldom)</br></br>");
		} else if (upsetFrequency2.equals("Sometime")) {
			stressLevel += 3;
			stressLevelAnalysis.append("> Adding 3 to stress level (Sometime)</br></br>");
		} else if (upsetFrequency2.equals("Often")) {
			stressLevel += 7;
			stressLevelAnalysis.append("> Adding 7 to stress level (Often)</br></br>");
		}

		String upsetFrequency3 = request.getParameter("q3");
		stressLevelAnalysis.append("[Q3]Upset frequency: ").append(upsetFrequency3).append("</br>");
		if (upsetFrequency3.equals("Never")) {
			stressLevel += 0;
			stressLevelAnalysis.append("> Adding 0 to stress level (Never)</br></br>");
		} else if (upsetFrequency3.equals("Seldom")) {
			stressLevel += 3;
			stressLevelAnalysis.append("> Adding 3 to stress level (Seldom)</br></br>");
		} else if (upsetFrequency3.equals("Sometime")) {
			stressLevel += 8;
			stressLevelAnalysis.append("> Adding 8 to stress level (Sometime)</br></br>");
		} else if (upsetFrequency3.equals("Often")) {
			stressLevel += 12;
			stressLevelAnalysis.append("> Adding 12 to stress level (Often)</br></br>");
		}

		String upsetFrequency4 = request.getParameter("q4");
		stressLevelAnalysis.append("[Q4]Upset frequency: ").append(upsetFrequency4).append("</br>");
		if (upsetFrequency4.equals("Never")) {
			stressLevel += 4;
			stressLevelAnalysis.append("> Adding 4 to stress level (Never)</br></br>");
		} else if (upsetFrequency4.equals("Seldom")) {
			stressLevel += 1;
			stressLevelAnalysis.append("> Adding 1 to stress level (Seldom)</br></br>");
		} else if (upsetFrequency4.equals("Sometime")) {
			stressLevel -= 5;
			stressLevelAnalysis.append("> Subtracting 5 to stress level (Sometime)</br></br>");
		} else if (upsetFrequency4.equals("Often")) {
			stressLevel -= 13;
			stressLevelAnalysis.append("> Subtracting 13 to stress level (Often)</br></br>");
		}

		String upsetFrequency5 = request.getParameter("q5");
		stressLevelAnalysis.append("[Q5]Upset frequency: ").append(upsetFrequency5).append("</br>");
		if (upsetFrequency5.equals("Never")) {
			stressLevel += 2;
			stressLevelAnalysis.append("> Adding 2 to stress level (Never)</br></br>");
		} else if (upsetFrequency5.equals("Seldom")) {
			stressLevel += 1;
			stressLevelAnalysis.append("> Adding 1 to stress level (Seldom)</br></br>");
		} else if (upsetFrequency5.equals("Sometimes")) {
			stressLevel -= 3;
			stressLevelAnalysis.append("> Subtracting 3 to stress level (Sometime)</br></br>");
		} else if (upsetFrequency5.equals("Often")) {
			stressLevel -= 8;
			stressLevelAnalysis.append("> Subtracting 8 to stress level (Often)</br></br>");
		}

		String upsetFrequency6 = request.getParameter("q6");
		stressLevelAnalysis.append("[Q6]Upset frequency: ").append(upsetFrequency6).append("</br>");
		if (upsetFrequency6.equals("Never")) {
			stressLevel += 10;
			stressLevelAnalysis.append("> Adding 10 to stress level (Never)</br></br>");
		} else if (upsetFrequency6.equals("Seldom")) {
			stressLevel += 5;
			stressLevelAnalysis.append("> Adding 5 to stress level (Seldom)</br></br>");
		} else if (upsetFrequency6.equals("Sometime")) {
			stressLevel -= 2;
			stressLevelAnalysis.append("> Subtracting 2 to stress level (Sometime)</br></br>");
		} else if (upsetFrequency6.equals("Often")) {
			stressLevel -= 9;
			stressLevelAnalysis.append("> Subtracting 9 to stress level (Often)</br></br>");
		}

		String upsetFrequency7 = request.getParameter("q7");
		stressLevelAnalysis.append("[Q7]Upset frequency: ").append(upsetFrequency7).append("</br>");
		if (upsetFrequency7.equals("Never")) {
			stressLevel -= 3;
			stressLevelAnalysis.append("> Subtracting 3 to stress level (Never)</br></br>");
		} else if (upsetFrequency7.equals("Seldom")) {
			stressLevel += 10;
			stressLevelAnalysis.append("> Adding 10 to stress level (Seldom)</br></br>");
		} else if (upsetFrequency7.equals("Sometime")) {
			stressLevel += 19;
			stressLevelAnalysis.append("> Adding 19 to stress level (Sometime)</br></br>");
		} else if (upsetFrequency7.equals("Often")) {
			stressLevel += 25;
			stressLevelAnalysis.append("> Subtracting 25 to stress level (Often)</br></br>");
		}

		String upsetFrequency8 = request.getParameter("q8");
		stressLevelAnalysis.append("[Q8]Upset frequency: ").append(upsetFrequency8).append("</br>");

		if (upsetFrequency8.equals("Never")) {
			stressLevel -= 4;
			stressLevelAnalysis.append("> Subtracting 4 to stress level (Never)</br></br>");
		} else if (upsetFrequency8.equals("Seldom")) {
			stressLevel += 1;
			stressLevelAnalysis.append("> Adding 1 to stress level (Seldom)</br></br>");
		} else if (upsetFrequency8.equals("Sometime")) {
			stressLevel += 6;
			stressLevelAnalysis.append("> Adding 6 to stress level (Sometime)</br></br>");
		} else if (upsetFrequency8.equals("Often")) {
			stressLevel += 18;
			stressLevelAnalysis.append("> Adding 18 to stress level (Often)</br></br>");
		}

		String stressLevelResult;
		if (stressLevel < 30) {
			stressLevelResult = "Low";
		} else if (stressLevel >= 30 && stressLevel < 60) {
			stressLevelResult = "Medium";
		} else {
			stressLevelResult = "High";
		}

		String conditionList = "";
		if (healthConditions != null) {
			for (int i = 0; i < healthConditions.length; i++) {
				if (i != 0)
					conditionList += ", " + healthConditions[i];
				else
					conditionList = healthConditions[i];
			}
		}

		try {
			User user = (User) session.getAttribute("user");
			Connection conn = DbConnect.openConnection();
			String sql = "INSERT INTO stress (gender, age, healthConditions, stressLevel,stressLevelResult, userID) VALUES (?,?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, gender);
			stmt.setString(2, age);
			stmt.setString(3, conditionList);
			stmt.setInt(4, stressLevel);
			stmt.setString(5, stressLevelResult);
			stmt.setInt(6, user.getId()); //Changed
			stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		model.addObject("age", age);
		model.addObject("gender", gender);
		model.addObject("stressLevel", stressLevel);
		model.addObject("stressLevelResult", stressLevelResult);
		model.addObject("stressLevelAnalysis", stressLevelAnalysis).toString();
		return model;
	}

	@ModelAttribute
	public void addAttributes(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
	}
}
