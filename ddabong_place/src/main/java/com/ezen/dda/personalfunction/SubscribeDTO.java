package com.ezen.dda.personalfunction;

public class SubscribeDTO {

	String customer_id,store_id;

	public SubscribeDTO() {
	}

	public SubscribeDTO(String customer_id, String store_id) {
		super();
		this.customer_id = customer_id;
		this.store_id = store_id;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	
	
	
}
