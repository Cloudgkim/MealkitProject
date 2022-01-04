package com.edu.mealkit.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.edu.mealkit.dto.BuyDTO;
import com.edu.mealkit.dto.CartDTO;
import com.edu.mealkit.dto.Criteria;
import com.edu.mealkit.dto.MealkitDTO;
import com.edu.mealkit.dto.MemberDTO;
import com.edu.mealkit.dto.RV_Criteria;
import com.edu.mealkit.dto.ReviewVO;
import com.edu.mealkit.dto.SearchCriteria;
import com.edu.mealkit.dto.ZzimDTO;

@Repository
public class ShopDAOImpl implements ShopDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ShopDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String nameSpace = "com.edu.mealkit.mapper.shopMapper";
	
	//-----------------------------------------------------------------------------------------------------------
	// 반찬 상세보기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public MealkitDTO getGoodsView(int mk_id) throws Exception {
		MealkitDTO mealkitDTO = sqlSession.selectOne(nameSpace + ".getGoodsView", mk_id);
		return mealkitDTO;
		
	} // end MealkitDTO getGoodsView(int mk_id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 개수 세기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int getCartCnt(String id) throws Exception {
		return sqlSession.selectOne(nameSpace + ".getCartCnt", id);
		
	} // end int getCartCnt(String id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니에 담기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void getCarts(CartDTO cartDTO) throws Exception {
		sqlSession.insert(nameSpace + ".getCarts", cartDTO);
		
	} // end void getCarts(CartDTO cartDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 업데이트 하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int goUpdate(CartDTO cartDTO) throws Exception {
		return sqlSession.update(nameSpace + ".goUpdate", cartDTO);
		
	} // end int goUpdate(CartDTO cartDTO)

	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 보기
	//-----------------------------------------------------------------------------------------------------------
