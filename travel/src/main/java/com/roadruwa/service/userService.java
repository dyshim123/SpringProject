package com.roadruwa.service;

import java.util.List;

import com.roadruwa.comm.UserException;
import com.roadruwa.vo.UserVo;

public interface userService {
	public int isValidUser(String userid, String pswd);
	public UserVo getUser(String userid);
	public void write(UserVo vo) throws Exception;
//	public int updateAuthstatus(String uId);
//	public void updateAuthkey(UserVo vo);
	public UserVo isIdCheck(String uName, String uEmail);
	public String idcheck(String uId);
	public List<UserVo> memberList(String u_id);
	public int updateUserVo(UserVo vo) throws UserException ;
	public void DeleteUserVo(String uId);
	public String getPw(String uId, String uEmail);
}
