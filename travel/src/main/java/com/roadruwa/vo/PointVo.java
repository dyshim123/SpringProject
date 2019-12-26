package com.roadruwa.vo;

import java.util.Date;

public class PointVo extends BaseVO{
	private int pNum;
	private String uId;
	private Date pReg;
	private String Content;
	private int tPoint; // 거래포인트
	private int rPoint; // 잔액포인트

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	
	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public Date getpReg() {
		return pReg;
	}

	public void setpReg(Date pReg) {
		this.pReg = pReg;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public int gettPoint() {
		return tPoint;
	}

	public void settPoint(int tPoint) {
		this.tPoint = tPoint;
	}

	public int getrPoint() {
		return rPoint;
	}

	public void setrPoint(int rPoint) {
		this.rPoint = rPoint;
	}

}