//	@Override
//	public List<MealkitDTO> goodslist(SearchCriteria scri) throws Exception{
//		return sqlSession.selectList(nameSpace + ".listPage", scri);
//		
//	} // end List<MealkitDTO> goodslist(SearchCriteria scri)
		
	//-----------------------------------------------------------------------------------------------------------
	// 페이징처리 목록 조회
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return sqlSession.selectOne(nameSpace + ".listCount", scri);
		
	} // end int listCount(SearchCriteria scri)
	
	//-----------------------------------------------------------------------------------------------------------
	// 페이징처리 총 개수
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<CartDTO> showCarts(CartDTO cartDTO) throws Exception {
		return sqlSession.selectList(nameSpace + ".showCarts", cartDTO);
		
	} // end List<CartDTO> showCarts(CartDTO cartDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 총 가격 찾기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int sumCart(String id) throws Exception {
		return sqlSession.selectOne(nameSpace + ".sumCart", id);
		
	} // end int sumCart(String id)
	
	//-----------------------------------------------------------------------------------------------------------
	// buy테이블에 상품들 담기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void insertPay(BuyDTO buyDTO) throws Exception {
		sqlSession.insert(nameSpace + ".insertPay", buyDTO);
		
	} // end void insertPay(BuyDTO buyDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 모두 삭제
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void allDelete(String id) throws Exception {
		sqlSession.delete(nameSpace + ".allDelete", id);
		
	} // end void allDelete(String id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 구매한 상품 모두 찾기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<BuyDTO> getBuys(String id) throws Exception {
		return sqlSession.selectList(nameSpace + ".getBuys", id);
		
	} // end List<BuyDTO> getBuys(String id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 선택 삭제
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void delete(String cart_id) throws Exception{
		sqlSession.delete(nameSpace + ".delete",cart_id);
		
	} // end void delete(String cart_id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 찜한상품 갯수세기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int getZzimCnt(String id) throws Exception{
		return sqlSession.selectOne(nameSpace+".getZzimCnt",id);
		
	} // end int getZzimCnt(String id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 찜한상품에 상품보여주는 메소드
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<ZzimDTO> showZzims(ZzimDTO zzimDTO) throws Exception{
		return sqlSession.selectList(nameSpace+".showZzims",zzimDTO);
		
	} // end List<ZzimDTO> showZzims(ZzimDTO zzimDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 찜한상품에 담기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void getZzims(ZzimDTO zzimDTO) throws Exception{
		sqlSession.insert(nameSpace+".getZzims",zzimDTO);
		
	} // end void getZzims(ZzimDTO zzimDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 상품 확인(동일한 상품 레코드 확인)
	//-----------------------------------------------------------------------------------------------------------
	@Override		
	public int countCarts(CartDTO cartDTO) throws Exception {
		return sqlSession.selectOne(nameSpace + ".countCarts", cartDTO);
		
	} // end int countCarts(CartDTO cartDTO)
		
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 상품 수량 변경(동일한 상품일 경우)
	//-----------------------------------------------------------------------------------------------------------
	@Override		
	public void updateCarts(CartDTO cartDTO) throws Exception {
		sqlSession.update(nameSpace + ".updateCarts", cartDTO);
		
	} // end void updateCarts(CartDTO cartDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 선택 삭제 -- 찜에서
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void zzDelete(String zzim_id) throws Exception{
		sqlSession.delete(nameSpace + ".zzDelete", zzim_id);
		
	} // end void zzDelete(String zzim_id)

	//-----------------------------------------------------------------------------------------------------------
	//찜여부체크
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public boolean zzimCheck(int mk_id) {
		boolean result =false;
	
		int count = sqlSession.selectOne(nameSpace+".zzimCheck",mk_id);
		 if(count == 1) { //값이있었으면 1이겠지 select해왓으니까
			 result = true;
		 }
		 return result;
	}	

	//-------------------------------------------
	//kind_name별 목록 조회
	@Override
	public List<MealkitDTO> goodslist(String kind_name) throws Exception{
		 return sqlSession.selectList(nameSpace+".goodslist",kind_name);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 찜한 상품 중 선택한 것만 장바구니 담기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int zzimGo(int zzim_id) throws Exception {
		return sqlSession.insert(nameSpace + ".zzimGo", zzim_id);
		
	} // end int zzimGo(String zzim_id)

	//-----------------------------------------------------------------------------------------------------------
	// 장바구니에서 선택 주문하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public CartDTO choiceBuy(CartDTO cartDTO) throws Exception {
		return sqlSession.selectOne(nameSpace + ".choiceBuy", cartDTO);
		
	} // end List<CartDTO> choiceBuy(CartDTO cartDTO)

	//-----------------------------------------------------------------------------------------------------------
	// 장바구니에서 선택한 거 총 가격 찾기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int sumChoice(int num) throws Exception {
		return sqlSession.selectOne(nameSpace + ".sumChoice", num);
			
	} // end int sumChoice(int num)

	//-----------------------------------------------------------------------------------------------------------
	// buy테이블에 선택한 상품들 담기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void insertChoicePay(BuyDTO buyDTO) throws Exception {
		sqlSession.insert(nameSpace + ".insertChoicePay", buyDTO);
			
	} // end void insertPay(BuyDTO buyDTO)

	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 선택한 거 삭제
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void choiceDelete(CartDTO cartDTO) throws Exception {
		sqlSession.delete(nameSpace + ".choiceDelete", cartDTO);
			
	} // end void choiceDelete(CartDTO cartDTO)
	
	//-------------------------------------------------------------------------------------------------
	// 리뷰목록
	//-------------------------------------------------------------------------------------------------
	@Override
	public List<ReviewVO> readReview(int r_mkno) throws Exception {
		return sqlSession.selectList(nameSpace + ".readReview", r_mkno);
	}
	
	//-------------------------------------------------------------------------------------------------
	// 리뷰쓰기
	//-------------------------------------------------------------------------------------------------
	@Override
	public void writeReview(ReviewVO reviewVO) throws Exception{
		sqlSession.insert(nameSpace + ".writeReview", reviewVO);
	}
	
	//-------------------------------------------------------------------------------------------------
	// 리뷰삭제
	//-------------------------------------------------------------------------------------------------
	@Override
	public int deleteReview(int r_no) {
		return sqlSession.delete(nameSpace + ".deleteReview", r_no);
	}
	
	//-------------------------------------------------------------------------------------------------
	// 리뷰 작성 제약
	//-------------------------------------------------------------------------------------------------
	@Override
	public int RJJ(BuyDTO buyDTO) {
		return sqlSession.selectOne(nameSpace + ".RJJ", buyDTO);
	}

	//-----------------------------------------------------------------------------------------------------------
	// 종류대로 뿌려주기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<MealkitDTO> allMeals() throws Exception {
		return sqlSession.selectList(nameSpace + ".allMeals");
		
	} // end List<MealkitDTO> allMeals()

	//-----------------------------------------------------------------------------------------------------------
	// 서치한 거 뿌려주기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<MealkitDTO> searchMeals(SearchCriteria scri) throws Exception {
		return sqlSession.selectList(nameSpace + ".searchMeals", scri);
		
	} // end List<MealkitDTO> searchMeals(SearchCriteria scri)

	//-----------------------------------------------------------------------------------------------------------
	// 리뷰 본인 확인
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public String findResult(int r_no) {
		return sqlSession.selectOne(nameSpace + ".findResult", r_no);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	//재고수량 가져오기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public MealkitDTO productMkCount(int mk_id) throws Exception {
		return sqlSession.selectOne(nameSpace+".productMkCount",mk_id);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	//모든 리뷰 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<ReviewVO> allReviewList(RV_Criteria cri){
		return sqlSession.selectList(nameSpace + ".allReviewList", cri);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	//리뷰 페이징
	//-----------------------------------------------------------------------------------------------------------	
	@Override
	public int reviewCount() throws Exception{
		return sqlSession.selectOne(nameSpace + ".reviewCount");
	}

	//-----------------------------------------------------------------------------------------------------------
	// 재고수량 초과 금지
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int getBuy_count(int cnt, int mk_id) throws Exception {
		Map<String, Object> map =  new HashMap<String, Object>(); 
		map.put("mk_id", mk_id);
		map.put("cnt", cnt);
		logger.info("디에오~" + map);
		return sqlSession.selectOne(nameSpace+".getBuy_count", map);
		
	 } // end int getBuy_count(int cnt)

	
} // end class ShopDAOImpl implements ShopDAO
