package com.potato.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.potato.domain.BoardVO;
import com.potato.domain.CartVO;
import com.potato.domain.Criteria;
import com.potato.domain.ImageSlideVO;
import com.potato.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private BoardMapper mapper;

	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public List<ImageSlideVO> getImage(String board_number) {
		// TODO 게시물번호 이미지 가져오기
		return mapper.getImage(board_number);
	}

	@Override
	public void register(BoardVO board) {
		mapper.insert(board);
	}

	
	@Override
	public BoardVO get(String board_number) {
		return mapper.read(board_number);
	}

	@Override
	public boolean modify(BoardVO board) {
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(String board_number) {
		return mapper.delete(board_number) == 1;
	}

	@Override
	public int updateLikes(String board_number) {
		// TODO 좋아요 수 +1
		return mapper.updateLikes(board_number);
	}

	@Override
	public int updateInterest(String board_number) {
		// TODO 관심 수 +1
		return mapper.updateInterest(board_number);
	}

	@Override
	public int cancelLikes(String board_number) {
		// TODO 좋아요 수 -1
		return mapper.cancelLikes(board_number);
	}

	@Override
	public int cancelInterest(String board_number) {
		// TODO 관심 수 -1
		return mapper.cancelInterest(board_number);
	}

	@Override
	public int updateViews(String board_number) {
		// TODO 조회 수 +1
		return mapper.updateViews(board_number);
	}

	@Override
	public int insertLike(CartVO cart) {
		// TODO 좋아요 추가
		return mapper.insertLike(cart);
	}

	@Override
	public int insertInterest(CartVO cart) {
		// TODO 관심 추가
		return mapper.insertInterest(cart);
	}

	@Override
	public int cancelLike(CartVO cart) {
		// TODO 좋아요 취소
		return mapper.cancelLike(cart);
	}

	@Override
	public int cancelInterest2(CartVO cart) {
		// TODO 관심 취소
		return mapper.cancelInterest2(cart);
	}

	@Override
	public CartVO get_cart(CartVO cart) {
		// TODO 관심, 좋아요 확인
		return mapper.get_cart(cart);
	}

	@Override
	public int insert_both(CartVO cart) {
		// TODO Auto-generated method stub
		return mapper.insert_both(cart);
	}

	@Override
	public int cancel_both(CartVO cart) {
		// TODO Auto-generated method stub
		return mapper.cancel_both(cart);
	}

	@Override
	public int cancelViews(String board_number) {
		// TODO Auto-generated method stub
		return mapper.cancelViews(board_number);
	}

	@Override
	public List<BoardVO> search(String title) {
		return mapper.search(title);
	}
	
	@Override
	public List<BoardVO> search1(@Param("types") String types, @Param("title") String title) {
		return mapper.search1(types, title);
	}
	
	@Override
	public void insertSearch(String title) {
		// TODO 검색입력
		mapper.insertSearch(title);
	}
	
	@Override
	public List<BoardVO> searchRank() {
		// TODO 검색순위 가져오기
		return mapper.searchRank();
	}
	
	@Override
	public int set_status(BoardVO board) {
		// TODO 20.판매상태만 변경하기
		return mapper.set_status(board);
	}

	@Override
	public List<BoardVO> getMoreList(Criteria cri) {
		// TODO 페이징처리
		return mapper.getMoreList(cri);
	}
	
	@Override
	public List<BoardVO> getRecent(Criteria cri) {
		// TODO 최근게시물
		return mapper.getRecent(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO 총 게시물 갯수
		return mapper.getTotalCount(cri);
	}

	@Override
	public void image(ImageSlideVO image) {
		// TODO 이미지 슬라이드용
		mapper.image(image);
	}

	@Override
	public BoardVO imageUtil(String photo_name) {
		// TODO 이미지 테이블의 게시물번호 가져오기
		return mapper.imageUtil(photo_name);
	}

	@Override
	public boolean imageDelete(String board_number) {
		// TODO 이미지 테이블 삭제하기
		return mapper.imageDelete(board_number) == 1;
	}

}//class end
