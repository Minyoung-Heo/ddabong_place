package com.ezen.dda.calendar;

public class CalendarDTO {
	int reservation_num;
	String customer_id, store_id, reservation_date, reservation_time;
	int person_num;
	
	public CalendarDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CalendarDTO(int reservation_num, String customer_id, String store_id, String reservation_date,
			String reservation_time, int person_num) {
		super();
		this.reservation_num = reservation_num;
		this.customer_id = customer_id;
		this.store_id = store_id;
		this.reservation_date = reservation_date;
		this.reservation_time = reservation_time;
		this.person_num = person_num;
	}


	public int getReservation_num() {
		return reservation_num;
	}


	public void setReservation_num(int reservation_num) {
		this.reservation_num = reservation_num;
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


	public String getReservation_date() {
		return reservation_date;
	}


	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}


	public String getReservation_time() {
		return reservation_time;
	}


	public void setReservation_time(String reservation_time) {
		this.reservation_time = reservation_time;
	}


	public int getPerson_num() {
		return person_num;
	}


	public void setPerson_num(int person_num) {
		this.person_num = person_num;
	}


}
