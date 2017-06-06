package org.asu.ss.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class employeeController {

	final static Logger log = Logger.getLogger(AccountController.class);
	
	@RequestMapping(value = "Employee/editprofile")
	public String testLink4(HttpServletRequest request) {
		log.info("Entering employeeController.testLink4 ");
		boolean value = request.isRequestedSessionIdValid();
		if(value){
			log.info("Exit employeeController.testLink4 if");
		return "Employee/editprofile";
		}
		else{
			log.info("Exit employeeController.testLink4 else");
		return "redirect:/";
		}
	}
	@RequestMapping(value = "Employee/register")
	public String testLink5(HttpServletRequest request) {
		log.info("Entering employeeController.testLink5 ");
		boolean value = request.isRequestedSessionIdValid();
		if(value){
			log.info("Exiting employeeController.testLink5 if");
		return "Employee/register";}
		else{
			log.info("Exiting employeeController.testLink5 else");
		return "redirect:/";}
	}
	@RequestMapping(value = "Employee/transfercash")
	public String testLink6(HttpServletRequest request) {
		log.info("Entering employeeController.testLink6 ");
		boolean value = request.isRequestedSessionIdValid();
		if(value){
			log.info("Exiting employeeController.testLink6 if");
		return "Employee/transfercash";}
		else{
			log.info("Exiting employeeController.testLink6 else");
		return "redirect:/";}
	}

	@RequestMapping(value = "Employee/deleteprofile")
	public String testLink7(HttpServletRequest request) {
		log.info("Entering employeeController.testLink7 ");
		boolean value = request.isRequestedSessionIdValid();
		if(value){
			log.info("Exiting employeeController.testLink7 if");
		return "Employee/deleteprofile";}
		else{
			log.info("Exiting employeeController.testLink7 else");
		return "redirect:/";}
	}
	
	@RequestMapping(value = "Employee/request")
	public String testLink8(HttpServletRequest request) {
		boolean value = request.isRequestedSessionIdValid();
		if(value)
		return "Employee/request";
		else
		return "redirect:/";
	}
}
