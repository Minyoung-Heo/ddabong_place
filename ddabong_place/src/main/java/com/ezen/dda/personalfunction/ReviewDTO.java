package com.ezen.dda.personalfunction;

import java.util.List;

public class ReviewDTO {

	String id,pw,name,nickname,phone,address,email;
	int reservation_num;
	String customer_id,store_id,reservation_date,reservation_time,reservation_name;
	int person_num,review_num;
	String content,image,review_date;List<String> imageList;
	double star;
	
	public ReviewDTO() {
		super();
	}

	public ReviewDTO(String id, String pw, String name, String nickname, String phone, String address, String email,
			int reservation_num, String customer_id, String store_id, String reservation_date, String reservation_time,
			String reservation_name, int person_num, int review_num, String content, String image, String review_date,
			List<String> imageList, double star) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.reservation_num = reservation_num;
		this.customer_id = customer_id;
		this.store_id = store_id;
		this.reservation_date = reservation_date;
		this.reservation_time = reservation_time;
		this.reservation_name = reservation_name;
		this.person_num = person_num;
		this.review_num = review_num;
		this.content = content;
		this.image = image;
		this.review_date = review_date;
		this.imageList = imageList;
		this.star = star;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getReservation_name() {
		return reservation_name;
	}

	public void setReservation_name(String reservation_name) {
		this.reservation_name = reservation_name;
	}

	public int getPerson_num() {
		return person_num;
	}

	public void setPerson_num(int person_num) {
		this.person_num = person_num;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	public List<String> getImageList() {
		return imageList;
	}

	public void setImageList(List<String> imageList) {
		this.imageList = imageList;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	
}
