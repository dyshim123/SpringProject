package com.roadruwa.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.roadruwa.service.BoardService;
import com.roadruwa.vo.BoardVo;
import com.roadruwa.vo.BuyVo;


@Controller
public class DetailPageController {
private final Log logger = LogFactory.getLog(getClass());
	
	@Autowired 
	private BoardService boardService;
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam("lotation") String lotation, @RequestParam("day") Integer day, @RequestParam("cost") Integer cost
			             ,@RequestParam("trans") String trans, @RequestParam("tema") String tema, @RequestParam("search") String search, Model model,HttpSession session ) {
		String u_id = (String)session.getAttribute("u_id");
		List<BuyVo> buyList = boardService.userBuyList(u_id);
		List<BoardVo> myWrite = boardService.myWrite(u_id);
		model.addAttribute("buyList",buyList);
		model.addAttribute("myWrite",myWrite);
     model.addAttribute("detailList",boardService.getBoardList(lotation, day, cost, trans, tema, search));
     return "detail";
	}
	
	@RequestMapping("/popularity.do")
	public String popularity( HttpServletRequest request, Model model, HttpSession session) {
		String u_id = (String)session.getAttribute("u_id");
		List<BuyVo> buyList = boardService.userBuyList(u_id);
		List<BoardVo> myWrite = boardService.myWrite(u_id);
		model.addAttribute("buyList",buyList);
		model.addAttribute("myWrite",myWrite);
		model.addAttribute("modalPopLists", boardService.getBoardpopList(null, null, null, null, null, null));
		return "popularity";
	}
}
