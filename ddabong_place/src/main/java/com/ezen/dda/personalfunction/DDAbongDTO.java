package com.ezen.dda.personalfunction;

public class DDAbongDTO {

String store_id;
int thismonth,totaldda;

public DDAbongDTO() {
	super();
}

public DDAbongDTO(String store_id, int thismonth, int totaldda) {
	super();
	this.store_id = store_id;
	this.thismonth = thismonth;
	this.totaldda = totaldda;
}

public String getStore_id() {
	return store_id;
}

public void setStore_id(String store_id) {
	this.store_id = store_id;
}

public int getThismonth() {
	return thismonth;
}

public void setThismonth(int thismonth) {
	this.thismonth = thismonth;
}

public int getTotaldda() {
	return totaldda;
}

public void setTotaldda(int totaldda) {
	this.totaldda = totaldda;
}
	


}
