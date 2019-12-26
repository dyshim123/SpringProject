package com.roadruwa.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class BaseVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3176604174694084164L;
	private boolean bReg = false;

	public boolean isbReg() {
		return bReg;
	}

	public void setbReg(boolean bReg) {
		this.bReg = bReg;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.MULTI_LINE_STYLE);
	}

	@Override
	public boolean equals(Object o){
		return EqualsBuilder.reflectionEquals(this, o);
	}
	
	@Override
	public int hashCode(){
		return HashCodeBuilder.reflectionHashCode(this);
	}
}
