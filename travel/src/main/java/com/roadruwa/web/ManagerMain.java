package com.roadruwa.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.roadruwa.service.ManagerService;
import com.roadruwa.service.userService;
import com.roadruwa.vo.BoardDayVo;
import com.roadruwa.vo.BoardVo;
import com.roadruwa.vo.CommentVo;
import com.roadruwa.vo.ManagerVo;
import com.roadruwa.vo.MessageVo;
import com.roadruwa.vo.UserVo;

@Controller
public class ManagerMain {
	private final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private ManagerService managerService;
	
	@Inject
	private userService userService;
	
	@RequestMapping(value = "/manager/user.do")
	public String user(Model model) {
		List<UserVo> list = managerService.userList();
		System.out.println(list);
		model.addAttribute("list", list);
		return "manager/user";
	}
	
	@RequestMapping(value = "/manager/board.do", method = RequestMethod.GET)
	public String board(Model model) {
		List<BoardVo> list = managerService.noAppr();
		List<BoardVo> lists = managerService.yesAppr();
		System.out.println(list);
		System.out.println(lists);
		model.addAttribute("list", list);
		model.addAttribute("lists", lists);
		return "manager/board";
	}
	
	@RequestMapping(value = "/managerlogin/main.do", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		String u_id =(String) session.getAttribute("u_id");
		List<UserVo> list = managerService.userList();
		List<BoardVo> lists = managerService.noAppr();
		List<MessageVo> msg = managerService.getmsg();
		List<BoardVo> cate = managerService.cateList();
		List<BoardVo> location = managerService.locationList();
		model.addAttribute("list", list);
		model.addAttribute("code", u_id);
		model.addAttribute("lists", lists);
		model.addAttribute("msg", msg);
		model.addAttribute("cate", cate);
		model.addAttribute("location", location);
		System.out.println(location);
		System.out.println(cate);
		return "manager/main";
	}
	
	 @RequestMapping(value = "/managerlogin/managerLogout.do") 
	 public String managerLogout(HttpSession session) {
		 session.invalidate(); 
		 return "redirect:/managerlogin/loginForm.do"; 
		 }
	
	 @RequestMapping(value = "/manager/buyPro.do") 
	 public String buyPro(@RequestParam("bNum") String b_num, Model model, CommentVo vo) {
			return "redirect:/buyPro.do?b_num=" + b_num;
		}
	 
	 @RequestMapping(value="/manager/boarddelete.do")
	 public String boarddelete(@RequestParam("bNum") String b_num) {
		 managerService.boarddelete(b_num);
		 return "redirect:/manager/board.do";
	 }
	 
	 @RequestMapping(value = "/manager/userUpdate.do") 
	 public String userUpdate(@RequestParam("uId") String uId, Model model) {
		 List<UserVo> lists = userService.memberList(uId);
		 System.out.println(lists);
		 model.addAttribute("lists", lists);
		 return "manager/userUpdate"; 
		 }
     
	 @RequestMapping(value = "/manager/update.do", method = RequestMethod.POST) 
	 public String update(UserVo vo) {
		 System.out.println(vo);
		 managerService.update(vo);
		 return "redirect:/manager/user.do"; 
		 }
			
	 @RequestMapping(value = "/manager/userdelete.do") 
	 public String userdelete(@RequestParam("uId") String uId) {
			 System.out.println(uId);
			 managerService.delete(uId);
			 return "redirect:/manager/user.do"; 
	 }
	  	 
	 @RequestMapping(value="/manager/apprUpdate.do")
	 public String apprUpdate(@RequestParam("bNum") String b_num) {
		 managerService.apprUpdate(b_num);
		 return "redirect:/manager/board.do";
	 }
	 
	 @RequestMapping(value="/manager/message.do")
	 public String message(Model model) {
		 List<MessageVo> list = managerService.sendmsg();
		 List<MessageVo> lists = managerService.getmsg();
		 model.addAttribute("lists", lists);
		 model.addAttribute("list", list);
		 return "manager/message";
	 }
	
	 @RequestMapping(value="/manager/replymsg.do")
	 public String replymsg(@RequestParam("mNum") int mNum, Model model) {
		 MessageVo list = managerService.replymsg(mNum);
		 System.out.println(list);
		 model.addAttribute("list", list);
		 return "manager/replymsg";
	 }
	 
	 @RequestMapping(value=" /manager/sendmsg.do")
	 public String sendmsg(@RequestParam("mNum") int mNum, Model model) {
		 MessageVo list = managerService.replymsg(mNum);
		 System.out.println(list);
		 model.addAttribute("list", list);
		 return "manager/sendmsg";
	 }
	 
	 @RequestMapping(value="/manager/messagereply.do", method = RequestMethod.POST)
	 public String messagereply(MessageVo vo, HttpSession session) {
		 System.out.println(vo);
		 managerService.messagereply(vo);
		 return "redirect:/manager/message.do";
		 }
	 
}
