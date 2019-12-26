package com.roadruwa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.roadruwa.vo.BoardVo;
import com.roadruwa.vo.CommentVo;
import com.roadruwa.vo.ManagerVo;
import com.roadruwa.vo.MessageVo;
import com.roadruwa.vo.UserVo;

public interface ManagerDao {
	
	public List<UserVo> userList();
	
	public void update(UserVo vo);
	
	public void delete(String uId);
	
	public List<BoardVo> noAppr();
	
	public List<BoardVo> yesAppr();
	
	public void apprUpdate(@Param("b_num") String b_num);
	
	public List<MessageVo> sendmsg();
	
	public List<MessageVo> getmsg();
	
	public MessageVo replymsg(@Param("mNum") int mNum);
	
	public void boarddelete(String b_num);
	
	public void messagereply(MessageVo vo);
	
	public List<BoardVo> cateList();
	
	public List<BoardVo> locationList();
}
