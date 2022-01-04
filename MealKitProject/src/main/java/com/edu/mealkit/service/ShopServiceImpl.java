package com.edu.mealkit.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.edu.mealkit.dao.ShopDAO;
import com.edu.mealkit.dto.BuyDTO;
import com.edu.mealkit.dto.CartDTO;
import com.edu.mealkit.dto.Criteria;
import com.edu.mealkit.dto.MealkitDTO;
import com.edu.mealkit.dto.MemberDTO;
import com.edu.mealkit.dto.RV_Criteria;
import com.edu.mealkit.dto.ReviewVO;
import com.edu.mealkit.dto.SearchCriteria;
import com.edu.mealkit.dto.ZzimDTO;

@Service
public class ShopServiceImpl implements ShopService {
	
private static final Logger logger = LoggerFactory.getLogger(ShopServiceImpl.class);
	
	@Inject
	private ShopDAO shopDAO;
	
	//-----------------------------------------------------------------------------------------------------------
	// 반찬 상세보기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public MealkitDTO getGoodsView(int mk_id) throws Exception {
		MealkitDTO mealkitDTO = shopDAO.getGoodsView(mk_id);
		return mealkitDTO;
		
	} // end MealkitDTO getGoodsView(int mk_id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 개수 세기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int getCartCnt(String id) throws Exception {
		return shopDAO.getCartCnt(id);
		
	} // end int getCartCnt(String id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니에 담기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void getCarts(CartDTO cartDTO) throws Exception {
		shopDAO.getCarts(cartDTO);
		
	} // end void getCarts(CartDTO cartDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 페이징처리 목록 조회
	//-----------------------------------------------------------------------------------------------------------
