package com.controller;

import java.util.List;
import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model.User;
import com.model.Doctor;
import bdUtil.HibernateCF;

@Controller
public class RegistrationController {

	@RequestMapping("/register")
	public ModelAndView register(HttpServletRequest request, @RequestParam("image") MultipartFile image) {
		String username = request.getParameter("username");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String city = request.getParameter("city");
		String role = request.getParameter("role");

		Session hibernateSession = HibernateCF.getSessionFactory().openSession();
		hibernateSession.beginTransaction();

		User user = new User();
		user.setUsername(username);
		user.setFirst_name(first_name);
		user.setLast_name(last_name);
		user.setEmail(email);
		user.setAddress(address);
		user.setPassword(password);
		user.setCity(city);
		user.setRole(role);
		
		// Copy your image directory here
		String uploadPath = "C:\\Users\\Lenovo\\Documents\\Universiti Teknologi Malaysia\\Faculty of Computing\\SEMESTER 5 2022-2023\\Internet Programming\\Healthcare_Update 4.8\\Healthcare\\src\\main\\webapp\\WEB-INF\\image";
		File uploadDirectory = new File(uploadPath);
		if (!uploadDirectory.exists()) {
			uploadDirectory.mkdir();
		}

		String filePath = uploadPath + File.separator + image.getOriginalFilename();
		File file = new File(filePath);
		try {
			image.transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}

		user.setImagePath("/WEB-INF/image/" + image.getOriginalFilename());

		hibernateSession.save(user);
		hibernateSession.getTransaction().commit();
		hibernateSession.close();
		ModelAndView model = new ModelAndView("login");
		model.addObject("message", "Your registration was successful! Please log in to access the system");
		return model;
	}

	@RequestMapping("/addDoctor")
	public ModelAndView listUsersPage(HttpServletRequest request) throws Exception {

		Session hibernateSession = HibernateCF.getSessionFactory().openSession();

		@SuppressWarnings("unchecked")
		List<User> userList = hibernateSession.createQuery("from User where role = :role").setParameter("role", "user")
				.list();

		@SuppressWarnings("unchecked")
		List<User> doctorList = hibernateSession.createQuery("from User where role = :role")
				.setParameter("role", "doctor").list();
		ModelAndView model = new ModelAndView("addDoctor");
		model.addObject("userList", userList);
		model.addObject("doctorList", doctorList);
		return model;
	}

	@RequestMapping("/submitDoctor")
	public ModelAndView submitDoctor(HttpServletRequest request) {
		Session hibernateSession = HibernateCF.getSessionFactory().openSession();

		String userIdStr = request.getParameter("userId");
		int userId = Integer.parseInt(userIdStr);
		String doctorName = request.getParameter("doctorName");
		String location = request.getParameter("doctorLocation");
		String rateStr = request.getParameter("doctorRate");
		String role = request.getParameter("role");
		double rate = Double.parseDouble(rateStr);
		String specialty = request.getParameter("doctorType");

		hibernateSession.beginTransaction();
		try {
			Doctor doctor = new Doctor();
			doctor.setDoctorName(doctorName);
			doctor.setDoctorLocation(location);
			doctor.setDoctorRate(rate);
			doctor.setDoctorType(specialty);
			hibernateSession.save(doctor);

			User user = (User) hibernateSession.get(User.class, userId);
			user.setRole(role);
			hibernateSession.update(user);

			hibernateSession.getTransaction().commit();
		} catch (Exception e) {
			hibernateSession.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			hibernateSession.close();
		}
		ModelAndView model = new ModelAndView("redirect:addDoctor");
		return model;
	}

	@RequestMapping("/removeDoctor")
	public ModelAndView removeDoctor(HttpServletRequest request) {
		Session hibernateSession = HibernateCF.getSessionFactory().openSession();

		String userIdStr = request.getParameter("userId");
		String role = request.getParameter("role");
		int userId = Integer.parseInt(userIdStr);

		hibernateSession.beginTransaction();
		User user = (User) hibernateSession.get(User.class, userId);
		user.setRole(role);
		hibernateSession.update(user);
		hibernateSession.getTransaction().commit();
		hibernateSession.close();
		ModelAndView model = new ModelAndView("redirect:addDoctor");
		return model;
	}

	@ModelAttribute
	public void addAttributes(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
	}
}
