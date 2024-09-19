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
   update_date date default sysdate -- 회원수정일
); -- 멤버 테이블

insert into member values('admin','admin','1234','관리자','관리자','01012341234','주소','1','default_profile_1.jpg',sysdate,sysdate)

CREATE TABLE user_table (
  user_number VARCHAR2(50) primary key, -- 회원번호 member_number외래키
  reports NUMBER default 0 NOT NULL, -- 신고 수
  temper NUMBER default 36.5 NOT NULL, -- 온도
  trades NUMBER default 0 NOT NULL-- 거래완료 수
); -- user 테이블



create table reports(
   report_number varchar2(1000) constraint pk_report_num primary key, -- 신고번호
   writer_id varchar2(30) not null, -- 신고자 (member_id)
   defendant_id varchar2(30), -- 신고 당한사람 id
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
alter table board add ;

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
person_a varchar2(100) not null,
person_b varchar2(100) not null
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
	regidate date default sysdate
);

--좋아요 , 구독을 누른 회원 체크
create table cart (
	likes number(1) default 0 not null,
	interest number(1) default 0 not null,
	likes_board_number varchar2(50) not null,
	likes_member_number varchar2(50) not null
);

create table x_member as select member_number,id,pass,name,nickname,phone,address,grade,regidate from member where 1<>1
;
alter table x_member add (leave_date date default sysdate);

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

update login_check set status=0;
update board set likes=0, interest=0;
delete from cart;
select * from cart;
select * from member;

--샘플 등록
insert into board (board_number, types, title, content, writer, writer_number, board_address, status, photo_name, price)
   values (seq_board.nextval, '옷', '테스트용 제목1', '테스트용 내용1', '아니', '01J84DEM9246TM36NVB5M78TXT', '경기도 화성시', '판매중', 'p5.png', 150000);
insert into board (board_number, types, title, content, writer, writer_number, board_address, status, photo_name, price)
   values (seq_board.nextval, '전자기기', '테스트용 제목2', '테스트용 내용2', '아니', '01J84DEM9246TM36NVB5M78TXT', '경기도 화성시','판매중', 'gifts.png', 100000);
insert into board (board_number, types, title, content, writer, writer_number, board_address, status, photo_name, price)
   values (seq_board.nextval, '생활용품', '테스트용 제목3', '테스트용 내용3', '아니', '01J84DEM9246TM36NVB5M78TXT', '경기도 화성시','예약중', 'p3.png', 40000);
insert into board (board_number, types, title, content, writer, writer_number, board_address, status, photo_name, price)
   values (seq_board.nextval, '전자기기', '테스트용 제목4', '테스트용 내용4', '아니', '01J84DEM9246TM36NVB5M78TXT', '경기도 화성시','판매완료', 'p1.png', 80000);
insert into board (board_number, types, title, content, writer, writer_number, board_address, status, photo_name, price)
   values (seq_board.nextval, '옷', '테스트용 제목5', '테스트용 내용5', '아니', '01J84DEM9246TM36NVB5M78TXT', '경기도 화성시','판매완료', 'p7.png', 50000);
