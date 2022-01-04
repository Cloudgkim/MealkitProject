package com.edu.mealkit.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.edu.mealkit.dto.MealkitDTO;
import com.edu.mealkit.dto.MealkitKindDTO;
import com.edu.mealkit.dto.MemberDTO;
import com.edu.mealkit.dto.SearchCriteria;
import com.edu.mealkit.dto.M_Criteria;
import com.edu.mealkit.dto.BuyDTO;
import com.edu.mealkit.dto.ManagerDTO;

@Repository
public class ManagerDAOImpl implements ManagerDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MealkitDAOImpl.class);

	@Inject
	SqlSession sqlSession;
	
	private static final String namespace = "com.edu.mealkit.mapper.managerMapper";
	
	@Override
	public ManagerDTO managerLogin(ManagerDTO managerDTO) throws Exception {
		logger.info("로그인 : " + managerDTO);
		return sqlSession.selectOne(namespace + ".managerLogin", managerDTO);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 밀키트 이름 중복 검사
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int mkCheck(MealkitDTO mealkitDTO) throws Exception {
		
		logger.info("ManagerDAOImpl 밀키트 이름 중복 검사()");
		return sqlSession.selectOne(namespace + ".mkCheck", mealkitDTO);
		
	}	

	//-----------------------------------------------------------------------------------------------------------
	// 제품 등록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void productRegister(MealkitDTO mealkitDTO) throws Exception {

		logger.info("managerDAOImpl register() => " + mealkitDTO);
		sqlSession.insert(namespace + ".register", mealkitDTO);

	} // End - public void productRegister(MealkitDTO mealkitDTO)

	//-----------------------------------------------------------------------------------------------------------
	// 제품 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<MealkitDTO> productList(M_Criteria cri) throws Exception {

		logger.info("managerDAOImpl productList() => ");
		return sqlSession.selectList(namespace + ".productlist", cri);
		
	} 
	
	//-------------------------------------------------------------------------------------------------
	// 제품 총 개수
	//-------------------------------------------------------------------------------------------------
	@Override
	public int listCount() throws Exception {
		return sqlSession.selectOne(namespace + ".productlistCount");
	}
	
	//-------------------------------------------------------------------------------------------------
	// 구매 제품 총 개수
	//-------------------------------------------------------------------------------------------------
	@Override
	public int orderListCount() throws Exception {
		logger.info("매니저 디에이오 페이징 되는거야?");
		return sqlSession.selectOne(namespace + ".orderListCount");
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 밀키트 제품 번호에 해당하는 게시글의 상세정보를 가져온다.
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public MealkitDTO productView(int mk_id) throws Exception {

		logger.info("managerDAOImpl productView(mk_id) => " + mk_id);
		return sqlSession.selectOne(namespace + ".productview", mk_id);
		
	} // End - public MealkitDTO productView(int mk_id)

	//-------------------------------------------------------------------------------------------------
	// 제품 번호에 해당하는 게시글의 내용을 수정한다.
	//-------------------------------------------------------------------------------------------------
	@Override
	public void productUpdate(MealkitDTO mealkitDTO) throws Exception {

		logger.info("managerDAOImpl productUpdate(MealkitDTO mealkitDTO) => " + mealkitDTO);
		sqlSession.update(namespace + ".productupdate", mealkitDTO);
		
	} // End - public void productUpdate(MealkitDTO mealkitDTO)

	//-------------------------------------------------------------------------------------------------
	// 게시글 번호에 해당하는 게시글의 정보를 삭제한다. : POST
	//-------------------------------------------------------------------------------------------------
	@Override
	public void productDelete(int mk_id) throws Exception {

		logger.info("managerDAOImpl productDelete(int mk_id) => " + mk_id);
		sqlSession.delete(namespace + ".productdelete", mk_id);
		
	} // End - public void productDelete(int mk_id) throws Exception
	
	//-----------------------------------------------------------------------------------------------------------
	// 주문 받은 밀키트 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<BuyDTO> orderList(M_Criteria cri) throws Exception {

		logger.info("managerDAOImpl orderList() => ");
		return sqlSession.selectList(namespace + ".orderlist", cri);
		
	} 
	
 	//-------------------------------------------------------------------------------------------------
	// 주문 상세정보를 가져온다.
	//-------------------------------------------------------------------------------------------------
	public List<BuyDTO> orderView(String order_id) throws Exception {

	logger.info("managerDAOImple 주문 상세정보 가져오기 => orderView(String order_id)" + order_id);
	return sqlSession.selectList(namespace + ".orderView", order_id);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 총 가격 찾기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int sumBuy(String order_id) throws Exception {
		return sqlSession.selectOne(namespace + ".sumBuy", order_id);
		
	} 
	
    //--------------------------------------------------
	//kind_name에따른 제품가져오기
	//-----------------------------------------------------
	public MealkitKindDTO getKind(String kind_name) throws Exception {
	
	return sqlSession.selectOne(namespace+".getKind",kind_name);
	
	}

	//-------------------------------------------------------------------------------------------------
	// 배송 상태 변경
	//-------------------------------------------------------------------------------------------------
	public void delivery(BuyDTO buyDTO) throws Exception {
		logger.info("managerDAOImpl 배송상태변경 되야지~~ " + buyDTO.getDelivery() + buyDTO.getOrder_id());
		sqlSession.update(namespace + ".delivery", buyDTO);
	}

	//-------------------------------------------------------------------------------------------------
	//매니저가 회원목록을 조회한다
	//-------------------------------------------------------------------------------------------------
	@Override
	public List<MemberDTO> memberListView() throws Exception{
		return sqlSession.selectList(namespace+".memberListView");
	}
	
	//-------------------------------------------------------------------------------------------------
	//매니저가 특정한 회원정보를 수정 한다
	//-------------------------------------------------------------------------------------------------
	@Override
	public void memberUpdate(MemberDTO memberDTO) throws Exception{
		 
		 sqlSession.update(namespace+ ".memberUpdate",memberDTO);
	}
	//-------------------------------------------------------------------------------------------------
	//매니저가 특정한 회원을 삭제한다
	//-------------------------------------------------------------------------------------------------
	@Override
	public void memberDelete(String id) throws Exception{
		
		 sqlSession.delete(namespace+".memberDelete",id);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 제품 종류 가져오기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<MealkitKindDTO> getKind() throws Exception {
		return sqlSession.selectList(namespace + ".kind");
		
	} // end List<MealkitKindDTO> getKind()
	
	//-----------------------------------------------------------------------------------------------------------
	// 제품 종류 가져오기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<MealkitKindDTO> getSearchKind(SearchCriteria scri) throws Exception {
		return sqlSession.selectList(namespace + ".searchkind", scri);
		
	} // end List<MealkitKindDTO> getSearchKind(SearchCriteria scri)
	
	//-------------------------------------------------------------------------------------------------
	// 밀키트 재고 수량 조절
	//-------------------------------------------------------------------------------------------------
	public void changeCount(MealkitDTO mealkitDTO) throws Exception {
		 
		sqlSession.update(namespace+".changeCount", mealkitDTO);
	}
	
}
