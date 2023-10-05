package com.ezen.dda.search;

public class SearchDTO {
String storename,tel,address,intro,image,main_menu,main_image,region_code,feature,dessert;

public SearchDTO() {}

public SearchDTO(String storename, String tel, String address, String intro, String image, String main_menu,
		String main_image, String region_code, String feature, String dessert) {
	super();
	this.storename = storename;
	this.tel = tel;
	this.address = address;
	this.intro = intro;
	this.image = image;
	this.main_menu = main_menu;
	this.main_image = main_image;
	this.region_code = region_code;
	this.feature = feature;
	this.dessert = dessert;
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

public String getRegion_code() {
	return region_code;
}

public void setRegion_code(String region_code) {
	this.region_code = region_code;
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
