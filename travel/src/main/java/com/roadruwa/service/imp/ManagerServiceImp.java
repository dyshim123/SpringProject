package com.roadruwa.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.roadruwa.dao.ManagerDao;
import com.roadruwa.service.ManagerService;
import com.roadruwa.vo.BoardVo;
import com.roadruwa.vo.CommentVo;
import com.roadruwa.vo.ManagerVo;
import com.roadruwa.vo.MessageVo;
import com.roadruwa.vo.UserVo;

@Service("managerService")
public class ManagerServiceImp implements ManagerService {
private final Log logger = LogFactory.getLog(getClass());
	
	@Resource(name="managerDao")
	private ManagerDao managerDao;

	@Override
	public List<UserVo> userList(){
		return managerDao.userList();
	}
	
	@Override
	public void update(UserVo vo) {
		managerDao.update(vo);
	}
	
	@Override
	public void delete(String uId) {
		managerDao.delete(uId);
	}
	
	@Override
	public List<BoardVo> noAppr(){
		return managerDao.noAppr();
	}
	
	@Override
	public List<BoardVo> yesAppr(){
		return managerDao.yesAppr();
	}
	
	@Override
	public void apprUpdate(String b_num) {
		managerDao.apprUpdate(b_num);
	}
	
	@Override
	public List<MessageVo> sendmsg() {
		return managerDao.sendmsg();
	}
	
	@Override
	public List<MessageVo> getmsg(){
		return managerDao.getmsg();
	}
	
	@Override
	public MessageVo replymsg(int mNum) {
		return managerDao.replymsg(mNum);
	}
	
	@Override
	public void boarddelete(String b_num) {
		managerDao.boarddelete(b_num);
	}
	
	@Override
	public void messagereply(MessageVo vo) {
		managerDao.messagereply(vo);
	}
	
	@Override
	public List<BoardVo> cateList(){
		return managerDao.cateList();
	}
	
	@Override
	public List<BoardVo> locationList(){
		return managerDao.locationList();
	}
	
}
