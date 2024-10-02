create table member(
   member_number varchar2(50) constraint member_number_pk primary key, -- 회원번호
   id varchar2(30) not null unique,  -- 아이디
   pass varchar2(30) not null, -- 비밀번호
   name varchar2(30) not null, -- 이름
   nickName varchar2(30) not null, -- 닉네임
   phone varchar2(30) not null, -- 전화번호
   address varchar2(50) not null, -- 주소
   grade number(1) default 0 not null, -- 회원등급
   profile_image varchar2(1000) not null, -- 프로필
   regidate date default sysdate, -- 회원가입일  
   update_date date default sysdate, -- 회원수정일
   pay NUMBER DEFAULT 0,  --페이
   point NUMBER DEFAULT 0 --포인트
); -- 멤버 테이블

CREATE TABLE user_table (
  user_number VARCHAR2(50) primary key, -- 회원번호 member_number외래키
  reports NUMBER default 0 NOT NULL, -- 신고 수
  temper NUMBER default 36.5 NOT NULL CHECK (temper BETWEEN 1 AND 99), -- 온도
  trades NUMBER default 0 NOT NULL-- 거래완료 수
); -- user 테이블


create table reports(
   report_number varchar2(1000) constraint pk_report_num primary key, -- 신고번호
   writer_id varchar2(30) not null, -- 신고자 (member_id)
   defendant_id varchar2(30), -- 신고 당한사람 닉네임
   defendant varchar2(30), -- 신고 당한사람 fk(member_number)
   status number(1) default 0 not null, -- 신고처리 상태
   content varchar2(2000) not null,   -- 신고내용
   regidate date default sysdate, -- 신고일
   done_date date default sysdate -- 신고처리일
); -- 신고 테이블




create table board(
   board_number varchar2(50) constraint pk_board_num primary key, -- 글 번호
   types varchar2(50) not null, -- 게시판 구분
   title varchar2(100) not null, -- 글 제목
   content varchar2(1000) not null, -- 글 내용
   writer varchar2(30) not null, -- 작성자 
   writer_number varchar(50) , -- 작성자 번호 fk(member_number)
   status varchar2(1000) not null, -- 상품의 상태
   photo_name varchar2(1000) , -- 첨부사진
   regidate date default sysdate, -- 등록일
   updatedate date default sysdate,
   likes number default 0 not null,
   interest number default 0 not null,
   price number not null,
   views number default 0 not null,
   board_address varchar2(50) not null
); -- 게시판

create sequence seq_board;

create table reply(
   reply_number varchar2(100) constraint pk_reply_num primary key, -- 댓글 번호
   board_number varchar2(100), -- 글 번호 fk board_number
   content varchar2(1000) not null, -- 댓글 내용
   writer varchar2(30) not null, -- 작성자(member.nickname) 자바에서 연결
   regidate date default sysdate -- 등록일
); -- 댓글

create table re_reply(
   re_reply_number varchar2(1000) constraint pk_re_reply_num primary key, -- 대댓글 번호
   reply_number varchar2(100), -- 댓글 번호
   content varchar2(1000) not null, -- 댓글 내용
   writer varchar2(30) not null, -- 작성자
   regidate date default sysdate, -- 등록일
    constraint fk_re_reply_number foreign key(reply_number) references reply(reply_number)
); -- 대댓글

create table chat(
   chat_number varchar2(100) not null, -- 채팅방 번호
   sender varchar2(100) not null,  -- 보낸사람(member_number)
   content varchar2(2000) not null, -- 채팅 내용
   time_stamp date default sysdate  -- 보낸시간
);

create table chat_room(
chat_number varchar2(100) primary key,
buyer_number varchar2(50) not null,
celler_number varchar2(50) not null,
board_number varchar2(50) not null,
status number default 0 not null
);


-- 로그아웃 :0 , 로그인 : 1
create table login_check(
member_number varchar2(100) primary key,
status number default 0 constraint status_NN not null,
id varchar2(100) not null unique
);

-- 비로그인 회원도 코멘트를 쓸 수 있게 한다
create table coments (
	id varchar2(50) default '비회원' constraint id_nn not null,
	message varchar2(500) constraint message_nn not null,
	ip_address varchar2(50),
	regidate date default sysdate
);

create index idx_coments on coments (regidate desc);
select * from coments
select --+ INDEX(coments idx_coments)
 * from coments order by regidate desc


