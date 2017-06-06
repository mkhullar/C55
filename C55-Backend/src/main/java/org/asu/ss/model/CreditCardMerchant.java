package org.asu.ss.model;

import javax.persistence.Entity;

@Entity
public class CreditCardMerchant {
	private String merchant_name;

	public String getMerchant_name() {
		return merchant_name;
	}

	public void setMerchant_name(String merchant_name) {
		this.merchant_name = merchant_name;
	}

	@Override
	public String toString() {
		return "CreditCardMerchant [merchant_name=" + merchant_name + "]";
	}

	public CreditCardMerchant(String merchant_name) {
		super();
		this.merchant_name = merchant_name;
	}

	public CreditCardMerchant() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
