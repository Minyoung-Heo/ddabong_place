package com.ezen.dda.rank;

public class RankDTO {
	String store_id; // 가게 아이디
	String storeName; // 매장명
	int jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec; // 각 월의 따봉 수
	String image; // 메인화면에 띄울 이미지
	String month; // 이번 달
	int sum; // 1~12월 따봉 수 총합
	
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public int getJan() {
		return jan;
	}
	public void setJan(int jan) {
		this.jan = jan;
	}
	public int getFeb() {
		return feb;
	}
	public void setFeb(int feb) {
		this.feb = feb;
	}
	public int getMar() {
		return mar;
	}
	public void setMar(int mar) {
		this.mar = mar;
	}
	public int getApr() {
		return apr;
	}
	public void setApr(int apr) {
		this.apr = apr;
	}
	public int getMay() {
		return may;
	}
	public void setMay(int may) {
		this.may = may;
	}
	public int getJun() {
		return jun;
	}
	public void setJun(int jun) {
		this.jun = jun;
	}
	public int getJul() {
		return jul;
	}
	public void setJul(int jul) {
		this.jul = jul;
	}
	public int getAug() {
		return aug;
	}
	public void setAug(int aug) {
		this.aug = aug;
	}
	public int getSep() {
		return sep;
	}
	public void setSep(int sep) {
		this.sep = sep;
	}
	public int getOct() {
		return oct;
	}
	public void setOct(int oct) {
		this.oct = oct;
	}
	public int getNov() {
		return nov;
	}
	public void setNov(int nov) {
		this.nov = nov;
	}
	public int getDec() {
		return dec;
	}
	public void setDec(int dec) {
		this.dec = dec;
	}
	public RankDTO() {
		super();
	}
}
