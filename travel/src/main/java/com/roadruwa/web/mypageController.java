package com.roadruwa.web;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.roadruwa.service.BoardService;
import com.roadruwa.service.PointService;
import com.roadruwa.service.userService;
import com.roadruwa.vo.BoardVo;
import com.roadruwa.vo.BuyVo;
import com.roadruwa.vo.MessageVo;
import com.roadruwa.vo.PointVo;
import com.roadruwa.vo.UserVo;

@Controller
public class mypageController {
	private final Log logger = LogFactory.getLog(getClass());
	
	@Inject
	private userService userService;
	
	@Inject
	private PointService pointSerivce;
	
	@Inject
	private BoardService boardService;

	@RequestMapping("/myPage.do")
	public String myPage(Model model, HttpSession session) {
		String u_id = (String)session.getAttribute("u_id");
		List<BoardVo> myWrite = boardService.myWrite(u_id);
		PointVo point = pointSerivce.points(u_id);
		model.addAttribute("point", point);
		System.out.println(model.addAttribute("myWrite", myWrite));
		return "myPage/myPage";
	}

	@RequestMapping("/myBuy.do")
	public String myBuy(Model model, HttpSession session) {
		String u_id = (String)session.getAttribute("u_id");
		PointVo point = pointSerivce.points(u_id);
		List<BoardVo> buyList = boardService.buyList(u_id);
		model.addAttribute("point", point);
		System.out.println(model.addAttribute("buyList", buyList));
		return "myPage/myBuy";
	}

	@RequestMapping(value="/myPoint.do", method=RequestMethod.GET)
	public String myPoint(Model model, HttpSession session) {
		String u_id = (String)session.getAttribute("u_id");
		List<PointVo> list = pointSerivce.pointList(u_id);
		List<UserVo> lists = userService.memberList(u_id);
		model.addAttribute("Plist", list);
		model.addAttribute("userList", lists);
		PointVo point = pointSerivce.points(u_id);
		model.addAttribute("point", point);
		return "myPage/myPoint";
	}

	@RequestMapping("/myMessage.do")
	public String myMessage(Model model, HttpSession session) {
		String u_id = (String)session.getAttribute("u_id");
		PointVo point = pointSerivce.points(u_id);
		List<MessageVo> message = boardService.msgList(u_id);
		List<MessageVo> messages = boardService.msgLists(u_id);
		model.addAttribute("point", point);
		model.addAttribute("message", message);
		model.addAttribute("messages", messages);
		return "myPage/myMessage";
	}

	@RequestMapping(value="/mySetting.do", method=RequestMethod.GET)
	public String mySetting(Model model, HttpSession session) {
		String u_id = (String)session.getAttribute("u_id");
		List<UserVo> list = userService.memberList(u_id);
		PointVo point = pointSerivce.points(u_id);
		model.addAttribute("point", point);
		model.addAttribute("list", list);
		return "myPage/mySetting";
	}
	
	@RequestMapping("/chargePro.do")
	public String chargePro(@RequestParam("charge") int charge) {
		System.out.println(charge);
		return "myPage/buy";
	}
	
	@RequestMapping(value = "/account.do")
	@ResponseBody
	public String account(@RequestParam("imp_uid") String imp_uid,@RequestParam("tpoint") int tpoint, HttpSession session, PointVo vo ) {
		String u_id = (String)session.getAttribute("u_id");
		String result = pointSerivce.nowpoint(u_id);
		int rpoint =  Integer.parseInt(result);
		System.out.println("result" +result);
		/* int nowpoint = pointSerivce.ptWrite(vo); */
		vo.setrPoint(rpoint + tpoint);
		vo.setuId(u_id);
		vo.settPoint(tpoint);
		pointSerivce.ptWrite(vo);
		
	return imp_uid;
	}
	
	@RequestMapping("/message_views.do")
	public String message_views(@RequestParam("mNum") int mNum, Model model) {
		MessageVo sendMsg = boardService.sendMessage(mNum);
		model.addAttribute("sendMsg", sendMsg);
		return "myPage/message_views";
	}
	
	@RequestMapping("/message_viewss.do")
	public String message_viewss(@RequestParam("mNum") int mNum, Model model) {
		System.out.println("다요미");
		MessageVo sendMsg = boardService.sendMessage(mNum);
		model.addAttribute("sendMsg", sendMsg);
		return "myPage/myBuy";
	}
	
	@RequestMapping("/message_view.do")
	public String message_view(@RequestParam("mNum") int mNum, Model model) {
		  MessageVo sendMsg = boardService.sendMessage(mNum);
		  model.addAttribute("sendMsg", sendMsg);
		return "myPage/message_view";
	}
	@RequestMapping(value ="/message_reply.do", method=RequestMethod.POST)
	public String mssage_reply(MessageVo vo, Model model) {
		  System.out.println(vo);
		  boardService.replyMessage(vo);
		  return "redirect:/myMessage.do";
		}
	
	@RequestMapping(value ="/mp_messageDelPro.do", method=RequestMethod.POST)
	@ResponseBody
	public int mp_messageDelPro(@RequestParam("main") int[] main, Model model, MessageVo vo) {
	System.out.println(main.length);
	for(int i =0; i<main.length; i++) {
	System.out.println(main[i]);
	  vo.setmNum(main[i]);
	boardService.delmessage(vo);
	}
	int a= 1;
	return a;
	}
	
	@RequestMapping(value ="/mp_messagePro.do", method=RequestMethod.POST)
	@ResponseBody
	public int mp_messagePro(MessageVo vo, Model model, HttpSession session) {
		String u_id = (String)session.getAttribute("u_id");
		  System.out.println(vo);
		  vo.setuId(u_id);
		  boardService.managerMsg(vo);
		  int a = 1;
		  return a;
		}
}
