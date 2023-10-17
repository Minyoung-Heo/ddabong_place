package com.ezen.dda.personalfunction;

import java.util.List;

public class RegistrationDTO {
String store_id,storename,tel,address,intro,main_menu,main_image,region_name,feature,dessert;
List<String> image;

public RegistrationDTO() {}

public RegistrationDTO(String store_id,String storename, String tel, String address, String intro, List<String> image, String main_menu,
		String main_image, String region_name, String feature, String dessert) {
	super();
	this.store_id = store_id;
	this.storename = storename;
	this.tel = tel;
	this.address = address;
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

public String getIntro() {
	return intro;
}

public void setIntro(String intro) {
	this.intro = intro;
}

public List<String> getImage() {
	return image;
}

public void setImage(List<String> imageList) {
	this.image = imageList;
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
