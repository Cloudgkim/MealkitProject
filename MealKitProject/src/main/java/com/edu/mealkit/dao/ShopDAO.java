package com.edu.mealkit.dao;

import java.util.List;

import com.edu.mealkit.dto.BuyDTO;
import com.edu.mealkit.dto.CartDTO;
import com.edu.mealkit.dto.Criteria;
import com.edu.mealkit.dto.MealkitDTO;
import com.edu.mealkit.dto.MemberDTO;
import com.edu.mealkit.dto.RV_Criteria;
import com.edu.mealkit.dto.ReviewVO;
import com.edu.mealkit.dto.SearchCriteria;
import com.edu.mealkit.dto.ZzimDTO;

public interface ShopDAO {
	
	// 반찬 상세보기
	public MealkitDTO getGoodsView(int mk_id) throws Exception;
	
	// 장바구니 개수 세기
	public int getCartCnt(String id) throws Exception;
	
	// 장바구니에 담기
	public void getCarts(CartDTO cartDTO) throws Exception;
	
	// 페이징처리 목록 조회
//	public List<MealkitDTO> goodslist(SearchCriteria scri) throws Exception;
	
	// 페이징처리 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 장바구니 업데이트 하기
	public int goUpdate(CartDTO cartDTO) throws Exception;
	
	// 장바구니 상품 찾기
	public List<CartDTO> showCarts(CartDTO cartDTO) throws Exception;
	
	// 장바구니 총 가격 찾기
	public int sumCart(String id) throws Exception;
	
	// buy테이블에 상품들 담기
	public void insertPay(BuyDTO buyDTO) throws Exception;
	
	// 장바구니 모두 삭제
	public void allDelete(String id) throws Exception;
	
	// 구매한 상품 모두 찾기
	public List<BuyDTO> getBuys(String id) throws Exception;
	
	// 선택삭제
	public void delete(String cart_id) throws Exception;
	
	// 찜한목록 갯수 세기
	public int getZzimCnt(String id) throws Exception;
	
	// 찜한상품에 상품보여주는 메소드
	public List<ZzimDTO> showZzims(ZzimDTO zzimDTO) throws Exception;
		
	// 찜한상품에 담기
	public void getZzims(ZzimDTO zzimDTO) throws Exception;
	
	// 장바구니 상품 확인
	public int countCarts(CartDTO cartDTO) throws Exception;
	
	// 장바구니 중복 상품 수량 변경
	public void updateCarts(CartDTO cartDTO) throws Exception;
	
	// 선택삭제 -- 찜에서
	public void zzDelete(String zzim_id) throws Exception;
	
	//찜여부체크
	public boolean zzimCheck(int mk_id);
	
    //kind_name별 목록조회
	public List<MealkitDTO> goodslist(String kind_name) throws Exception;
	
	// 찜한 상품 중 선택한 것만 장바구니 담기
	public int zzimGo(int zzim_id) throws Exception;

	// 장바구니에서 선택 주문하기
	public CartDTO choiceBuy(CartDTO cartDTO) throws Exception;

	// 장바구니 선택한 상품 총 가격 찾기
	public int sumChoice(int num) throws Exception;

	// buy테이블에 선택한 상품들 담기
	public void insertChoicePay(BuyDTO buyDTO) throws Exception;

	// 장바구니 선택한 거 삭제
	public void choiceDelete(CartDTO cartDTO) throws Exception;

	//리뷰 목록
	public List<ReviewVO> readReview(int r_mkno) throws Exception;
	
	//리뷰 쓰기
	public void writeReview(ReviewVO reviewVO) throws Exception;

	//리뷰 삭제
	public int deleteReview(int r_no) throws Exception;

	//리뷰작성제약
	public int RJJ(BuyDTO buyDTO);

	// 리뷰 본인 확인
	public String findResult(int r_no);
	
	//재고수량 가져오기
	public MealkitDTO productMkCount(int mk_id) throws Exception;
	
	// 목록대로 뿌려주기
	public List<MealkitDTO> allMeals() throws Exception;
	
	// 서치한 거 뿌려주기
	public List<MealkitDTO> searchMeals(SearchCriteria scri) throws Exception;

	//모든 리뷰 목록
	public List<ReviewVO> allReviewList(RV_Criteria cri) throws Exception;

	//리뷰 페이징
	public int reviewCount() throws Exception;

	// 재고수량 초과 금지
	public int getBuy_count(int cnt, int mk_id) throws Exception;

} // end interface ShopDAO
