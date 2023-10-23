package com.ezen.dda.personalfunction;

public class ReservationDTO {
String store_img, storename,reservation_date,reservation_time;
int person_num;
String reservation_num;
String store_id, tel, address;
String image;
String reservation_name;

public ReservationDTO() {
   super();
}

public ReservationDTO(String store_img, String storename, String reservation_date, String reservation_time,
      int person_num, String reservation_num, String store_id, String tel, String address, String image,
      String reservation_name) {
   super();
   this.store_img = store_img;
   this.storename = storename;
   this.reservation_date = reservation_date;
   this.reservation_time = reservation_time;
   this.person_num = person_num;
   this.reservation_num = reservation_num;
   this.store_id = store_id;
   this.tel = tel;
   this.address = address;
   this.image = image;
   this.reservation_name = reservation_name;
}

public String getStore_img() {
   return store_img;
}

public void setStore_img(String store_img) {
   this.store_img = store_img;
}

public String getStorename() {
   return storename;
}

public void setStorename(String storename) {
   this.storename = storename;
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

public String getStore_id() {
   return store_id;
}

public void setStore_id(String store_id) {
   this.store_id = store_id;
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

public String getImage() {
   return image;
}

public void setImage(String image) {
   this.image = image;
}

public String getreservation_name() {
   return reservation_name;
}

public String setreservation_name(String reservation_name) {
   return reservation_name = reservation_name;
}




}