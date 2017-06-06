package org.asu.ss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

	@Controller
	public class ManagerController {

		@RequestMapping(value = "Manager/editprofile")
		public String testLink4() {

			System.out.println("In testLink3");
			return "Manager/editprofile";
		}
		@RequestMapping(value = "Manager/register")
		public String testLink5() {

			System.out.println("In testLink3");
			return "Manager/register";
		}
		@RequestMapping(value = "Manager/transfercash")
		public String testLink6() {
			System.out.println("In testLink3");
			return "Manager/transfercash";
		}

		@RequestMapping(value = "Manager/deleteprofile")
		public String testLink7() {
			System.out.println("In testLink3");
			return "Manager/deleteprofile";
		}
		@RequestMapping(value = "Manager/request")
		public String testLink8() {
			System.out.println("In testLink3");
			return "Manager/request";
		}
	}
