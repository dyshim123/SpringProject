package com.roadruwa.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.roadruwa.vo.BoardDayVo;
import com.roadruwa.vo.BoardVo;
import com.roadruwa.vo.BuyVo;
import com.roadruwa.vo.CommentVo;
import com.roadruwa.vo.MessageVo;


public interface BoardService {
	public List<BoardVo> getBoardList(String lotation, Integer day,
			Integer cost, String trans, String tema,
			String search);
	
	public List<BoardVo> getBoardpopList(String lotation, Integer day,
			Integer cost, String trans, String tema,
			String search);
	
	public List<BuyVo> buyCount(Integer b_num);
	
	public void boardinsert(BoardVo board);
   
	public void boardDayinsert(BoardDayVo dayvo);
	
	public BoardVo contentview(String b_num);
	
	public List<BoardDayVo> contentdayview(String b_num);
	
	public List<BoardVo> myWrite(String u_id);
	
	public void commnetWrite(CommentVo vo);
	
	public List<CommentVo> commentview(String b_num);
	
	public void cdelete(int c_num);
	
	public String commentCount(String b_num);
	
	public void cupdate(CommentVo vo);
	
	public void messageWrite(MessageVo vo);
	
	public List<MessageVo> msgList(String u_id);
	
	public List<MessageVo> msgLists(String u_id);
	
	public MessageVo sendMessage(int mNum);
	
	public void delForm(int b_num);
	
	public void replyMessage(MessageVo vo);
	
	public void delmessage(MessageVo vo);
	
	public void managerMsg(MessageVo vo);
	
	public void acUpdate(BoardVo vo);
	
	public void upPrice(BoardVo bo);
	
	//구매
	public List<BoardVo> buyList(String u_id);
	
	public List<BuyVo> userBuyList(String u_id);
	
	public void userBuy(BuyVo vo);
}