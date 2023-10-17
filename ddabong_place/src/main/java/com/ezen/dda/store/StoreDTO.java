package com.ezen.dda.store;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class StoreDTO {
	String store_id, storename, tel, address, lineintro, intro, id,pw,ceo,phone,email;
	String image;
	String main_menu;
	String main_image;
	String region_name, feature, dessert;
	
	public StoreDTO() {
		super();
	}

	public StoreDTO(String store_id, String storename, String tel, String address, String lineintro, String intro,
			String image, String main_menu, String main_image, String region_name, String feature, String dessert) {
		super();
		this.store_id = store_id;
		this.storename = storename;
		this.tel = tel;
		this.address = address;
		this.lineintro = lineintro;
		this.intro = intro;
		this.image = image;
		this.main_menu = main_menu;
		this.main_image = main_image;
		this.region_name = region_name;
		this.feature = feature;
		this.dessert = dessert;
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

	public String getLineintro() {
		return lineintro;
	}

	public void setLineintro(String lineintro) {
		this.lineintro = lineintro;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
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

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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



}
