package com.edu.mealkit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.board.service.BoardService;
import com.edu.mealkit.dto.BuyDTO;
import com.edu.mealkit.dto.M_Criteria;
import com.edu.mealkit.dto.M_PageMaker;
import com.edu.mealkit.dto.MealkitDTO;
import com.edu.mealkit.dto.MemberDTO;
import com.edu.mealkit.service.ManagerService;
import com.edu.mealkit.service.MealkitService;
import com.edu.mealkit.service.ShopService;

@Controller
@RequestMapping("/mealkit")
public class MealkitController {
	
	private static final Logger logger = LoggerFactory.getLogger(MealkitController.class);
	
    @Inject    //서비스를 호출하기 위해서 의존성을 주입
    ManagerService managerservice;
	
	@Inject
	private MealkitService mealkitService;
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private ShopService shopService;
	
	@RequestMapping(value="/index")
	public void main() throws Exception{
	} 
	
	@RequestMapping("/story")
	public void story() throws Exception {
	} 
	
	@RequestMapping("/login")
	public void login() throws Exception {
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void join() throws Exception {
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사
	//-----------------------------------------------------------------------------------------------------------
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public int idCheck(MemberDTO memberDTO) throws Exception {
		
		int result = mealkitService.idCheck(memberDTO);
		return result;
		
	} // End - public int idCheck(MealkitDTO mealkitDTO) 
	
	//-----------------------------------------------------------------------------------------------------------
	// 회원가입 POST (AJAX)
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/registerAjax", method = RequestMethod.POST)
	public String postRegisterAjax(MemberDTO memberDTO) throws Exception {
		mealkitService.register(memberDTO);
		return "redirect:/";
		
	} // end String postRegisterAjax(MemberDTO memberDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 중복 회원가입 방지(전화번호 중복)
	//-----------------------------------------------------------------------------------------------------------
	@ResponseBody
	@RequestMapping(value="/phone", method=RequestMethod.POST)
	public int phoneCheck(MemberDTO memberDTO) throws Exception {
		int result = mealkitService.phoneCheck(memberDTO);
		return result;
		
	} // end int phoneCheck(MemberDTO memberDTO)
	
	//-------------------------------------------------------------------------------------------------
	// 로그인 GET
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String getLogin() throws Exception {
		return "/mealkit/login";
	}

	//-------------------------------------------------------------------------------------------------
	// 로그인 POST
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(MemberDTO memberDTO, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		
		HttpSession session = req.getSession();
		
		// 넘겨받은 회원정보를 가지고 Service에게 의뢰한다.
		MemberDTO login = mealkitService.login(memberDTO);
		
		// RedirectAttributes : redirect로 리턴하는 코드가 있어야 한다.
		// Model : jsp페이지를 거쳐갈때는 model로 값을 보내주면 된다.
		
		// 해당하는 회원정보가 없다면
		if(login == null) {
			logger.info("null???" + login);
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/mealkit/login";
		} else {
			logger.info("null 아니면: " + login);
			// 로그인이 정상이라면 세션을 발급한다.
			session.setAttribute("member", login);
			return "redirect:/";
		}
		
	} // end String login(MemberDTO memberDTO, HttpServletRequest req, RedirectAttributes rttr)
	
	//-------------------------------------------------------------------------------------------------
	// 로그아웃
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
		
	} // end String logout(HttpSession session)

	//-------------------------------------------------------------------------------------------------
	// 비밀번호 찾기 : GET
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/findPass", method=RequestMethod.GET)
	public void getfindPass() throws Exception {
	} 
	
	//-------------------------------------------------------------------------------------------------
	// 비밀번호 찾기 : POST
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/findPass", method=RequestMethod.POST)
	public String findPass(MemberDTO memberDTO, RedirectAttributes rttr, HttpServletRequest req) throws Exception {
		int result = mealkitService.findPass(memberDTO);
		
		HttpSession session = req.getSession();
		
		if(result==0) { // 찾지 못했다면
			logger.info("찾음?? ㄴㄴ" + memberDTO);
			session.setAttribute("passwd", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/mealkit/findPass";
		}
		else { // 찾았다면 새로운 비밀번호 생성페이지로 이동
			logger.info("찾음?? ㅇㅇ" + memberDTO);
			session.setAttribute("id", memberDTO.getId());
			return "redirect:/mealkit/newPass";
		}
		
	} // end String findPass(String id, String phone)
	
	//-------------------------------------------------------------------------------------------------
	// 새로운 비밀번호 만들기 : GET
	//-------------------------------------------------------------------------------------------------	
	@RequestMapping(value="/newPass", method=RequestMethod.GET)
	public void getnewPass() throws Exception{
	}
	
	//-------------------------------------------------------------------------------------------------
	// 새로운 비밀번호 만들기 : POST
	//-------------------------------------------------------------------------------------------------	
	@RequestMapping(value="/newPass", method=RequestMethod.POST)
	public String postnewPass(MemberDTO memberDTO) throws Exception{
		mealkitService.newPass(memberDTO);
		return "redirect:/";
		
	} // end String postnewPass(MemberDTO memberDTO)
	
	//-------------------------------------------------------------------------------------------------
	// 회원 정보 삭제 : GET
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public void getDelete(HttpSession session, Model model) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int result = boardService.boardcount(memberDTO.getId());
		
		if(result > 0) {
			model.addAttribute("yes", "yes");
		} else { 
			model.addAttribute("no", "no");
		}
		
	} // end void getDelete(HttpSession session, Model model)

	//-------------------------------------------------------------------------------------------------
	// 회원 정보 삭제 POST
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String postDelete(MemberDTO memberDTO, HttpSession session) throws Exception {
		
		memberDTO = (MemberDTO)session.getAttribute("member");
		logger.info("Controller 회원탈퇴~~~~~~~~~~~~"+ memberDTO);
		mealkitService.delete(memberDTO);
		session.invalidate();
		return "redirect:/";
		
	} // end String postDelete(MemberDTO memberDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디 찾기 GET
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/findId",method = RequestMethod.GET)
	public String findId() throws Exception{
		logger.info("아이디찾으러옴!!-----");
		return "/mealkit/findId";
		
	} // end String findId()
	
	//-----------------------------------------------------------------------------------------------------------
	// 아이디 찾기 POST
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/findId",method = RequestMethod.POST)
	public String findId(MemberDTO memberDTO, RedirectAttributes rttr, HttpServletRequest req ,Model md) throws Exception{
			
	    String result = mealkitService.findId(memberDTO);	
	    logger.info("찾은 아이디 result: " + result);
	
	    HttpSession session = req.getSession();
	    
	    if(result == null) {//찾지못했다몬
	   
	      logger.info("찾은 아이디 : 없음" + mealkitService.findId(memberDTO));
	      session.setAttribute("id", null);
	      rttr.addFlashAttribute("msg", false);
	      return "redirect:/mealkit/findId";
	      
	    } else {//찾았다면 아이디를보여줌
	    	
	    	String userID = mealkitService.findId(memberDTO);
	    	logger.info("찾은 아이디 : " + userID);
	    	session.setAttribute("id", memberDTO.getId());
	    	 md.addAttribute("id", userID);
	       return "/mealkit/showId";
	       
	     }
	    
	} // end String findId(MemberDTO memberDTO, RedirectAttributes rttr, HttpServletRequest req ,Model md)
	
	//-----------------------------------------------------------------------------------------------------------
	// 내 정보
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public void myPage(MemberDTO memberDTO, HttpSession session, Model model,M_Criteria cri) throws Exception {
		
		memberDTO = (MemberDTO)session.getAttribute("member");
		model.addAttribute("member", memberDTO);
		
		//-----------------------------------------------------------------------------------------------------------
		// 구매내역 모두 찾는 메서드
		//-----------------------------------------------------------------------------------------------------------
		List<BuyDTO> orderList = shopService.getBuys(memberDTO.getId());
		BuyDTO buyDTO = new BuyDTO();

		logger.info("managerController orderList()  return Value ==> " + orderList);
			
		model.addAttribute("orderList", orderList);
		
	} // end void myPage(HttpServletRequest req, Model model)
	
 	//-------------------------------------------------------------------------------------------------
	// 주문 상세정보를 가져온다.
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/myOrderView", method=RequestMethod.GET)
	public void orderView(@RequestParam("order_id") String order_id, Model model) throws Exception {
		
		logger.info("managerController 주문상세정보 가져오기 ==> " + order_id);
		
		List<BuyDTO> orderView = new ArrayList<BuyDTO>();
		orderView.addAll(managerservice.orderView(order_id));
		logger.info("managerController return Value ==> " + orderView);
		
		BuyDTO buyDTO = new BuyDTO();
		buyDTO.setMember_id(orderView.get(0).getMember_id());
		buyDTO.setDelivery_name(orderView.get(0).getDelivery_name());
		buyDTO.setDelivery_address(orderView.get(0).getDelivery_address());
		buyDTO.setDelivery_tel(orderView.get(0).getDelivery_tel());
		logger.info("orderView.get(0).getDelivery_name() => " + buyDTO);
		
		model.addAttribute("orderView", orderView);

		//-------------------------------------------------------------------------------------------------
		// 장바구니 총 가격을 찾는 메서드
		//-------------------------------------------------------------------------------------------------
		int allMoney = managerservice.sumBuy(order_id);
		model.addAttribute("allMoney", allMoney);
		
	} 
	
	//-----------------------------------------------------------------------------------------------------------
	// 내 정보 수정 : GET
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/updateMypage", method=RequestMethod.GET)
	public void getupdateMypage(Model model, HttpSession session) throws Exception {
	
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		model.addAttribute("member", memberDTO);
		
	} // end void getupdateMypage(Model model)
	
	//-----------------------------------------------------------------------------------------------------------
	// 내 정보 수정 : POST
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/updateMypage", method=RequestMethod.POST)
	public String postupdateMypage(MemberDTO memberDTO) throws Exception {
		
		logger.info("member뭐야 " + memberDTO);
		mealkitService.updateMypage(memberDTO);
		return "redirect:/mealkit/myPage";
		
	} // end String postupdateMypage(MemberDTO memberDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 추천인 : get
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/cc_id", method = RequestMethod.GET)
	public String getccIDParam() throws Exception {
		return "/mealkit/cc_id";
		
	} // end String getccIDParam()
		
	//-----------------------------------------------------------------------------------------------------------
	// 추천인 : post
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/cc_id", method=RequestMethod.POST)
	public String postccIDParam(MemberDTO memberDTO, @Param("id") String id, @Param("ccid") String ccid, HttpServletRequest req, RedirectAttributes rttr,String ccTure)
	throws Exception {
		
		int result = mealkitService.findccname(id);
		int result2 = mealkitService.ccTrue(ccid);
		System.err.println(ccid);

		if(result==0) { // 찾지 못했다면
			logger.info("찾음?? ㄴㄴ" + id);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/mealkit/cc_id";
		}else {
			if(result2 == 0) {
				MemberDTO cc_id = mealkitService.cc_id(id, ccid);
				rttr.addFlashAttribute("msg", true);
				return "redirect:/mealkit/cc_id";
			}else {
				rttr.addFlashAttribute("turemsg", false);
				return "redirect:/mealkit/cc_id";
			}
		}
		
	} // end String postccIDParam(Param...)

	
} // end class MealkitController