--좋아요 , 구독을 누른 회원 체크
create table cart (
	likes number(1) default 0 not null,
	interest number(1) default 0 not null,
	likes_board_number varchar2(50) not null,
	likes_member_number varchar2(50) not null
);


create table alarms(
alarm_number varchar2(50) primary key,
member_number varchar2(50) not null,
target_type varchar2(50) not null,
target_key varchar2(50) not null,
contents varchar2(100) not null,
status number default 0 not null
);

CREATE TABLE manner (
    manner_number NUMBER(10) PRIMARY KEY,
    description VARCHAR2(255) NOT NULL,
    mcount NUMBER(10) DEFAULT 0,
    member_number varchar2(50) not null,
    FOREIGN KEY (member_number) REFERENCES member(member_number)
); -- 매너 테이블

-- 시퀀스 생성
CREATE SEQUENCE manner_seq START WITH 1 INCREMENT BY 1;

create table image(
   board_number varchar2(50) not null,
   photo_name varchar2(1000) not null
);

create table qna(
   qna_number varchar2(50) primary key,
   question varchar2(1000) not null,
   answer varchar2(1000) not null
);

create table notification(
notice_number number primary key,
writer varchar2(50) not null,
title varchar2(500) not null,
content varchar2(1000) not null,
regidate Date default sysdate,
important number(1) default 0 not null
)

create sequence notice_seq;

create table x_member as select member_number,id,pass,name,nickname,phone,address,grade,regidate from member where 1<>1
;
alter table x_member add (leave_date date default sysdate);

create table pay (
 id VARCHAR2(50) PRIMARY KEY,             -- 페이 고유 번호
    from_member_number VARCHAR2(50) NOT NULL,  -- 송금하는 사람
    to_member_number VARCHAR2(50) NOT NULL,    -- 받는 사람
    pay_amount NUMBER NOT NULL,                 -- 가상머니
    point_amount NUMBER NOT NULL,               -- 적립 포인트
    pay_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 결제 시간
    FOREIGN KEY (from_member_number) REFERENCES member(member_number),
    FOREIGN KEY (to_member_number) REFERENCES member(member_number)
); -- 결제 시스템 테이블 (페이, 포인트)

update login_check set status=0;





--더미 데이터

insert into qna(qna_number,question,answer) values(
1,'중고물품을 구매하려면 어떻게 해야 하나요?',
'원하는 물품을 검색한 후, 해당 물품의 상세 페이지로 이동하여 "구매하기" 버튼을 클릭하면 구매 절차를 진행할 수 있습니다.'
)
insert into qna(qna_number,question,answer) values(
7,'물품을 판매하기 전에 상태를 어떻게 확인하나요?',
'물품의 상태를 사진으로 촬영하고, 상세 설명에 상태를 기재하여 구매자에게 정확한 정보를 제공해야 합니다.'
)
insert into qna(qna_number,question,answer) values(
8,'거래가 완료된 후 리뷰는 어떻게 남기나요?',
'거래가 완료된 후, 구매자는 판매자의 프로필 페이지에서 "리뷰 남기기" 버튼을 클릭하여 리뷰를 작성할 수 있습니다.'
)
insert into qna(qna_number,question,answer) values(
9,'물품을 구매한 후 취소할 수 있나요?',
'직접적인 취소 서비스는 제공하지 않고 있습니다. 구매자와 직접 해결하셔야 합니다.'
)
insert into qna(qna_number,question,answer) values(
10,'사이트 이용 중 문제가 발생하면 어떻게 하나요?',
'사이트 이용 중 문제가 발생하면 고객센터에 문의하시거나, QnA 페이지를 참조하여 해결 방법을 찾아보실 수 있습니다.'
)











--탈퇴시 탈퇴 테이블에 추가
create or replace trigger add_x_member
after delete on MEMBER
for each row
begin
insert into x_member (member_number,id,pass,name,nickname,phone,address,grade,regidate,leave_date)
values(:old.member_number,:old.id,:old.pass,:old.name,:old.nickname,:old.phone,:old.address,:old.grade,:old.regidate,sysdate);
end;

--회원가입시 user테이블 생성
create or replace trigger add_user
after insert on MEMBER
for each row
begin
	insert into user_table (user_number) values(:new.member_number);
end; 

--회원가입시 login_check테이블 생성
create or replace trigger login_check
after insert on MEMBER
for each row
begin
	insert into login_check (member_number,id) values(:new.member_number,:new.id);
end; 

