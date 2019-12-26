package com.roadruwa.vo;

import java.util.Date;

public class BuyVo extends BaseVO {
	private int buyNum;
	private String Buyer;
	private int buyPrice;
	private int buyCount;
	private Date buyDate;
	private int bNum;
	private Integer buy_count;
	
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	public String getBuyer() {
		return Buyer;
	}
	public void setBuyer(String buyer) {
		Buyer = buyer;
	}
	
	public int getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}
	public int getBuyCount() {
		return buyCount;
	}
	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}
	public Date getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public Integer getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(Integer buy_count) {
		this.buy_count = buy_count;
	}
	

}
