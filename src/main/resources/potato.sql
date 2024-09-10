create table member(
   member_number varchar2(100) constraint pk_member_num primary key, -- 회원번호
   id varchar2(30) not null unique,  -- 아이디
   pass varchar2(30) not null, -- 비밀번호
   name varchar2(30) not null, -- 이름
   nickName varchar2(30) not null, -- 닉네임
   phone varchar2(30) not null, -- 전화번호
   address varchar2(100) not null, -- 주소
   grade number(1) not null default 0, -- 회원등급
   profile_image varchar2(1000) not null, -- 프로필
   regidate date default sysdate, -- 회원가입일  
   update_date date default sysdate -- 회원수정일
); -- 멤버 테이블
insert into member(member_number,id,pass,name,nickName,phone,adress,profile_image)
 values(sys_guid(),'sql3','sql1','sql1','sql1','sql1','sql1','default_profile_1.jpg')

 
CREATE TABLE user_table (
  user_number VARCHAR2(100), -- 회원번호 member_number외래키
  reports NUMBER NOT NULL default 0, -- 신고 수
  temper NUMBER NOT NULL default 0, -- 온도
  trades NUMBER NOT NULL default 0, -- 거래완료 수
  CONSTRAINT fk_user_member_num FOREIGN KEY (user_number) REFERENCES member(member_number)
); -- user 테이블



create table reports(
   report_number varchar2(1000) constraint pk_report_num primary key, -- 신고번호
   writer_id varchar2(30) not null, -- 신고자 (member_id)
   defendant varchar2(100), -- 신고 당한사람 fk(member_number)
   status number(1) not null, -- 신고처리 상태
   regidate date default sysdate, -- 신고일
   done_date date default sysdate, -- 신고처리일
   constraint fk_report_defendant_number foreign key(defendant) references member(member_number)
); -- 신고 테이블

create table board(
   board_number varchar2(1000) constraint pk_board_num primary key, -- 글 번호
   types varchar2(100) not null, -- 게시판 구분
   title varchar2(100) not null, -- 글 제목
   content varchar2(1000) not null, -- 글 내용
   writer varchar2(30) not null, -- 작성자 
   writer_number varchar(50) , -- 작성자 번호 fk(member_number)
   status varchar2(1000) not null, -- 상품의 상태
   likes NUMBER(5) NOT NULL default 0, -- 좋아요 수
   photo_name varchar2(1000) , -- 첨부사진
   regidate date default sysdate, -- 등록일/   수정일 필요하면 추가해주세욤
   constraint fk_board_writer_number foreign key(writer_number) references member(member_number)
); -- 게시판

alter table board rename column photoname to photo_name;

select * from board;

create sequence seq_board;

create table reply(
   reply_number varchar2(100) constraint pk_reply_num primary key, -- 댓글 번호
   board_number varchar2(100), -- 글 번호 fk board_number
   content varchar2(1000) not null, -- 댓글 내용
   writer varchar2(30) not null, -- 작성자(member.nickname) 자바에서 연결
   regidate date default sysdate, -- 등록일
   constraint fk_reply_board_number foreign key(board_number) references board(board_number)
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

select * from chat;

create table chat_room(
chat_number varchar2(100) primary key,
person_a varchar2(100) not null,
person_b varchar2(100) not null
)

create table x_member as select member_number,id,pass,name,nickname,phone,adress,grade,regidate from member where 1<>1
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

select m.phone, m.address, u.likes, u.reports, u.temper, u.trades 
from member m
inner join user_table u on m.member_number = u.user_number
where m.member_number='01J6TP08EPYFFXJYAAMJ9KV2QW';

select * from reply;
select * from member;

SELECT dbms_metadata.get_ddl('TRIGGER', 'ADD_X_MEMBER') FROM dual;

delete from member where id='sql2' and pass='sql1'
select * from REPORTS;

insert into reports (report_number,writer_id,defendant,status) values ('seq_board','qqq','01J6TP08EPYFFXJYAAMJ9KV2QW',0);

 