package com.ezen.dda.waiting;

public class WaitingDTO {
	String store_id; // 가게 아이디
	int waiting_num; // 대기번호
	String customer_id; // 손님 아이디
	String name; // 이름
	String phone; // 전화번호
	int person_num; // 인원 수
	String storename, lineintro, image; // 웨이팅 현황 보러가기에서 가게 출력용
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public int getWaiting_num() {
		return waiting_num;
	}
	public void setWaiting_num(int waiting_num) {
		this.waiting_num = waiting_num;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPerson_num() {
		return person_num;
	}
	public void setPerson_num(int person_num) {
		this.person_num = person_num;
	}
	public WaitingDTO() {
		super();
	}
	public WaitingDTO(String store_id, String customer_id, String name, String phone, int person_num) {
		super();
		this.store_id = store_id;
		this.customer_id = customer_id;
		this.name = name;
		this.phone = phone;
		this.person_num = person_num;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public String getLineintro() {
		return lineintro;
	}
	public void setLineintro(String lineintro) {
		this.lineintro = lineintro;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}