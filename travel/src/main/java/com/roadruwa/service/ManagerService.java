package com.roadruwa.service;

import java.util.List;

import com.roadruwa.vo.BoardVo;
import com.roadruwa.vo.CommentVo;
import com.roadruwa.vo.ManagerVo;
import com.roadruwa.vo.MessageVo;
import com.roadruwa.vo.UserVo;

public interface ManagerService {
	
	public List<UserVo> userList();
	
	public void update(UserVo vo);
	
	public void delete(String uId);
	
	public List<BoardVo> noAppr();
	
	public List<BoardVo> yesAppr();
	
	public void apprUpdate(String b_num);
	
	public List<MessageVo> sendmsg();
	
	public List<MessageVo> getmsg();
	
	public MessageVo replymsg(int mNum);
	
	public void boarddelete(String b_num);
	
	public void messagereply(MessageVo vo);
	
	public List<BoardVo> cateList();
	
	public List<BoardVo> locationList();
	
}
