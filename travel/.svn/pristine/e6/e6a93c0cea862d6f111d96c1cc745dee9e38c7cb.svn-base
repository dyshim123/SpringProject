package com.roadruwa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.roadruwa.vo.PointVo;
import com.roadruwa.vo.UserVo;

public interface PointDao {
	public void write(PointVo point);
	public List<PointVo> pointList(@Param("u_id") String u_id);
    public void  ptWrite(PointVo vo);
    public String nowpoint(@Param("u_id") String u_id);
    public PointVo points(@Param("u_id") String u_id);
    public void userBuy(PointVo vo);
}
