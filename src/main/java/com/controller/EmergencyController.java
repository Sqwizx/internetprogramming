package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmergencyController {
	@RequestMapping("/emergencyResponse")
	protected ModelAndView getPage(HttpServletRequest request) throws Exception {

		ModelAndView model = new ModelAndView("emergencyResponse");

		return model;
	}

}
