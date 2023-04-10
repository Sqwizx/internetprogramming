package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.Doctor;
import com.model.Payment;
import com.model.User;
import com.model.Booking;
import bdUtil.HibernateCF;

@Controller
public class BookingController {
	@RequestMapping("/consultationBooking")
	public ModelAndView bookingPage(HttpServletRequest request) throws Exception {

		Session hibernateSession = HibernateCF.getSessionFactory().openSession();

		@SuppressWarnings("unchecked")
		List<Booking> doctorList = hibernateSession.createQuery("from Doctor").list();
		ModelAndView model = new ModelAndView("consultationBooking");
		model.addObject("doctorList", doctorList);
		return model;
	}

	@RequestMapping("/bookingSummary")
	public ModelAndView bookingSummary(@RequestParam("doctorId") int doctorId, HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView("bookingSummary");

		// Save the selected doctor to the session
		session.setAttribute("selectedDoctorId", doctorId);
		

		Session hibernateSession = HibernateCF.getSessionFactory().openSession();
		hibernateSession.beginTransaction();

		Doctor doctor = hibernateSession.get(Doctor.class, doctorId);

		hibernateSession.getTransaction().commit();
		hibernateSession.close();

		model.addObject("doctor", doctor);

		double rateTax = doctor.getDoctorRate() * 0.1;
		model.addObject("rateTax", rateTax);

		double totalRate = rateTax + doctor.getDoctorRate();
		model.addObject("totalRate", totalRate);

		return model;
	}

	@RequestMapping("/bookingPayment")
	public ModelAndView bookingPayment(@RequestParam("datevisit") String datevisit, @RequestParam("time") String time,
			HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView("bookingPayment");
		session.setAttribute("selectedDate", datevisit);
		session.setAttribute("selectedTime", time);

		int doctorId = (int) session.getAttribute("selectedDoctorId");
		User user = (User) session.getAttribute("user");

		Session hibernateSession = HibernateCF.getSessionFactory().openSession();
		hibernateSession.beginTransaction();

		Doctor doctor = (Doctor) hibernateSession.createQuery("from Doctor where id = :id").setParameter("id", doctorId)
				.uniqueResult();
		double doctorRate = doctor.getDoctorRate();
		double rateTax = doctor.getDoctorRate() * 0.1;
		double total = rateTax + doctor.getDoctorRate();
		session.setAttribute("total", total);

		Booking booking = new Booking();
		booking.setUser(user);
		booking.setDoctor(doctor);
		booking.setDate(datevisit);
		booking.setTime(time);
		hibernateSession.save(booking);
		hibernateSession.getTransaction().commit();
		
		int bookingId = booking.getId();
		session.setAttribute("bookingId", bookingId);
		
		hibernateSession.close();

		
		
		model.addObject("rateTax", rateTax);
		model.addObject("doctorRate", doctorRate);
		model.addObject("date", datevisit);
		model.addObject("time", time);
		model.addObject("total", total);

		return model;
	}

	@RequestMapping("/completeBooking")
	public ModelAndView completeBooking(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView model = new ModelAndView("completeBooking");

		int id = (int) session.getAttribute("bookingId");
		User user = (User) session.getAttribute("user");
		String dateVisit = (String) session.getAttribute("selectedDate");
		String time = (String) session.getAttribute("selectedTime");
		int doctorId = (int) session.getAttribute("selectedDoctorId");
		double total = (double) session.getAttribute("total");

		Session hibernateSession = HibernateCF.getSessionFactory().openSession();
		hibernateSession.beginTransaction();

		Booking booking = (Booking) hibernateSession
				.createQuery("from Booking where user = :user and date = :dateVisit and time = :time and id = :id")
				.setParameter("user", user).setParameter("dateVisit", dateVisit).setParameter("time", time). setParameter("id", id)
				.uniqueResult();

		Doctor doctor = (Doctor) hibernateSession.createQuery("from Doctor where id = :id").setParameter("id", doctorId)
				.uniqueResult();

		String doctorName = doctor.getDoctorName();

		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String payType = request.getParameter("payType");
		String ccName = request.getParameter("ccName");
		String ccNo = request.getParameter("ccNo");
		String ccExp = request.getParameter("ccExp");
		String ccCVV = request.getParameter("ccCVV");

		Payment payment = new Payment();
		payment.setFullname(fullName);
		payment.setEmail(email);
		payment.setAddress(address);
		payment.setPayType(payType);
		payment.setCcName(ccName);
		payment.setCcExp(ccExp);
		payment.setCcCVV(ccCVV);
		payment.setCcNo(ccNo);
		payment.setUser(user);
		payment.setBooking(booking);
		payment.setTotal(total);
		hibernateSession.save(payment);
		hibernateSession.getTransaction().commit();
		hibernateSession.close();

		model.addObject("email", email);
		model.addObject("fullName", fullName);
		model.addObject("date", dateVisit);
		model.addObject("time", time);
		model.addObject("doctorName", doctorName);
		model.addObject("total", total);

		return model;
	}
	
	
	@ModelAttribute
	public void addAttributes(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
	}
}
