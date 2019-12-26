package com.roadruwa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.roadruwa.vo.UserVo;

public interface UserDao {

	public UserVo getUserVoItem(@Param("userid") String userid);

	public int updateUserVo(UserVo vo);

	public int write(UserVo vo);
	
//	public int updateAuthkey(UserVo vo);
//	
//	public int updateAuthstatus(@Param("uId") String uId);
	
	public UserVo getUserCheck(@Param("uName") String uName, @Param("uEmail") String uEmail);
	
	public UserVo IdCheck(@Param("uId") String uId);
	
	public List<UserVo> memberList(@Param("u_id") String u_id);
	
	/* public int UpdateUserVo(UserVo vo); */
	
	public int DeleteUserVo(@Param("uId") String uId);
	
	public UserVo getPw(@Param("uId") String uId, @Param("uEmail") String uEmail);
}