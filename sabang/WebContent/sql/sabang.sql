drop table house_info cascade constraints;
drop table house_price cascade constraints; 
drop table house_option cascade constraints;

-- **  house

--house info 
create table house_info(
hcode varchar2(6),
htype varchar(20) check(htype in ('o','t','f','p')) not null, --�ε��� ���� --���� o / �������� t / ���ǽ��� f / ����Ʈ p
rtype varchar(4) not null, -- rent type 
hname varchar(100) not null, 
addr varchar(500) not null,  
coordX varchar(30), 
coordY varchar(30),
area varchar(20) not null,  -- ����
whlflr number(4),  -- ��ü �� 
flr number(2) not null, -- if (flr == 0) '������' , if (whlflr < flr) '��ž' 
room varchar2(2) not null, -- �� ����
batr varchar(2) not null, -- ��� ����
cntwish number(1) default 0 check(cntwish < 6), -- �� ȸ��
himage varchar2(80), -- System.currTimeMillis()�� ���� ����ؼ� �� �������..
hetc varchar2(500),
registerDate date default sysdate,
CONSTRAINT pk_hdt_cd PRIMARY KEY (hcode)
);

-- house price
create table house_price( --���� (��)
hcode varchar2(6),
deposit number(6), -- ������
mrent number(3), -- ����
yrent number(6), -- ����
maintc number(2) not null, -- maintenance cost, ������
parkf  number(2,1) not null, --parking fee, ������ (2.5����)
CONSTRAINT fk_hpr_cd FOREIGN KEY (hcode)REFERENCES house_info (hcode) on delete cascade
);


-- house option : Y / N ���� + ele
create table house_option(
hcode varchar2(6),
bltin char(1) default 'N' check(bltin in ('Y','N')) not null, -- ��Ʈ��
elev char(1) default 'N' check(elev in ('Y','N')) not null, -- ����������
pet  char(1) default 'N' check(pet in ('Y','N')) not null , -- �ֿϵ���
vrd char(1)  default 'N' check(vrd in ('Y','N')) not null , -- ������ / ���ڴ�
loan char(1)  default 'N' check(loan in ('Y','N')) not null, -- �����ڱݴ��Ⱑ�ɿ���
park char(1)  default 'N' check(park in ('Y','N')) not null,  -- ���� ���� ����
mdate char(1) default 'N' check(mdate in ('Y','N')) not null, -- ���� ������, ��� N / ���� Y
etc varchar2(500), -- ��Ÿ ����
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
  addr varchar2(500) not null, -- �� �ּ�ǥ��, ���θ��ּ�
  phone varchar2(11) not null unique,
  email varchar2(50) not null,
  wishlist varchar2(6) default 0,  --hcode 
 -- mtype varchar2(2) default 'Y' check(mtype in ('Y','N')) not null,  -- Y : default, �Ϲ�ȸ�� / N : �߰��� , radio ��ư�� default �Ϲ�ȸ��, �߰������� ������ ��� �߰��� ��ư�� Ŭ���ؾ��ϴ� ���·� ���� 
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
  hcode varchar2(6), -- �߰� �Ź� �ڵ� 
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

--board 
create table board
( 
pcode varchar2(4) primary key,
idx number(3) not null, -- seq
pdate DATE DEFAULT SYSDATE, -- post date �Խ���
category varchar2(20) not null,
ppwd varchar2(4) not null, --post password. ���� ��й�ȣ�� �ٸ�. 4byte
phone varchar2(11) not null,
title varchar2(30) not null,
content varchar2(4000) not null, --max 2000��
filename varchar2(200), -- ���ε� ���ϸ� 
CONSTRAINT fk_brd_pn FOREIGN KEY (phone)REFERENCES member (phone) on delete cascade -- �亯 ���� ���� �޼���
);     

--sequence
create sequence board_seq
start with 1
increment by 1;
