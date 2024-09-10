package com.potato.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.f4b6a3.ulid.Ulid;
import com.github.f4b6a3.ulid.UlidCreator;
import com.potato.domain.ChatVO;
import com.potato.domain.MemberVO;
import com.potato.service.ChatService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/chat/*")
@AllArgsConstructor
public class Rest_chat_controller {

	private ChatService service;
	
	// 채팅 전송
    @PostMapping("/send")
    public void sendMessage(@RequestBody ChatVO chatVO) {
    	Ulid ulid = UlidCreator.getUlid();
    	chatVO.setChat_number(ulid.toString());
    	service.add_chat(chatVO);
    }

    // 채팅내역 불러오기
    @GetMapping("/messages")
    public List<ChatVO> getMessages(@RequestBody ChatVO chatVO) {
        return service.list(chatVO);
    }

    // Delete a chat message by its number
    @DeleteMapping("/delete")
    public void deleteMessage(@RequestBody ChatVO chatVO) {
    	service.delete_chat(chatVO);
    }
	
}
