package org.asu.ss.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.asu.ss.model.BackendResponse;
import org.asu.ss.model.OTPDetails;
import org.asu.ss.model.TempExternalUser;
import org.asu.ss.model.Transaction;
import org.asu.ss.service.ExtService;
import org.asu.ss.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UIController {
	//Mayank++
	@Autowired
	private TransactionService transactionService;
	@Autowired
	private ExtService extService;

	@RequestMapping(value = "Customer/transfercash")
	public String transfercustomer(HttpServletRequest request) {
		System.out.println("tcash");
		HttpSession session = request.getSession(false);
		if (request.isRequestedSessionIdValid()) {
			String trans = (String)session.getAttribute("tranSuccess");
			if(trans!= null && trans.equals("Success")){
				session.setAttribute("tranSuccess", "done");
				return "redirect:/Customer/checkOTP";
			}
			else
				return "Customer/transfercash";
		} else {
			return "redirect:/";
		}
	}
	//Mayank--

	@RequestMapping(value = "Customer/balanceinfo")
	public String transferAccounts(HttpServletRequest request) {
		boolean value = request.isRequestedSessionIdValid();
		if(value)
		return "Customer/balanceinfo";
		else
		return "redirect:/";
	}
	@RequestMapping(value = "Customer/creditcard")
	public String transferCreditCard(HttpServletRequest request) {
		boolean value = request.isRequestedSessionIdValid();
		if(value)
			return "Customer/creditcard";
		else
		return "redirect:/";	 
	}
	@RequestMapping(value = "Customer/editprofile")
	public String transferEditProfile(HttpServletRequest request) {
		boolean value = request.isRequestedSessionIdValid();
		if(value)
			return "Customer/editprofile";
		else
		return "redirect:/";	 
	}
	@RequestMapping(value = "accounts")
	public String transferAccount(Model model, HttpServletRequest request) {
		System.out.println("UIController.transferAccount()");
		boolean value = request.isRequestedSessionIdValid();
		//model.addAttribute("acc_no1", )
		if(value)
			return "Customer/accounts";
		else
		return "redirect:/";	 
	}		
	@RequestMapping(value = "Customer/request")
	public String transferRequest(HttpServletRequest request, Model model) {
		boolean value = request.isRequestedSessionIdValid();
		if (value) {
			model.addAttribute("OTPDetails", new OTPDetails());
			return "Customer/request";
		} else
			return "redirect:/";
	}
	@RequestMapping(value = "Customer/notification")
	public String transferNotification(HttpServletRequest request) {
		boolean value = request.isRequestedSessionIdValid();
		if(value)
			return "Customer/notification";
		else
		return "redirect:/";	 
	}
	@RequestMapping(value = "Customer/viewprofile")
	public String transferViewProfile(HttpServletRequest request) {
		System.out.println("UIController.transferViewProfile()");
		boolean value = request.isRequestedSessionIdValid();
		if(value)
			return "Customer/viewprofile";
		else
		return "redirect:/";	 
	}
	@RequestMapping(value = "Customer/accounts")
	public String transferAccount2(HttpServletRequest request) {
		System.out.println("UIController.transferAccount2()");
		boolean value = request.isRequestedSessionIdValid();
		if(value)
			return "Customer/accounts";
		else
		return "redirect:/";	 
	}
	
	//Mayank++
	@RequestMapping(value = "Customer/checkOTP")
	public String transferOTP(@ModelAttribute("OTPDetails") OTPDetails otpDetails, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		boolean value = request.isRequestedSessionIdValid();
		if (value) {
			if(!(otpDetails.getEmailId().length()==0))
				session.setAttribute("emailId", otpDetails.getEmailId());
			if(!(otpDetails.getStatus().length()==0))
				session.setAttribute("status", otpDetails.getStatus());
			model.addAttribute("transferOtp", new Transaction());
				return "Customer/otp";
		} else
			return "redirect:/";
	}

	@RequestMapping(value = "Customer/serviceOTP")
	public String serviceOTP(@ModelAttribute("OTPDetails") OTPDetails otpDetails, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		boolean value = request.isRequestedSessionIdValid();
		if (value) {
			if(!(otpDetails.getEmailId().length()==0))
				session.setAttribute("emailId", otpDetails.getEmailId());
			if(!(otpDetails.getStatus().length()==0))
				session.setAttribute("status", otpDetails.getStatus());
			model.addAttribute("transferOtp", new Transaction());
				if(otpDetails.getStatus().equals("Approve")){
					TempExternalUser retUser= extService.findTupleById((long)session.getAttribute("custId"));
					session.setAttribute("Otp_Id", retUser.getId());
					session.setAttribute("item", retUser.getItem());
					session.setAttribute("carrier", retUser.getMobile_carrier());
					return "Customer/otpservice";
					}
				else
					return "redirect:/profile/declineupdate";
		} else
			return "redirect:/";
	}
	// To update the profile(otp verification)(Email and Phone numbers)//Add approve request by external customer (Completed)
		@RequestMapping(value = {"Customer/profile/approveupdate"}, method = RequestMethod.POST)
		public String validateOTP(@ModelAttribute ("transferOtp") TempExternalUser tempexternaluser,HttpServletRequest request, Model model) {
			HttpSession session = request.getSession(false);
			tempexternaluser.setId((long)session.getAttribute("Otp_Id"));
			tempexternaluser.setCust_id((long)session.getAttribute("custId"));
			tempexternaluser.setItem((String)session.getAttribute("item"));
			tempexternaluser.setMobile_carrier((String)session.getAttribute("carrier"));
			String response;
			response = extService.validateOTP(tempexternaluser, tempexternaluser.getOtp_value());
			if (response.equals("Validaton Successful")) {
				return "redirect:/Customer/accounts";
			} else if (response.equals("Wrong OTP entered")) {
				return "redirect:/Customer/serviceOTP";
			} else {
				return "redirect:/Customer/serviceOTP";
			}
		}
	
	@RequestMapping(value="Customer/transfer/otp", method=RequestMethod.POST)
	public String otpTransfer(@ModelAttribute ("transferOtp") Transaction transaction, HttpServletRequest request)
	{	HttpSession session = request.getSession(false);
		BackendResponse backendResponse = new BackendResponse();
		transaction.setOtp_id((long)session.getAttribute("Otp_Id"));
		transaction.setT_id((long)session.getAttribute("TransID"));
		transaction.setT_custid((long)session.getAttribute("custId"));
		transaction.setT_amount((double)session.getAttribute("T_amt"));
		try
		{
			backendResponse = transactionService.handleOTPTransfer(transaction);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return "redirect:/Customer/accounts";
	}
	//Mayank--
}
