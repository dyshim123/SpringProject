package com.roadruwa.service.imp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.roadruwa.dao.BoardDao;
import com.roadruwa.service.BoardService;
import com.roadruwa.vo.BoardDayVo;
import com.roadruwa.vo.BoardVo;
import com.roadruwa.vo.BuyVo;
import com.roadruwa.vo.CommentVo;
import com.roadruwa.vo.MessageVo;

@Service("boardService")
public class BoardServiceImp implements BoardService {
	private final Log logger = LogFactory.getLog(getClass());
	
	@Resource(name="boardDao")
	private BoardDao boardDao;

	@Override
	public List<BoardVo> getBoardList(String lotation, Integer day,
			Integer cost, String trans, String tema,
			String search) {
		return boardDao.getBoardList(lotation, day, cost, trans, tema, search);
	}
	
	@Override
	public List<BoardVo> getBoardpopList(String lotation, Integer day,
			Integer cost, String trans, String tema,
			String search) {
		return boardDao.getBoardpopList(lotation, day, cost, trans, tema, search);
	}
	
	@Override
	public List<BuyVo> buyCount(Integer b_num){
		return boardDao.buyCount(b_num);
	}
	
	@Override
	public List<BoardVo> myWrite(String u_id){
		return boardDao.myWrite(u_id);
	}
	
	@Override
	public void boardinsert(BoardVo board) {
		boardDao.boardinsert(board);
	}
	
    @Override
    public void boardDayinsert(BoardDayVo dayvo) {
    	boardDao.boardDayinsert(dayvo);
    }
    
    @Override
    public BoardVo contentview(String b_num){
    	return boardDao.contentview(b_num);
    }
    
    @Override
    public List<BoardDayVo> contentdayview(String b_num) {
    	return boardDao.contentdayview(b_num);
    }
    
    @Override
    public void commnetWrite(CommentVo vo) {
    	 boardDao.commnetWrite(vo);
    }
    
    @Override
    public List<CommentVo> commentview(String b_num) {
    	return boardDao.commentview(b_num);
    }
    
    @Override
    public void cdelete(int c_num) {
    	boardDao.cdelete(c_num);
    }
    
    @Override
    public String commentCount(String b_num) {
    	return boardDao.commentCount(b_num);
    }
    
    @Override
    public void cupdate(CommentVo vo) {
    	 boardDao.cupdate(vo);
    }
    
    @Override
    public void acUpdate(BoardVo vo) {
    	boardDao.acUpdate(vo);
    }
    
    @Override
    public void messageWrite(MessageVo vo) {
    	 boardDao.messageWrite(vo);
    }
    
    @Override
    public List<MessageVo> msgList(String u_id){
    	return boardDao.msgList(u_id);
    }
    
    @Override
    public List<MessageVo> msgLists(String u_id){
    	return boardDao.msgLists(u_id);
    }
    
    @Override
    public MessageVo sendMessage(int mNum) {
    	return boardDao.sendMessage(mNum);
    }
    
    @Override
    public void replyMessage(MessageVo vo) {
    	boardDao.replyMessage(vo);
    }
    
    @Override
    public void delmessage(MessageVo vo) {
    	boardDao.delmessage(vo);
    }
    
    @Override
    public void managerMsg(MessageVo vo) {
    	boardDao.managerMsg(vo);
    }
    
    @Override
    public void delForm(int b_num) {
    	boardDao.delForm(b_num);
    }
    
    @Override
    public List<BoardVo> buyList(String u_id){
    	return boardDao.buyList(u_id);
    }
    
    @Override
    public void upPrice(BoardVo bo) {
       boardDao.upPrice(bo);
    }
    
    @Override
    public List<BuyVo> userBuyList(String u_id){
    	return boardDao.userBuyList(u_id);
    }
    
    @Override
    public void userBuy(BuyVo vo) {
    	boardDao.userBuy(vo);
    }

}