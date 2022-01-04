package com.edu.mealkit.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.edu.mealkit.dao.ManagerDAO;
import com.edu.mealkit.dto.MealkitDTO;
import com.edu.mealkit.dto.MealkitKindDTO;
import com.edu.mealkit.dto.MemberDTO;
import com.edu.mealkit.dto.SearchCriteria;
import com.edu.mealkit.dto.M_Criteria;
import com.edu.mealkit.dto.BuyDTO;
import com.edu.mealkit.dto.ManagerDTO;

@Service
public class ManagerServiceImpl implements ManagerService {

	private static final Logger logger = LoggerFactory.getLogger(ManagerServiceImpl.class);
	
	@Inject
	ManagerDAO managerDAO;
	
	//-------------------------------------------------------------------------------------------------
	// 로그인
	//-------------------------------------------------------------------------------------------------
	@Override
	public ManagerDTO managerLogin(ManagerDTO managerDTO) throws Exception {
		logger.info("Manager login~~~~~~~~~~"+managerDTO);
		return managerDAO.managerLogin(managerDTO);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 밀키트 이름 중복 검사
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int mkCheck(MealkitDTO mealkitDTO) throws Exception {
		
		logger.info("ManagerServieImpl 밀키트 이름 중복 검사()");
		int result = managerDAO.mkCheck(mealkitDTO);
		return result;
		
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 제품 등록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void productRegister(MealkitDTO mealkitDTO) throws Exception {

		logger.info("managerServiceImple Register() => " + mealkitDTO);
		managerDAO.productRegister(mealkitDTO);

	} // End - public void write(BoardVO boardVO)

	//-----------------------------------------------------------------------------------------------------------
	// 제품 종류 가져오기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<MealkitKindDTO> getKind() throws Exception {
		return managerDAO.getKind();
		
	} // end List<MealkitKindDTO> getKind()
	
	//-----------------------------------------------------------------------------------------------------------
	// 서치한 제품 종류 가져오기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<MealkitKindDTO> getSearchKind(SearchCriteria scri) throws Exception {
		return managerDAO.getSearchKind(scri);
		
	} // end List<MealkitKindDTO> getSearchKind(SearchCriteria scri)
	
	//-----------------------------------------------------------------------------------------------------------
	// 제품 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<MealkitDTO> productList(M_Criteria cri) throws Exception {

		logger.info("managerServiceImple productList() => ");
		return managerDAO.productList(cri);
		
	} // End - public List<MealkitDTO> productList()

	//-------------------------------------------------------------------------------------------------
	// 제품 총 개수
	//-------------------------------------------------------------------------------------------------
	@Override
	public int listCount() throws Exception {
		return managerDAO.listCount();
	}
	
	//-------------------------------------------------------------------------------------------------
	// 구매 제품 총 개수
	//-------------------------------------------------------------------------------------------------
	@Override
	public int orderListCount() throws Exception {
		logger.info("매니저 서비스 페이징 되는거야?");
		return managerDAO.orderListCount();
	}
	
	//-------------------------------------------------------------------------------------------------
	// 밀키트 제품 번호에 해당하는 게시글의 상세정보를 가져온다.
	//-------------------------------------------------------------------------------------------------
	@Override
	public MealkitDTO productView(int mk_id) throws Exception {

		logger.info("managerServiceImple productView() => ");
		return managerDAO.productView(mk_id);
		
	} // End - public MealkitDTO productView(int mk_id)

	//-------------------------------------------------------------------------------------------------
	// 제품 번호에 해당하는 게시글의 내용을 수정한다.
	//-------------------------------------------------------------------------------------------------
	@Override
	public void productUpdate(MealkitDTO mealkitDTO) throws Exception {

		logger.info("managerServiceImpl productUpdate(MealkitDTO mealkitDTO)  ==> " + mealkitDTO);
    	managerDAO.productUpdate(mealkitDTO);
		
	} // End - public void productUpdate(MealkitDTO mealkitDTO)

	//-------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 게시글의 정보를 삭제한다. : POST
	//-------------------------------------------------------------------------------------------------
	@Override
	public void productDelete(int mk_id) throws Exception {

		logger.info("managerServiceImpl productDelete(int mk_id) ==> " + mk_id);
		managerDAO.productDelete(mk_id);
		
	} // End - public void productDelete(int mk_id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 주문 받은 밀키트 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<BuyDTO> orderList(M_Criteria cri) throws Exception {

		logger.info("managerServiceImple orderList() => ");
		return managerDAO.orderList(cri);
		
	} // End - public List<MealkitDTO> productList()
	
 	//-------------------------------------------------------------------------------------------------
	// 주문 상세정보를 가져온다.
	//-------------------------------------------------------------------------------------------------
	public List<BuyDTO> orderView(String order_id) throws Exception {

	logger.info("managerServiceImple 주문상세정보보기 => orderView(String order_id) " + order_id);
	return managerDAO.orderView(order_id);
	
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 총 가격 찾기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int sumBuy(String order_id) throws Exception {
		return managerDAO.sumBuy(order_id);
		
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// kind_namd에 따른제품 종류 가져오기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public MealkitKindDTO getKind(String kind_name) throws Exception {
			
		return managerDAO.getKind(kind_name);
	}
	
	//-------------------------------------------------------------------------------------------------
	// 배송 상태 변경
	//-------------------------------------------------------------------------------------------------
	public void delivery(BuyDTO buyDTO) throws Exception {
		logger.info("managerServiceImpl 배송상태변경 되야지~~ " + buyDTO.getDelivery() + buyDTO.getOrder_id());
		managerDAO.delivery(buyDTO);
	}

	//-------------------------------------------------------------------------------------------------
	//매니저가 회원목록을 조회한다
	//-------------------------------------------------------------------------------------------------
	@Override
	public List<MemberDTO> memberListView() throws Exception {
	  return managerDAO.memberListView();
	}
		
		  
	//-------------------------------------------------------------------------------------------------
	//매니저가 특정한 회원정보를 수정한다
	//-------------------------------------------------------------------------------------------------
	@Override
	public void memberUpdate(MemberDTO memberDTO) throws Exception {
	   managerDAO.memberUpdate(memberDTO);
	}
	
	//-------------------------------------------------------------------------------------------------
	//매니저가 특정한 회원을 삭제한다
	//-------------------------------------------------------------------------------------------------
	@Override
	public void memberDelete(String id) throws Exception{
		managerDAO.memberDelete(id);
	}
	
	//-------------------------------------------------------------------------------------------------
	// 밀키트 재고 수량 조절
	//-------------------------------------------------------------------------------------------------
	public void changeCount(MealkitDTO mealkitDTO) throws Exception {
		managerDAO.changeCount(mealkitDTO);
	}
}
