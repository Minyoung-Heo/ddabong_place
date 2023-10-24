package com.ezen.dda.cafe;

public class CafeDTO {
	String store_id, storename, tel, address, intro, image, main_menu, main_image, lineintro,
	region_name, feature, dessert;
	String star_score, review_count;
	String waiting_num;
	
	public String getWaiting_num() {
		return waiting_num;
	}

	public void setWaiting_num(String waiting_num) {
		this.waiting_num = waiting_num;
	}

	public String getStar_score() {
		return star_score;
	}

	public void setStar_score(String star_score) {
		this.star_score = star_score;
	}

	public String getReview_count() {
		return review_count;
	}

	public void setReview_count(String review_count) {
		this.review_count = review_count;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getMain_menu() {
		return main_menu;
	}

	public void setMain_menu(String main_menu) {
		this.main_menu = main_menu;
	}

	public String getMain_image() {
		return main_image;
	}

	public void setMain_image(String main_image) {
		this.main_image = main_image;
	}

	public String getLineintro() {
		return lineintro;
	}

	public void setLineintro(String lineintro) {
		this.lineintro = lineintro;
	}

	public String getRegion_name() {
		return region_name;
	}

	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public String getDessert() {
		return dessert;
	}

	public void setDessert(String dessert) {
		this.dessert = dessert;
	}

	public CafeDTO() {
		super();
	}
}
