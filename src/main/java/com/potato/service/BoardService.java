package com.potato.service;

import java.util.List;

import com.potato.domain.BoardVO;
import com.potato.domain.CartVO;
import com.potato.domain.Criteria;
import com.potato.domain.ImageSlideVO;

public interface BoardService {
	
	//1.전체 게시글 리스트 불러오기
		public List<BoardVO> getList();

		//2.게시글 작성
		public void register(BoardVO board);
		
		//3.게시글 1개 보기
		public BoardVO get(String board_number);

		//4.게시글 수정
		public boolean modify(BoardVO vo);

		//5.게시글 삭제
		public boolean remove(String board_number);
		
		//6.게시글 검색
		public List<BoardVO> search(String title);
		public List<BoardVO> search1(String types, String title);
		public void insertSearch(String title);
		public List<BoardVO> searchRank();
		
		//7.좋아요 추가
		public int updateLikes(String board_number);

		//8.관심 추가
		public int updateInterest(String board_number);

		//9.좋아요 취소
		public int cancelLikes(String board_number);

		//10.관심 취소
		public int cancelInterest(String board_number);

		//11.조회수 1 증가
		public int updateViews(String board_number);
		
		//12.조회수 1 감소
		public int cancelViews(String board_number);
		
		

		//13.cart에 좋아요 추가
		public int insertLike(CartVO cart);

		//14.cart에 관심 추가
		public int insertInterest(CartVO cart);
		
		//15.cart에 좋아요,관심 추가 / 버튼 상태
		public int insert_both(CartVO cart);

		//16.cart에 좋아요,관심 있을때 좋아요 취소
		public int cancelLike(CartVO cart);

		//17.cart에 좋아요,관심 있을때 관심 취소
		public int cancelInterest2(CartVO cart);
		
		//18.1개 취소
		public int cancel_both(CartVO cart);
		
		//19.get.jsp용 리스트 가져오기
		public CartVO get_cart(CartVO cart);
		
		//20.판매상태만 변경하기
		public int set_status(BoardVO board);
		
		//21.페이징 처리 리스트 출력
		public List<BoardVO> getMoreList(Criteria cri);
			
		//22.게시물의 전체 개수 구함
		public int getTotal(Criteria cri);
		
		//23.이미지 테이블 보드넘버 가져오기
		public BoardVO imageUtil(String photo_name);
			
		//24.이미지 테이블 삭제
		public boolean imageDelete(String board_number);
		
		//25.보드넘버기준 이미지 가져오기
		public List<ImageSlideVO> getImage(String board_number);
		
		//26. 이미지 슬라이드용
		public void image(ImageSlideVO image);
		
		//27. 최신순 보드가져오기
		public List<BoardVO> getRecent(Criteria cri);

}
