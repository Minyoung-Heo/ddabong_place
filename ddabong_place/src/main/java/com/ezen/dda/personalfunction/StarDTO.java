package com.ezen.dda.personalfunction;

public class StarDTO {
	String customer_id, store_id, storename;

	public StarDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StarDTO(String customer_id, String store_id, String storename) {
		super();
		this.customer_id = customer_id;
		this.store_id = store_id;
		this.storename = storename;
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

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}
	
}