//	@Override
//	public List<MealkitDTO> goodslist(SearchCriteria scri) throws Exception{
//		return shopDAO.goodslist(scri);
//		
//	} // end List<MealkitDTO> goodslist(SearchCriteria scri)
	
	//-----------------------------------------------------------------------------------------------------------
	// 페이징처리 총 개수
	//-----------------------------------------------------------------------------------------------------------
	public int listCount(SearchCriteria scri) throws Exception{
		return shopDAO.listCount(scri);
		
	} // end int listCount()
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 업데이트 하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int goUpdate(CartDTO cartDTO) throws Exception {
		return shopDAO.goUpdate(cartDTO);
		
	} // end int goUpdate(CartDTO cartDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 상품 찾기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<CartDTO> showCarts(CartDTO cartDTO) throws Exception {
		return shopDAO.showCarts(cartDTO);
		
	} // end List<CartDTO> showCarts(CartDTO cartDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 총 가격 찾기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int sumCart(String id) throws Exception {
		return shopDAO.sumCart(id);
		
	} // end int sumCart(String id)
	
	//-----------------------------------------------------------------------------------------------------------
	// buy테이블에 상품들 담기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void insertPay(BuyDTO buyDTO) throws Exception {
		shopDAO.insertPay(buyDTO);
		
	} // end void insertPay(BuyDTO buyDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 모두 삭제
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void allDelete(String id) throws Exception {
		shopDAO.allDelete(id);
		
	} // end void allDelete(String id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 구매한 상품 모두 찾기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<BuyDTO> getBuys(String id) throws Exception {
		return shopDAO.getBuys(id);
		
	} // end List<BuyDTO> getBuys(String id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 선택 삭제
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void delete(String cart_id) throws Exception {
		shopDAO.delete(cart_id);
		
	} // end void delete(String cart_id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 찜한목록 개수 세기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int getZzimCnt(String id) throws Exception {
		return shopDAO.getZzimCnt(id);
			
	} // end int getZzimCnt(String id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 찜한상품에 담기 
	//-----------------------------------------------------------------------------------------------------------
	public void getZzims(ZzimDTO zzimDTO) throws Exception {
		  shopDAO.getZzims(zzimDTO);
		  
	} // end void getZzims(ZzimDTO zzimDTO)

	//-----------------------------------------------------------------------------------------------------------
	// 찜한상품에 상품보여주는 메소드
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<ZzimDTO> showZzims(ZzimDTO zzimDTO) throws Exception{
	    return shopDAO.showZzims(zzimDTO);
	    
	} // end List<ZzimDTO> showZzims(ZzimDTO zzimDTO)

	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 상품 확인
	//-----------------------------------------------------------------------------------------------------------
	@Override		
	public int countCarts(CartDTO cartDTO) throws Exception {
		return shopDAO.countCarts(cartDTO);
		
	} // end int countCarts(CartDTO cartDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 중복 상품 수량 변경
	//-----------------------------------------------------------------------------------------------------------
	@Override		
	public void updateCarts(CartDTO cartDTO) throws Exception {
		shopDAO.updateCarts(cartDTO);
		
	} // end void updateCarts(CartDTO cartDTO)
	
	//-----------------------------------------------------------------------------------------------------------
	// 선택 삭제 -- 찜에서
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void zzDelete(String zzim_id) throws Exception {
		shopDAO.zzDelete(zzim_id);
		
	} // end void zzDelete(String zzim_id)
	
	//-----------------------------------------------------------------------------------------------------------
	// 찜여부체크
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public boolean zzimCheck(int mk_id) {
		
	   return shopDAO.zzimCheck(mk_id);
	}
	
    //------------------------------------------------------------
	// kind_name별 목록 조회
	//------------------------------------------------------------
	@Override
	public List<MealkitDTO> goodslist(String kind_name) throws Exception {
		return shopDAO.goodslist(kind_name);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 찜한 상품 중 선택한 것만 장바구니 담기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int zzimGo(int zzim_id) throws Exception {
		return shopDAO.zzimGo(zzim_id);
		
	} // end int zzimGo(String zzim_id)

	//-----------------------------------------------------------------------------------------------------------
	// 장바구니에서 선택 주문하기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public CartDTO choiceBuy(CartDTO cartDTO) throws Exception {
		return shopDAO.choiceBuy(cartDTO);
		
	} // end List<CartDTO> choiceBuy(CartDTO cartDTO)

	//-----------------------------------------------------------------------------------------------------------
	// 장바구니에서 선택한 총 가격 찾기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int sumChoice(int num) throws Exception {
		return shopDAO.sumChoice(num);
		
	} // end int sumChoice(int num)

	//-----------------------------------------------------------------------------------------------------------
	// buy테이블에 선택한 상품들 담기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void insertChoicePay(BuyDTO buyDTO) throws Exception {
		shopDAO.insertChoicePay(buyDTO);
		
	} // end void insertPay(BuyDTO buyDTO)

	//-----------------------------------------------------------------------------------------------------------
	// 장바구니 선택한 거 삭제
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public void choiceDelete(CartDTO cartDTO) throws Exception {
		shopDAO.choiceDelete(cartDTO);
		
	} // end void choiceDelete(CartDTO cartDTO)


	//-------------------------------------------------------------------------------------------------
	// 리뷰목록
	//-------------------------------------------------------------------------------------------------
	@Override
	public List<ReviewVO> readReview(int r_mkno) throws Exception {
		return shopDAO.readReview(r_mkno);
	}
	
	//-------------------------------------------------------------------------------------------------
	// 리뷰쓰기
	//-------------------------------------------------------------------------------------------------
	@Override
	public void writeReview(ReviewVO reviewVO) throws Exception{
		shopDAO.writeReview(reviewVO);
	}
	
	//-------------------------------------------------------------------------------------------------
	// 리뷰삭제
	//-------------------------------------------------------------------------------------------------
	@Override
	public int deleteReview(int r_no) throws Exception {
		 return shopDAO.deleteReview(r_no); 
	}
	
	//-------------------------------------------------------------------------------------------------
	// 리뷰 작성 제약
	//-------------------------------------------------------------------------------------------------
	@Override
	public int RJJ(BuyDTO buyDTO) {
		return shopDAO.RJJ(buyDTO);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 리뷰 본인 확인
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public String findResult(int r_no) {
		return shopDAO.findResult(r_no);
	}
	
	//-----------------------------------------------------------------------------------------------------------
	//재고수량 가져오기
	//-----------------------------------------------------------------------------------------------------------
    @Override
	public MealkitDTO productMkCount(int mk_id) throws Exception {
	   return shopDAO.productMkCount(mk_id);
				
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 목록대로 뿌려주기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<MealkitDTO> allMeals() throws Exception {
		return shopDAO.allMeals();
		
	} // end List<MealkitDTO> allMeals()
	
	//-----------------------------------------------------------------------------------------------------------
	// 서치한 거 뿌려주기
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<MealkitDTO> searchMeals(SearchCriteria scri) throws Exception {
		return shopDAO.searchMeals(scri);
		
	} // end List<MealkitDTO> searchMeals(SearchCriteria scri)
	
	//-----------------------------------------------------------------------------------------------------------
	//모든 리뷰 목록
	//-----------------------------------------------------------------------------------------------------------	
	@Override
	public List<ReviewVO> allReviewList(RV_Criteria cri) throws Exception{
		return shopDAO.allReviewList(cri);
	}

	//-----------------------------------------------------------------------------------------------------------
	//리뷰 페이징
	//-----------------------------------------------------------------------------------------------------------	
	@Override
	public int reviewCount() throws Exception{
		return shopDAO.reviewCount();
	}
	
	//-----------------------------------------------------------------------------------------------------------
  	// 재고수량 초과 금지
  	//-----------------------------------------------------------------------------------------------------------
  	@Override
  	public int getBuy_count(int cnt, int mk_id) throws Exception {
	  	logger.info("서비스임플~");
	  	return shopDAO.getBuy_count(cnt, mk_id);
	  	
  	} // end int getBuy_count(int cnt)

} // end class ShopServiceImpl implements ShopService
