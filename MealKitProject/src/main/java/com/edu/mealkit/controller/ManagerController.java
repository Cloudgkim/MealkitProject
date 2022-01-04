package com.edu.mealkit.controller;
 
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.file.UploadFileUtils;
import com.edu.mealkit.dto.MealkitDTO;
import com.edu.mealkit.dto.MealkitKindDTO;
import com.edu.mealkit.dto.MemberDTO;
import com.edu.mealkit.dto.M_Criteria;
import com.edu.mealkit.dto.M_PageMaker;
import com.edu.mealkit.dto.BuyDTO;
import com.edu.mealkit.dto.ManagerDTO;
import com.edu.mealkit.service.ManagerService;
 
@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
    
    @Inject    //서비스를 호출하기 위해서 의존성을 주입
    ManagerService managerservice;

    @Autowired
    @Resource(name="uploadPath")
    String uploadPath;

    
    
    //-------------------------------------------------------------------------------------------------
  	// 로그인 GET
  	//-------------------------------------------------------------------------------------------------
  	@RequestMapping(value="/managerLogin", method = RequestMethod.GET)
  	public String getManagerLogin() throws Exception {
  		return "/manager/managerLogin";
  	}
  	
  	//-------------------------------------------------------------------------------------------------
  	// 로그인 POST
  	//-------------------------------------------------------------------------------------------------
  	@RequestMapping(value="/managerLogin", method = RequestMethod.POST)
  	public String managerLogin(ManagerDTO managerDTO, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
  		
  		HttpSession session = req.getSession();
  		
  		// 넘겨받은 정보를 가지고 Service에게 의뢰한다.
  		ManagerDTO managerLogin = managerservice.managerLogin(managerDTO);
  		
  		// RedirectAttributes : redirect로 리턴하는 코드가 있어야 한다.
  		// Model : jsp페이지를 거쳐갈때는 model로 값을 보내주면 된다.
  		
  		// 해당하는 회원정보가 없다면
  		if(managerLogin == null) {
			session.setAttribute("manager", null);
			rttr.addFlashAttribute("msg", false);
			
			logger.info("ManagerController login post 로그인 되니?? => " + managerLogin);
			return "redirect:/manager/managerLogin";

		} else {
			// 로그인이 정상이라면 세션을 발급한다.
			session.setAttribute("manager", managerLogin);
			return "redirect:/manager/managerHome";
		}
  		
  	} // end String login(MemberDTO memberDTO, HttpServletRequest req, RedirectAttributes rttr)
  	
  	@RequestMapping(value="/managerHome", method = RequestMethod.GET)
  	public String getHome() throws Exception {
  		return "/manager/managerHome";
  	}

    //-------------------------------------------------------------------------------------------------
    // 제품 등록 GET
    //-------------------------------------------------------------------------------------------------
    @RequestMapping(value="/productRegister", method=RequestMethod.GET)
    public void getRegister(Model model) throws Exception {
      
       List<MealkitKindDTO> mealkitKindDTO = managerservice.getKind();
       model.addAttribute("kind", mealkitKindDTO);
       
       logger.info("managerController 제품등록 getRegister => " + mealkitKindDTO);
      
    } // end void getRegister(Model model)
 	
	//-----------------------------------------------------------------------------------------------------------
	// 밀키트 이름 중복 검사
	//-----------------------------------------------------------------------------------------------------------
	@ResponseBody
	@RequestMapping(value="/mkCheck", method=RequestMethod.POST)
	public int mkCheck(MealkitDTO mealkitDTO) throws Exception {
		
		logger.info("ManagerController 밀키트 이름 중복 검사()");
		
		int result = managerservice.mkCheck(mealkitDTO);
		
		logger.info("ManagerController 밀키트 이름 중복 검사() 결과 ==> " + result);
		
		return result;
		
	} // End - public int mkCheck(MealkitDTO mealkitDTO) 
	
	//-------------------------------------------------------------------------------------------------
    // 제품 등록 POST
    // public String productRegister(MealkitDTO mealkitDTO)
    //    ==>   productRegister.jsp 페이지의 input들의 name이 BoardVO에 정의된 이름과 같으면 알아서 boardVO에 들어온다.
    //-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/productRegister", method=RequestMethod.POST)
    public String postRegister(MealkitDTO mealkitDTO, MultipartFile file) throws Exception {
     
    	logger.info("ManageController 제품등록postRegister() POST => " + mealkitDTO);
     
     String imgUploadPath = uploadPath + File.separator + "imgUpload";
     String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
     String fileName = null;

     if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
        // 파일 인푹박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
        logger.info("파일?? " + file);
     fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
     
      // mk_img에 원본 파일 경로 + 파일명 저장
      mealkitDTO.setMk_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
      // mk_thumbIng에 썸네일 파일 경로 + 섬네일 파일명 저장
      mealkitDTO.setMk_thumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
       
     } else { // 첨부된 파일이 없으면
        logger.info("파일 업서?? " + file);
     fileName = File.separator + "imgUpload" + File.separator + "none.png";
      // 미리 준비된 none.png파일을 대신 출력함
      
     mealkitDTO.setMk_img(fileName);
     mealkitDTO.setMk_thumbImg(fileName);
     }
     managerservice.productRegister(mealkitDTO);
     
     return "redirect:/manager/productList";
     
    } // End - public String postRegister(MealkitDTO mealkitDTO)
 	
 	//-------------------------------------------------------------------------------------------------
 	// 밀키트의 목록
 	//-------------------------------------------------------------------------------------------------
 	@RequestMapping(value="/productList", method=RequestMethod.GET)
 	public String productList(Model model, M_Criteria cri) throws Exception {
 		
 		System.out.println("managerController productList() ");
 		logger.info("managerController productList() => ");
 		
 		List<MealkitDTO> productList = null;
 		productList = managerservice.productList(cri); // 작업할 테이블명을 매개변수로 넘겨준다.
 		logger.info("managerController productList()  return Value ==> " + productList);
 		System.out.println("managerController productList()  return Value ==> " + productList);
 		
 		model.addAttribute("productList", managerservice.productList(cri));

		M_PageMaker m_pageMaker = new M_PageMaker();
		m_pageMaker.setM_cri(cri);
		m_pageMaker.setTotalCount(managerservice.listCount());
		
		model.addAttribute("m_pageMaker", m_pageMaker);
 		
		return "manager/productList"; 		
 		
 	}
 	
 	//-------------------------------------------------------------------------------------------------
	// 밀키트 제품 번호에 해당하는 제품의 상세정보를 가져온다.
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/productView", method=RequestMethod.GET)
	public void getView(@RequestParam("mk_id") int mk_id, Model model) throws Exception {
		
		System.out.println("managerController getProductView(mk_id) ==> " + mk_id);
		logger.info("managerController getProductView(mk_id) ==> " + mk_id);
		
		MealkitDTO mealkitDTO = null;
		mealkitDTO = managerservice.productView(mk_id);
		logger.info("managerController return Value ==> " + mealkitDTO);
		
		model.addAttribute("productView", mealkitDTO);
		
	} // End - public void getView(@RequestParam("mk_id") int mk_id, Model model)
	
	   //-------------------------------------------------------------------------------------------------
	   // 제품 번호에 해당하는 게시글의 정보를 수정한다. : GET
	   //-------------------------------------------------------------------------------------------------
	   @RequestMapping(value="/productUpdate", method=RequestMethod.GET)
	    public void getProductUpdate(@RequestParam("mk_id") int mk_id, Model model ) throws Exception {
	      
	      logger.info("managerController getProductUpdate(mk_id) ==> " + mk_id);
	      MealkitDTO mealkitDTO = managerservice.productView(mk_id);
	      logger.info("managerController return Value ==> " + mealkitDTO);
	      
	      
	      model.addAttribute("productView", mealkitDTO);
	      
	      List<MealkitKindDTO> mealkitKindDTO = managerservice.getKind();
	      model.addAttribute("kind", mealkitKindDTO);
	      
	   } // End - public void getUpdate(@RequestParam("mk_id") int mk_id, Model model)
	
	//-------------------------------------------------------------------------------------------------
	// 제품 번호에 해당하는 게시글의 정보를 수정한다. : POST
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/productUpdate", method=RequestMethod.POST)
	public String postProductUpdate(MealkitDTO mealkitDTO, MultipartFile file, HttpServletRequest req) throws Exception {
		
		logger.info("managerController postProductUpdate(MealkitDTO mealkitDTO) ==> " + mealkitDTO);
		
		// 새로운 파일이 등록되었는지 확인
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // 기존 파일을 삭제
		  new File(uploadPath + req.getParameter("mk_img")).delete();
		  new File(uploadPath + req.getParameter("mk_thumbImg")).delete();
		  
		  // 새로 첨부한 파일을 등록
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  mealkitDTO.setMk_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  mealkitDTO.setMk_thumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else { // 새로운 파일이 등록되지 않았다면
		  // 기존 이미지를 그대로 사용
			 mealkitDTO.setMk_img(req.getParameter("mk_img"));
			 mealkitDTO.setMk_thumbImg(req.getParameter("mk_thumbImg"));
		
		 }
		
		managerservice.productUpdate(mealkitDTO);
		
		return "redirect:/manager/productList";
		
	} // End - public String postProductUpdate(MealkitDTO mealkitDTO)

	//-------------------------------------------------------------------------------------------------
	// 제품 번호에 해당하는 게시글의 정보를 삭제한다. : GET
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/productDelete", method=RequestMethod.GET)
	public void getProductDelete(@RequestParam("mk_id") int mk_id, Model model) throws Exception {
		
		logger.info("managerController getProductDelete(mk_id) ==> " + mk_id);
		MealkitDTO mealkitDTO = null;
		mealkitDTO = managerservice.productView(mk_id);
		
		model.addAttribute("productView", mealkitDTO);
		
	} // End - public void getProductDelete(@RequestParam("mk_id") int mk_id, Model model)

	//-------------------------------------------------------------------------------------------------
	// 제품 번호에 해당하는 게시글의 정보를 삭제한다. : POST
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/productDelete", method=RequestMethod.POST)
	public String postProductDelete(MealkitDTO mealkitDTO) throws Exception {
		
		
		String fileUrl ="/resources/imgUpload////";
		String filePath = fileUrl = "/" + mealkitDTO.getMk_img();
		File file = new File(filePath);
		if(file.exists()) {
			file.delete();
		}
		
		
		logger.info("managerController postProductDelete(MealkitDTO mealkitDTO) ==> " + mealkitDTO);
		managerservice.productDelete(mealkitDTO.getMk_id());
		
		// /WEB-INF/views + /board/list + .jsp
		return "redirect:/manager/productList";
		
		
	} // End - public String postProductDelete(MealkitDTO mealkitDTO)
	
   //-------------------------------------------------------------------------------------------------
   // 주문 받은 밀키트 목록
   //-------------------------------------------------------------------------------------------------
   @RequestMapping(value="/orderList", method=RequestMethod.GET)
   public String orderList(Model model, M_Criteria cri) throws Exception {
         
      logger.info("managerController orderList() => ");
         
      List<BuyDTO> orderList = null;
      // BuyDTO buyDTO = new BuyDTO();
      orderList = managerservice.orderList(cri); // 작업할 테이블명을 매개변수로 넘겨준다.
      logger.info("managerController orderList()  return Value ==> " + orderList);
	         
      model.addAttribute("orderList", managerservice.orderList(cri));
	   
      M_PageMaker m_pageMaker = new M_PageMaker();
      m_pageMaker.setM_cri(cri);
      m_pageMaker.setTotalCount(managerservice.orderListCount());
	      
      model.addAttribute("m_pageMaker", m_pageMaker);
      logger.info("매니저 컨트롤러 페이징 되는거야?" + cri);
	      
      return "manager/orderList"; 
	      
	      
   } // End- public String orderList(Model model, m_Criteria cri)
 	//-------------------------------------------------------------------------------------------------
	// 주문 상세정보를 가져온다.
	//-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/orderView", method=RequestMethod.GET)
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
		model.addAttribute("mBuy", buyDTO);
		
		//-------------------------------------------------------------------------------------------------
		// 장바구니 총 가격을 찾는 메서드
		//-------------------------------------------------------------------------------------------------
		int allMoney = managerservice.sumBuy(order_id);
		model.addAttribute("allMoney", allMoney);
		
	} 
	
	//-------------------------------------------------------------------------------------------------
	//매니저가 회원목록을 조회한다
	//-------------------------------------------------------------------------------------------------
	@RequestMapping("/memberListView")
	public String memberListView(Model model) throws Exception{
			 
	List<MemberDTO> memberdto = managerservice.memberListView();
			
	model.addAttribute("memberdto", memberdto);
			
	return "/manager/memberListView";
	} // End -public String memberListView(Model model)
	
	//-------------------------------------------------------------------------------------------------
	//매니저가 회원목록을 수정하는페이지로 이동한다
	//-------------------------------------------------------------------------------------------------
	@RequestMapping("/memberUpdateForm")
	public String memberListUpdate(Model model, @RequestParam String id) throws Exception{
		logger.info("넘어온=>"+id);
		model.addAttribute("id", id);
		//model.addAttribute("memberdto", memberdto);
			
		return "/manager/memberUpdateForm";
	} // End -public String memberUpdateForm(Model model,MemberDTO memberdto)
 	
	//-------------------------------------------------------------------------------------------------
	//매니저가 회원목록을 수정한다
	//-------------------------------------------------------------------------------------------------
	@RequestMapping("/memberUpdate")
	public String memberUpdateForm(MemberDTO memberdto) throws Exception {
		managerservice.memberUpdate(memberdto);
		logger.info("멤버디티오의 값=>"+memberdto);
		return "redirect:/manager/memberListView";
	}
		
		 
	//------------------------------------------------------ 
	//매니저가 회원정보를 삭제한다
	//------------------------------------------------------
    @ResponseBody
    @RequestMapping("/memberDelete")
	public String memberDelete(String id) throws Exception{
    	managerservice.memberDelete(id);
    	return "redirect:/manager/memberListView"; //jsp로이동
    	//"redirect:manager/memberDeleteForm" 이것두댐
	}
    
    //-------------------------------------------------------------------------------------------------
    // 주문 상세 정보 => 상태 변경
    //-------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/orderView", method = RequestMethod.POST)
    public String delivery(BuyDTO buyDTO, String order_id) throws Exception {
       logger.info("주문 상세 정보 => 상태 변경 " + buyDTO.getDelivery());
       logger.info("주문 상세 정보 => 상태 변경 주문번호 " + buyDTO.getOrder_id());
       
       managerservice.delivery(buyDTO);
       
       //-------------------------------------------------------------------------------------------------
       // 밀키트 재고 수량 조절
       //-------------------------------------------------------------------------------------------------
       logger.info("밀키트 재고 수량 조절 되나요??? " + buyDTO.getDelivery());
          

       List<BuyDTO> orderView = managerservice.orderView(order_id); 

       MealkitDTO mealkitDTO = new MealkitDTO();
       if((buyDTO.getDelivery()).equals("입금 확인")) {
          
          for(BuyDTO i : orderView) {
             mealkitDTO.setMk_id(i.getMk_id());
             logger.info("i.getMk_id()" + i.getMk_id());
             mealkitDTO.setMk_count(i.getBuy_count());
             logger.info("i.getBuy_count()" + i.getBuy_count());
             managerservice.changeCount(mealkitDTO);
          }
          
       }
       

       
       // return "/manager/orderView?order_id=" + buyDTO.getOrder_id();
       // return "/manager/orderList";
        return "redirect:/manager/orderView?order_id=" + buyDTO.getOrder_id();
    }
  	
  	
} 
    