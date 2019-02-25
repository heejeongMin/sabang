drop table house_info cascade constraints;
drop table house_price cascade constraints; 
drop table house_option cascade constraints;
drop table member cascade constraints;

-- **  house

--house info 
create table house_info(
hcode varchar2(6),
htype varchar(20) check(htype in ('o','t','f','p')) not null, --부동산 유형 --원룸 o / 투쓰리룸 t / 오피스텔 f / 아파트 p
rtype varchar(4) not null, -- rent type 
hname varchar(100) not null, 
addr varchar(500) not null,  
coordX varchar(30), 
coordY varchar(30),
area varchar(20) not null,  -- 면적
whlflr number(4),  -- 전체 층 
flr number(2) not null, -- if (flr == 0) '반지하' , if (whlflr < flr) '옥탑' 
room varchar2(2) not null, -- 방 개수
batr varchar(2) not null, -- 욕실 개수
cntwish number(1) default 0 check(cntwish < 6), -- 찜 회수
himage varchar2(80), -- System.currTimeMillis()랑 같이 사용해서 좀 길어졌음..
hetc varchar2(500),
registerDate date default sysdate,
agntid varchar2(10) CONSTRAINT house_info_agentid_fk REFERENCES AGENT(agntid),
CONSTRAINT pk_hdt_cd PRIMARY KEY (hcode)
);

-- house price
create table house_price( --단위 (만)
hcode varchar2(6),
deposit number(6), -- 보증금
mrent number(3), -- 월세
yrent number(6), -- 전세
maintc number(2) not null, -- maintenance cost, 관리비
parkf  number(2,1) not null, --parking fee, 주차비 (2.5만원)
CONSTRAINT fk_hpr_cd FOREIGN KEY (hcode)REFERENCES house_info (hcode) on delete cascade
);


-- house option : Y / N 형태 + ele
create table house_option(
hcode varchar2(6),
bltin char(1) default 'N' check(bltin in ('Y','N')) not null, -- 빌트인
elev char(1) default 'N' check(elev in ('Y','N')) not null, -- 엘레베이터
pet  char(1) default 'N' check(pet in ('Y','N')) not null , -- 애완동물
vrd char(1)  default 'N' check(vrd in ('Y','N')) not null , -- 베란다 / 발코니
loan char(1)  default 'N' check(loan in ('Y','N')) not null, -- 전세자금대출가능여부
park char(1)  default 'N' check(park in ('Y','N')) not null,  -- 주차 가능 여부
mdate char(1) default 'N' check(mdate in ('Y','N')) not null, -- 입주 가능일, 즉시 N / 협의 Y
etc varchar2(500), -- 기타 사항
CONSTRAINT fk_hopt_cd FOREIGN KEY (hcode)REFERENCES house_info (hcode) on delete cascade
);


-- ** member

-- member

create table member
(
  userid varchar2(10),
  passwd varchar2(20) not null,
  ssn varchar2(14) not null unique, 
  username varchar2(10) not null,
  post varchar2(6) not null,
  addr varchar2(500) not null, -- 신 주소표기, 도로명주소
  phone varchar2(11) not null unique,
  email varchar2(50) not null,
  wishlist varchar2(6) default 0,  --hcode 
 -- mtype varchar2(2) default 'Y' check(mtype in ('Y','N')) not null,  -- Y : default, 일반회원 / N : 중개사 , radio 버튼로 default 일반회원, 중개인으로 가입할 경우 중개인 버튼을 클릭해야하는 형태로 구현 
  CONSTRAINT pk_mem_id PRIMARY KEY (userid),
   CONSTRAINT fk_mem_cd FOREIGN KEY (wishlist)REFERENCES house_info (hcode) on delete cascade
); 




-- agent
create table agent(
  agntid varchar2(10),
  passwd varchar2(20) not null,
  agntssn varchar2(14) not null unique,
  agntname varchar2(10) not null,
  agntphone varchar2(11) not null unique,
  agntemail varchar2(50) not null,
  hcode varchar2(6), -- 중개 매물 코드 
  CONSTRAINT pk_agnt_id PRIMARY KEY (agntid),
  CONSTRAINT fk_agt_cd FOREIGN KEY (hcode)REFERENCES house_info (hcode) on delete cascade
);

-- withdraw member
create table wdMbr
(
  userid varchar2(10) primary key,
  phone varchar2(11) not null unique,
  droptime DATE  DEFAULT SYSDATE
);


-- ** board

--board -- hcode를 fk로 지정한 이유 : 각 house의 상세 페이지에 보드가 들어가므로 hcode 필요
create table board
( 
pcode varchar2(4) primary key,
hcode varchar2(6), 
pdate DATE DEFAULT SYSDATE, -- post date 게시일
ppwd varchar2(4) not null, --post password. 계정 비밀번호와 다름. 4byte
userid varchar2(10) not null,
title varchar2(30) not null,
content varchar2(4000) not null, --max 2000자
filename varchar2(200), -- 업로드 파일명 
CONSTRAINT fk_brd_id FOREIGN KEY (userid)REFERENCES member (userid) on delete cascade, -- 답변 여부 맴버 확인
CONSTRAINT fk_brd_cd FOREIGN KEY (hcode)REFERENCES house_info (hcode) on delete cascade
);   


create table RCNLIST
  (  num Number(15) PRIMARY KEY,
     userid VARCHAR2(10),
     hcode varchar2(20) not null
  );   

-- member테이블을 참조
-- userid를 fk로 지정한 이유 : 로그인한 정보가 필요
  alter table RCNLIST
  add CONSTRAINT RCNLIST_userid_fk FOREIGN KEY(userid)
   REFERENCES member(userid) ON DELETE CASCADE;
   
-- houseInfo테이블을 참조
-- hcode를 fk로 지정한 이유 : house 정보가 필요
  alter table RCNLIST
  add CONSTRAINT RCNLIST_hcode_fk FOREIGN KEY(hcode)
   REFERENCES house_info(hcode) ON DELETE CASCADE;