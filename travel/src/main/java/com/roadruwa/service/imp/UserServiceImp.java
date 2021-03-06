package com.roadruwa.service.imp;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.roadruwa.comm.UserException;
import com.roadruwa.comm.web.MailUtils;
import com.roadruwa.comm.web.TempKey;
import com.roadruwa.dao.UserDao;
import com.roadruwa.service.userService;
import com.roadruwa.vo.UserVo;

@Service("userService")
public class UserServiceImp implements userService {
	private final Log logger = LogFactory.getLog(getClass());

	@Inject
	UserDao userDao;
	
	@Override
	public int isValidUser(String userid, String pswd) {
		UserVo user = userDao.getUserVoItem(userid);
		int rtnStat = -1;

		if (user == null) {
			// ID존재 하지 않음.(그런 유저는 없어요.)
			rtnStat = 1;
		} else {
			if (pswd.equals(user.getuPwd())) {
				// 맞아요. 패스워드도 일치 하는군요.
				rtnStat = 0;
			} else {
				rtnStat = 2;
			}
		}
		return rtnStat;
	}

	@Override
	public UserVo getUser(String userid) {
		return userDao.getUserVoItem(userid);
	}
	
	@Override
	public void write(UserVo vo){
		userDao.write(vo);
	}
	
//	@Override
//	public void updateAuthkey(UserVo vo) {
//		userDao.updateAuthkey(vo);
//	}
//	
//	@Override
//	public int updateAuthstatus(String uId) {
//		int updateCunt = userDao.updateAuthstatus(uId);
//		System.err.println("updateCunt::" + updateCunt);
//		return updateCunt;
//	}
	
	@Override
	public UserVo isIdCheck(String uName, String uEmail) {
		UserVo result = userDao.getUserCheck(uName, uEmail);
        return result;
	}
	
	@Override
	// 중복 아이디 체크
		public String idcheck(String uId) {
		UserVo user = userDao.IdCheck(uId);
		String result = "";
		if(user != null) {
			result = "no";
		}else{
			result = "";
		}
		return result;
	}
	
	@Override
	public List<UserVo> memberList(String u_id){
		return userDao.memberList(u_id);
	}
	
	@Override
	public int updateUserVo(UserVo vo) throws UserException {
		System.out.println("개수힝");
		int updateCnt = userDao.updateUserVo(vo);
		System.out.println("개수"+updateCnt);
		String msg = "";
		
		if(updateCnt == 0 ) {
			msg = "ID 또는 비밀번호가 일치하지 않습니다.";
		}else if(updateCnt == 1 ) {
			msg = "수정성공....";
		}else {
			throw new UserException("잘못된 update입니다.");
		}
			
		return updateCnt;
	}
	
	@Override
	public String getPw(String uId, String uEmail) {
		/* return userDao.getPw(uId, uEmail); */
		UserVo result = userDao.getPw(uId, uEmail); 
		String pwd = " ";
		if(result != null) {
			pwd = result.getuPwd();
		}else {
			pwd = " ";
		}
		return pwd;
	}
	
	
	@Override
	public void DeleteUserVo(String uId) {
		userDao.DeleteUserVo(uId);
	}
}
