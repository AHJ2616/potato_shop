package com.potato.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.f4b6a3.ulid.Ulid;
import com.github.f4b6a3.ulid.UlidCreator;
import com.potato.domain.BoardVO;
import com.potato.domain.CartVO;
import com.potato.domain.Criteria;
import com.potato.domain.ImageSlideVO;
import com.potato.domain.MemberVO;
import com.potato.service.BoardService;
import com.potato.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/shop/*")
@Controller
@Log4j2
@AllArgsConstructor // 모든 필드값으로 생성자 만듬
public class BoardController {

	// 필드
	private BoardService service;
	private MemberService m_service;

	@GetMapping("/list")
	public Map<String, Object> MoreList(@RequestParam(defaultValue = "1") int pageNum,
            							   @RequestParam(defaultValue = "12") int amount) {
		 Criteria cri = new Criteria(pageNum, amount);
		 int total = service.getTotal(cri);
		 List<BoardVO> list = service.getMoreList(cri);

		 // 응답 데이터 맵
		 Map<String, Object> response = new HashMap<>();
		 response.put("list", list != null ? list : new ArrayList<>());

		 // 더 많은 데이터가 있는지 확인
		 boolean hasMore = (pageNum * amount) < total;
		 response.put("hasMore", hasMore); // 추가된 부분

		 return response;
	}
	
	@GetMapping("/recent")
	public Map<String, Object> recentList(@RequestParam(defaultValue = "1") int pageNum,
            							   @RequestParam(defaultValue = "12") int amount) {
		 Criteria cri = new Criteria(pageNum, amount);
		 int total = service.getTotal(cri);
		 List<BoardVO> list = service.getRecent(cri);

		 // 응답 데이터 맵
		 Map<String, Object> response = new HashMap<>();
		 response.put("list", list != null ? list : new ArrayList<>());

		 // 더 많은 데이터가 있는지 확인
		 boolean hasMore = (pageNum * amount) < total;
		 response.put("hasMore", hasMore); // 추가된 부분

		 return response;
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("board_number") String board_number, Model model, HttpSession session) {
		service.updateViews(board_number);
		
		BoardVO board = service.get(board_number);
		model.addAttribute("board", board);
		
		List<ImageSlideVO> image = service.getImage(board_number);
		model.addAttribute("image", image);
		
		MemberVO member = new MemberVO();
		CartVO cart = new CartVO();
		member.setMember_number(board.getWriter_number());
		cart.setLikes_board_number(board_number);
		model.addAttribute("member", m_service.profile(member)); // 판매자의 넘버,id,닉네임,프사
		model.addAttribute("user", m_service.mypage2(member)); // 판매자의 온도

		try {
			cart.setLikes_member_number(session.getAttribute("member_number").toString());
			if (cart != null) {
				model.addAttribute("cart", service.get_cart(cart)); // 카트 정보 가져오기
			}
		} catch (Exception e) {
			//
			e.printStackTrace();
		}
	}

	@GetMapping("/modify")
	public void modify(@RequestParam("board_number") String board_number, Model model) {
		BoardVO board = service.get(board_number);
		model.addAttribute("board", board);
		MemberVO member = new MemberVO();
		member.setMember_number(board.getWriter_number());
		model.addAttribute("member", m_service.profile(member)); // 넘버,id,닉네임,프사
		model.addAttribute("user", m_service.mypage2(member)); // 온도

	}

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(@ModelAttribute("board") BoardVO board) throws Exception {
		MultipartFile[] files = board.getFileUpload(); // 배열로 받기
		boolean isFirstFile = true; // 첫 번째 파일 여부를 추적하는 변수

		if (files != null) {
			for (MultipartFile file : files) {
				if (!file.isEmpty()) {
					String photo_name = file.getOriginalFilename();
					Ulid ulid = UlidCreator.getUlid();

					String fileName = ulid + "_" + photo_name.substring(0, photo_name.lastIndexOf('.')) + ".png";
					file.transferTo(new File("D:\\workspace\\potato\\src\\main\\webapp\\resources\\upload\\" + fileName));
					if (isFirstFile) {
						board.setPhoto_name(fileName);
	                    service.register(board);
	                    board = service.imageUtil(fileName);
	                    isFirstFile = false; // 이후에는 register 호출되지 않도록 설정
	                }
					String number = board.getBoard_number();
					// 이미지 슬라이드 VO 객체 생성 후 리스트에 추가
					ImageSlideVO imageSlide = new ImageSlideVO();
					imageSlide.setBoard_number(number);
					imageSlide.setPhoto_name(fileName); // 저장한 파일 이름 설정
					service.image(imageSlide);

				}
			}
		}

		return "redirect:/shop/list";
	}

	@PostMapping("/modify")
	public String modify(@ModelAttribute("board") BoardVO board, RedirectAttributes rttr) throws Exception {
		MultipartFile[] files = board.getFileUpload(); // 배열로 받기
		boolean isFirstFile = true; // 첫 번째 파일 여부를 추적하는 변수

		if (files != null) {
			for (MultipartFile file : files) {
				if (!file.isEmpty()) {
					String photo_name = file.getOriginalFilename();
					Ulid ulid = UlidCreator.getUlid();

					String fileName = ulid + "_" + photo_name.substring(0, photo_name.lastIndexOf('.')) + ".png";
					file.transferTo(new File("D:\\workspace\\potato\\src\\main\\webapp\\resources\\upload\\" + fileName));
					board.setPhoto_name(fileName);

					// 이미지 슬라이드 VO 객체 생성 후 리스트에 추가
					ImageSlideVO imageSlide = new ImageSlideVO();
					imageSlide.setBoard_number(board.getBoard_number()); // 제목 설정
					imageSlide.setPhoto_name(fileName); // 저장한 파일 이름 설정
					service.image(imageSlide);

					if (isFirstFile) {
						if (service.modify(board)) {
							rttr.addFlashAttribute("result", "success");
							isFirstFile = false; // 이후에는 register 호출되지 않도록 설정
						}
					}
				}
			}
		}
		return "redirect:/shop/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("board_number") String board_number, RedirectAttributes rttr) {
		if (service.remove(board_number)) {
			service.imageDelete(board_number);
			rttr.addFlashAttribute("result", "success"); // 수정 성공시 success 메시지를 보냄
		}
		return "redirect:/shop/list";
	}

	@GetMapping("/search")
	public void search(@RequestParam(value = "types", required = false) String types,
			@RequestParam("title") String title, Model model) {
		if (types == null || types.isEmpty()) {
			model.addAttribute("search", service.search(title));
			service.insertSearch(title);
		} else {
			model.addAttribute("search", service.search1(types, title));
		}
	}
}
