package com.ezen.dda.personalfunction;

public class ReservationDTO {
String store_img, storename,reservation_date,reservation_time;
int person_num;
String reservation_num;
String store_id, tel, address;
String image;
String RESERVATION_NAME;


public String getImage() {
	return image;
}

public void setImage(String image) {
	this.image = image;
}

public String getRESERVATION_NAME() {
	return RESERVATION_NAME;
}

public void setRESERVATION_NAME(String rESERVATION_NAME) {
	RESERVATION_NAME = rESERVATION_NAME;
}

public ReservationDTO() {
}

public ReservationDTO(String store_img, String store_name, String reservation_date, String reservation_time,
		int person_num, String reservation_num, String reservation_name, String store_tel, String store_addr) {
	super();
	this.store_img = store_img;
	this.storename = storename;
	this.reservation_date = reservation_date;
	this.reservation_time = reservation_time;
	this.person_num = person_num;
	this.reservation_num = reservation_num;
	this.reservation_name = reservation_name;
	this.store_tel = store_tel;
	this.store_addr = store_addr;
}

public String getStore_img() {
	return store_img;
}

public void setStore_img(String store_img) {
	this.store_img = store_img;
}

public String getStore_name() {
	return store_name;
}

public void setStore_name(String store_name) {
	this.store_name = store_name;
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

public String getReservation_num() {
	return reservation_num;
}

public void setReservation_num(String reservation_num) {
	this.reservation_num = reservation_num;
}

public String getReservation_name() {
	return reservation_name;
}

public void setReservation_name(String reservation_name) {
	this.reservation_name = reservation_name;
}

public String getStore_tel() {
	return store_tel;
}

public void setStore_tel(String store_tel) {
	this.store_tel = store_tel;
}

public String getStore_addr() {
	return store_addr;
}

public void setStore_addr(String store_addr) {
	this.store_addr = store_addr;
}



}
