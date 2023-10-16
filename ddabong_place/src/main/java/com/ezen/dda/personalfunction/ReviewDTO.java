package com.ezen.dda.personalfunction;

public class ReviewDTO {

	String id,pw,name,nickname,phone,address,email;
	int reservation_num;
	String customer_id,store_id,reservation_date,reservation_time;
	int person_num,review_num;
	String content,image,star,review_date;
	
	public ReviewDTO() {
		super();
	}

	public ReviewDTO(String id, String pw, String name, String nickname, String phone, String address, String email,
			int reservation_num, String customer_id, String store_id, String reservation_date, String reservation_time,
			int person_num, int review_num, String content, String image, String star, String review_date) {
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
		this.person_num = person_num;
		this.review_num = review_num;
		this.content = content;
		this.image = image;
		this.star = star;
		this.review_date = review_date;
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

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	
	
}
