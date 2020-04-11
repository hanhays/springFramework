< 회원 테이블 생성 >-----------------------------------------------------------------------------

CREATE TABLE tbl_member(
mem_id varchar2(50) PRIMARY KEY,
mem_pw varchar2(50) not null,
mem_name varchar2(50) not null,
mem_gender varchar2(5) not null,
mem_contact varchar2(50) not null,
mem_regdate date default sysdate,
mem_birth date not null,
mem_address1 varchar2(50),
mem_address2 varchar2(50),
mem_address3 varchar2(50),
mem_email varchar2(50),
mem_type number(2) default 0
)


//관리자, 경영자 등록
insert into tbl_member (mem_id, mem_pw, mem_name, mem_gender, mem_contact, mem_birth) 
values('admin','admin','관리자','m','01011112222','2020-01-01')
insert into tbl_member (mem_id, mem_pw, mem_name, mem_gender, mem_contact, mem_birth) 
values('ceo','ceo','경영자','f','01033334444','2020-01-01')

// 관리자, 경영자 mem_type 값 변경
update tbl_member set mem_type = 1 where mem_id = 'admin'
update tbl_member set mem_type = 2 where mem_id = 'ceo'

// 변경값 확인
select mem_type from tbl_member where mem_id = 'admin'
select mem_type from tbl_member where mem_id = 'ceo'



< 와인 테이블 생성 >------------------------------------------------------------------------------

CREATE TABLE tbl_wine(
wine_code varchar2(30) PRIMARY KEY,		
wine_name varchar2(50) not null,
wine_img varchar2(200),
wine_thumbimg varchar2(200),	
wine_type varchar2(10) not null,
wine_cost number(20) not null,
wine_price number(20) not null,
wine_stock number(10) default 0,
wine_regdate date default sysdate,
wine_info varchar2(1000), 
wine_readcnt number(5) default 0
)


// 밑에 상품등록


< 장바구니 테이블 생성 >--------------------------------------------------------------------

CREATE TABLE tbl_cart(
cart_no number(5) PRIMARY KEY,
cart_memId varchar2(50),
cart_wineCode varchar2(30),
cart_amount number(5) default 0,
cart_regdate date default sysdate,
FOREIGN KEY (cart_memId) REFERENCES tbl_member(mem_id) ON DELETE CASCADE,
FOREIGN KEY (cart_wineCode) REFERENCES tbl_wine(wine_code) ON DELETE CASCADE
)				



< 이용후기 게시판 테이블 생성 >------------------------------------------------------------------

CREATE TABLE tbl_reviewBoard(
rb_no number(5) PRIMARY KEY,
rb_writer varchar2(50) not null,
rb_title varchar2(100) not null,
rb_content varchar2(1000) not null,
rb_regdate date default sysdate,
rb_readcnt number(5) default 0,
rb_wineCode varchar2(30),
FOREIGN KEY (rb_wineCode) REFERENCES tbl_wine(wine_code) ON DELETE CASCADE
)



< 이용후기 댓글 테이블 생성 >-------------------------------------------------------------

CREATE TABLE tbl_reviewBoardReply(
rpy_no number(5) PRIMARY KEY,
rpy_bno number(5),
rpy_writer varchar2(50) not null,
rpy_content varchar2(100) not null,
rpy_regdate date default sysdate,
FOREIGN KEY (rpy_bno) REFERENCES tbl_reviewBoard(rb_no) ON DELETE CASCADE
)



< QnA 게시판 테이블 생성 >-------------------------------------------------------------

create table tbl_qnaboard(
qna_no number(5) primary key,
qna_writer varchar2(50),
qna_title varchar2(100) not null,
qna_content varchar2(1000) not null,
qna_regdate date default sysdate,
qna_updatedate date default sysdate,
qna_cnt number(5) default 0,
qna_root number(5) default 0,
qna_step number(5) default 0,
qna_indent number(5) default 0
)



< 주문 테이블 생성 >--------------------------------------------------------------------

CREATE TABLE tbl_order(
order_idnumber varchar2(50) PRIMARY KEY,
order_no number(5) not null,
order_totalprice number(20) not null,
order_regdate date default sysdate,
order_memId varchar2(50),
order_state number(1) default 0,
order_cancel number(1) default 0,
FOREIGN KEY (order_memId) REFERENCES tbl_member(mem_id) ON DELETE CASCADE
)



< 주문 상세내역 테이블 생성 >--------------------------------------------------------------------

CREATE TABLE tbl_order_details(
od_no number(5) PRIMARY KEY,
od_orderIdnumber varchar2(50),
od_wineCode varchar2(30),
od_amount number(5),
FOREIGN KEY (od_orderIdnumber) REFERENCES tbl_order(order_idnumber) ON DELETE CASCADE,
FOREIGN KEY (od_wineCode) REFERENCES tbl_wine(wine_code) ON DELETE CASCADE
)	



============ 상품 등록 시작 ===============================================================================================================

insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(30000, 'WINE-0001', 'Chateau Moulin', '\resources\wine_images\2020\03\15\a3b9222d-b34f-4985-9a97-fa5cfae84dce_20200311103282.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_a3b9222d-b34f-4985-9a97-fa5cfae84dce_20200311103282.jpg', 
'red', 83000, 30, 
'<br>
<p>-TASTING NOTE-</p>
이산화황 첨가물을 일체 사용하지 않은 와인으로 진한 보라 빛을 띠고 있다. 
검은 라즈베리와 초콜렛으로 코팅된 체리 그리고 야생 블루베리 향을 느낄 수 있다. 
미디엄 플러스의 바디감을 가진 이 와인은 단단하고 굵은 입자감의 탄닌과 신선함을 입 안 가득 느낄 수 있다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(33000, 'WINE-0002', 'Domaine Mur-Mur-Ium', '\resources\wine_images\2020\03\15\e7291da4-e753-43a5-9e36-c1ab456737a5_20200311153172.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_e7291da4-e753-43a5-9e36-c1ab456737a5_20200311153172.jpg', 
'red', 85000, 30, 
'<br>
<p>-TASTING NOTE-</p>
더 블랙 엘리펀트 시라의 라벨은 홀로 고고하게 서있는 코끼리를 상징하며, 
다른 론 벨리 와인보다도 어두운 색상을 띠며 집중된 과실향, 
입에서 오래도록 지속되는 힘이 좋은 와인이다.<br>
올드 바인 시라만을 사용하여 만드는 특별한 와인이다.<br> 
프로방스의 작열하는 태양아래 최적의 숙성도에 다달았을 때 수확하며 그 후 오크 숙성을 진행한다.<br> 
아주 진한 과실향이 인상적이며 다크 초콜렛, 커피, 각종 향신료와 프로방스에서 자라는 허브 계열의 향이 특징적이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(130000, 'WINE-0003', 'Domaine Rollan', '\resources\wine_images\2020\03\15\c660f3c4-b3b6-4485-ae94-05e7888232a4_202003111548342.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_c660f3c4-b3b6-4485-ae94-05e7888232a4_202003111548342.jpg', 
'red', 190000, 30, 
'<br>
<p>-TASTING NOTE-</p>
가넷 색과 보랏빛을 띤다.<br> 
신선하고 프루티하며 미네랄 노트가 뛰어나다.<br> 
붉은 과실류와 생강, 계피 등의 향신료 향과 감초로 마무리 되는 아로마가 인상적이다.<br> 
입에서는 우아한 바디감과 섬세한 탄닌감이 균형을 이룬다.<br>
일정 시간 브리딩 후 노즈에서 느꼈던 향들이 그대로 이어진다.<br> 
전반적인 균형감이 뛰어나고 피니시에서 바닐라 노트로 마무리된다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(50000, 'WINE-0004', 'Domaine Jean', '\resources\wine_images\2020\03\15\bfcba4b9-5450-4b00-87e0-40ef45fde100_202003111558562.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_bfcba4b9-5450-4b00-87e0-40ef45fde100_202003111558562.jpg', 
'red', 94000, 30, 
'<br>
<p>-TASTING NOTE-</p>
진한 루비 색을 띄는 이 와인은 체리와 블랙 커런트 의 향이 훈연 향과 함께 느껴진다.<br> 
입안에서는 부드러우면서도 풍부한 질감을 느낄 수 있다.<br> 
붉은 과실과 검은 과실의 풍미가 입안에서 조화롭게 어우러지며 갸메 특유의 신선한 꽃 향기와 퍼퓸의 아로마가 마지막에 감각을 자극한다.<br>
*프랑스 농림 수산부 유기농 인증 마크를 획득하여 라벨에 AB인증 마크가 있다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(140000, 'WINE-0005', 'Domaine Jean', '\resources\wine_images\2020\03\15\d59b88e1-1830-4cce-b72c-0770d9029a0c_20200311168132.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_d59b88e1-1830-4cce-b72c-0770d9029a0c_20200311168132.jpg', 
'red', 195000, 30, 
'<br>
<p>-TASTING NOTE-</p>
진한 보라 빛, 루비색을 띠는 이 와인은 모렐로 체리와 체리 씨앗의 향을 느낄 수 있다.<br>
섬세한 구조감과 함께 부드러운 질감을 느낄 수 있으며 잘 잡힌 균형감과 풍부한 풍미가 인상적인 와인이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(48000, 'WINE-0006', 'Domain Denis Carre', '\resources\wine_images\2020\03\15\0bc5a301-0383-4498-9673-ba89b022464f_202003111615192.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_0bc5a301-0383-4498-9673-ba89b022464f_202003111615192.jpg', 
'red', 99000, 30, 
'<br>
<p>-TASTING NOTE-</p>
진한 보라 빛, 루비색을 띠는 이 와인은 모렐로 체리와 체리 씨앗의 향을 느낄 수 있다.<br>
섬세한 구조감과 함께 부드러운 질감을 느낄 수 있으며 잘 잡힌 균형감과 풍부한 풍미가 인상적인 와인이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(510000, 'WINE-0007', 'Rene Bouvier', '\resources\wine_images\2020\03\15\0f34fc56-a620-4d01-b370-cf3ef58f44b9_202003111631272.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_0f34fc56-a620-4d01-b370-cf3ef58f44b9_202003111631272.jpg', 
'red', 580000, 30, 
'<br>
<p>-TASTING NOTE-</p>
- 숙성 : 30% 뉴 베럴, 18개월간 숙성<br>
색에서는 깊고 진한 레드 가넷 색을 띄고 주변부에 보라색을 띈다.<br> 
체다, 사향, 체리, 화이트 페퍼, 로스팅 한 커피, 자두 향이 인상적이다.<br>
힘과 구조감이 뛰어나 강하게 밀고 들어오는 느낌이며 탄닌은 섬세하다.<br>
피니시가 오래도록 지속된다.<br>
어울리는 음식은 저온에 오랫동안 조리한 양고기, 향신료를 가미한 소고기 요리, 구운 오리 고기 등과 잘 어울린다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(25000, 'WINE-0008', 'Chateldon Reserva', '\resources\wine_images\2020\03\15\bb331f86-69a0-4ff6-bb24-11b5d97ba2f8_201805171210502.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_bb331f86-69a0-4ff6-bb24-11b5d97ba2f8_201805171210502.jpg', 
'red', 74000, 30, 
'"유기농/바이오디나믹 농법 생산 와인"<br>
"농축미 뛰어나고 부드러운 과실풍미의 풀바디 레드와인"<br>
"12빈티지로 시음 최적기로 숙성된 와인"<br>
<p>-TASTING NOTE-</p>
어두운 붉은 색에 바이올렛 색이 감돈다. 가장 잘 느껴지는 향은 건포도와 과일잼류의 향이다. 오크에서 나는 바닐라 향과 각종 향신료 향도 느낄 수 있다. 
입에서는 부드러운 질감과 묵직한 바디감이 뛰어난 균형감을 만들어낸다. 숙성에 의해 부드러워진 탄닌이 인상적이고 피니시가 길다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(60000, 'WINE-0009', 'Domaine Mur-Mur-Ium', '\resources\wine_images\2020\03\15\8452bb87-4d89-4834-b5ee-dfcac38c49a3_20180516174812.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_8452bb87-4d89-4834-b5ee-dfcac38c49a3_20180516174812.jpg', 
'red', 110000, 30, 
'"엘레강스한 올드바인 그르나슈의 표본"<br>
"농축미 있는 블랙베리, 각종 스파이스 노트에 강직한 구조감이 돋보이는 와인"<br>
<p>-TASTING NOTE-</p>
각종 향신료와 후추 노트와 함께 블랙 커런트, 딸기 잼, 자두 잼 아로마가 느껴지며 각종 야생 허브 향도 느껴진다. 풀바디하며 굉장히 강직한 와인이다. 
탄닌과 알코올, 산도, 당도 등이 최적의 벨런스를 보이며 와인으로 만든 소스가 들어간 음식과 진한 자연 치즈들과 잘 어울린다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(78000, 'WINE-0010', 'St.Francis', '\resources\wine_images\2020\03\15\965b1b3f-d540-4168-b163-693301b1ea11_201701311248192.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_965b1b3f-d540-4168-b163-693301b1ea11_201701311248192.jpg', 
'red', 120000, 30, 
'"소노마 밸리에 메를로를 처음 심은 세인트 프란시스의 설립자 조 마틴"<br>
"큰 일교차와 해양성 기후로 메를로 품종의 최적의 산지"<br>
"지역 내 최고 퀄리티의 메를로 와인"<br>
<p>-TASTING NOTE-</p>
이 와인은 커피 향과 체리, 초콜렛 향과 각종 향신료 아로마가 매력적입니다.
미디움 투 풀 바디에 뛰어난 구조감과 길게 이어지는 피니시가 일품으로, 데리야끼 소스나 한국식 양념의 육류 요리, 훈제 오리, 족발 등 음식과 매우 잘 어울립니다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(25000, 'WINE-0011', 'La Grande Dame', '\resources\wine_images\2020\03\15\b4ef4d5d-ac6d-4880-9f97-0cc772e899eb_201605271733352.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_b4ef4d5d-ac6d-4880-9f97-0cc772e899eb_201605271733352.jpg', 
'red', 64000, 30, 
'"풍부하고 집중도 있는 검은 과일 향과 오크 풍미의 조화"<br>
"특히 피니쉬가 길고 강렬하며, 10년 이상 숙성 가능"<br>
<p>-TASTING NOTE-</p>
풍부한 과일의 풍미와 오크향이 조화를 이루고 있다.
풍부한 탄닌과 벨벳처럼 부드러운 질감이 돋보이고 놀랍도록 뛰어난 균형감과 오래도록 이어지는 피니쉬가 이 와인의 특징이라고 할 수 있다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(140000, 'WINE-0012', 'Tabali, Payen', '\resources\wine_images\2020\03\15\4cb3cac2-c911-46d0-b66a-f0a301d3143a_20160401170352.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_4cb3cac2-c911-46d0-b66a-f0a301d3143a_20160401170352.jpg', 
'red', 190000, 30, 
'"칠레 최북단의 유래없는 미세 기후지역, 리마리 밸리"<br>
"리마리밸리 최고의 와이너리 비냐 따발리의 아이콘 와인"<br>
"최상품 시라 Syrah 100% 와인으로 프렌치오크 18개월 숙성"<br>
<p>-TASTING NOTE-</p>
깊은 붉은 빛을 띠며 주변부에서는 보랏빛을 띤다. 체리, 블루베리, 제비꽃, 블랙 페퍼, 훈연향 그리고 각종 향신료 향을 느낄 수 있다. 
풀바디의 묵직한 와인이며 동시에 균형감이 좋고 우아하며 폭발적인 과실향이 느껴진다. 탄닌감은 강하면서도 벨벳처럼 부드럽다. 
복합미와 깊은 맛을 내는 오크 숙성의 장점이 두드러지며 길고 부드러운 피니시가 인상적이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(28000, 'WINE-0013', 'Tabali, Reserva Especial', '\resources\wine_images\2020\03\15\c86b88a3-89f0-406f-9c08-d63506e2e7be_20160401160172.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_c86b88a3-89f0-406f-9c08-d63506e2e7be_20160401160172.jpg', 
'red', 62000, 30, 
'"칠레 최북단의 유래없는 미세 기후지역, 리마리 밸리"<br>
"리마리밸리 최고의 와이너리 비냐 따발리의 에스페샬 등급 와인"<br>
"2013년 첫 빈티지. 풍부한 검은 과일향의 까베르네 프랑 100%"<br>
"풀바디, 부드러운 텍스쳐와 구조감"<br>
<p>-TASTING NOTE-</p>
진한 붉은 색을 띤다. 각종 향신료와 담뱃잎, 검은 과실류와 흑연 향이 어우러지며 복합적인 아로마를 느낄 수 있다.
강하면서도 텍스쳐는 부드러운 탄닌, 그리고 좋은 구조감에서 오는 피니시가 길고 복합미가 인상적이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(240000, 'WINE-0014', 'Schild Estate', '\resources\wine_images\2020\03\15\278cfde7-4d84-49d4-915b-ad0e17cb8491_201511231038222.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_278cfde7-4d84-49d4-915b-ad0e17cb8491_201511231038222.jpg', 
'red', 320000, 30, 
'"호주 바로사밸리의 친환경 가족경영 와이너리 - Schild Estate"<br>
"167년 수령의 Old Vine에서 생산한 한정수량 최고급 Shiraz 100%"<br>
"호주 바로사 밸리의 축복받은 빈티지 2012년"<br>
"집중적이고도 조화로운 과일 풍미, 오크와 바닐라빈의 깊이있는 향"<br>
<p>-TASTING NOTE-</p>
색은 짙은 루비 색이며, 영할 때는 집중적인 블랙베리, 자두, 체리 향 등을 느낄 수 있다. 오크에서 나는 바닐라 빈, 후추 계열의 부케가 기분 좋게 올라온다.
향에서 느껴지는 바닐라 빈과 자두는 입에서도 조화를 이루며, 균형 잡힌 산도와 섬세한 탄닌감, 오래 지속되는 피니시 등을 느낄 수 있는 우아한 와인이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(22000, 'WINE-0015', 'Diorama Collection', '\resources\wine_images\2020\03\15\41763c84-0e71-463a-9af8-cff5d7651247_20151029113732.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_41763c84-0e71-463a-9af8-cff5d7651247_20151029113732.jpg', 
'red', 52000, 30, 
'"테라 알타의 유기농 법에 따라 생산된 와인"<br>
"체리, 시나몬, 과일 잼, 스파이스 향의 복합적인 아로마"<br>
"미디움 바디, 부드러운 탄닌으로 가볍게 즐길 수 있는 와인"<br>
"지중해 스타일의 모던한 레드 와인"<br>
<p>-TASTING NOTE-</p>
핑크 빛이 감도는 바이올렛 색을 띈다. 체리와 같은 붉은 과실 향이 지배적이고 시간이 지나며 시나몬, 과일 잼, 스파이스 향들이 올라온다.
입에서는 부드러운 탄닌이 인상적인 가볍게 즐기기 좋은 와인이다. 기분 좋은 과실 향들과 함께 우아함을 느낄 수 있다.
스튜, 햄버거, 구운 닭요리, 양젖치즈 등과 잘 어울린다.
');

insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(24000, 'WINE-0016', 'Domaine', '\resources\wine_images\2020\03\15\def32c96-401a-4aaf-8708-49654e5bcc99_202003111542252.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_def32c96-401a-4aaf-8708-49654e5bcc99_202003111542252.jpg', 
'white', 69000, 30, 
'<br>
<p>-TASTING NOTE-</p>
흰 꽃, 사과, 배, 망고의 아로마에 이어 아니스나 감초와 같은 이국적인 향신료 향, 여운에는 꿀, 바닐라의 뉘앙스를 즐길 수 있다.<br>
중간 정도의 산도에 미디움 바디감이 균형감있게 느껴지며 미네랄리티도 굉장히 좋다.<br>
로스트 치킨, 허브를 얹은 감자 요리, 리코타 치즈와 시금치를 채운 크로켓, 그릴 구이한 생선이나 조개요리와 함께 즐기길 권장한다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(180000, 'WINE-0017', 'Domain Denis Carre', '\resources\wine_images\2020\03\15\ddebfbf7f-4f25-44e5-8002-f4f7b6e868d8_20200311163342.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_debfbf7f-4f25-44e5-8002-f4f7b6e868d8_20200311163342.jpg', 
'white', 250000, 30, 
'<br>
<p>-TASTING NOTE-</p>
밝은 황금빛 녹색을 띄는 이 와인은 구운 아몬드와 헤이즐넛 그리고 시트러스 계열의 아로마를 느낄 수 있다.<br>
입안에서는 풍부한 질감과 함께 헤이즐넛의 풍미가 느껴지며, 우아한 구조감과 긴 피니쉬가 이어진다.<br>
현재 마시기에도 좋지만 앞으로도 뛰어난 숙성잠재력을 지닌 와인이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(75000, 'WINE-0018', 'Olivier Tricon', '\resources\wine_images\2020\03\15\018f2694-104a-4741-b52a-ec58140ebe07_202003131546252.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_018f2694-104a-4741-b52a-ec58140ebe07_202003131546252.jpg', 
'white', 129000, 30, 
'<br>
<p>-TASTING NOTE-</p>
밝은 금색 빛의 이 와인은 미네랄리티가 인상적이다. <br>
은은한 과일의 향과 함께 토양에서 오는 미네랄과 바위, 암석의 풍미가 복합적으로 느껴진다. <br>
적절한 산미와 함께 부드러우면서도 신선한 풍미가 입안을 감싼다.<br>
그랑 크뤼 언덕에서 아주 약간 북쪽에 위치해있다. 그랑 크뤼의 지형적인 장점과 이점을 많이 공유 하고 있으며 더불어 높은 퀄리티의 키메르지안 토양을 지니고 있어 프리미에 크뤼로 분류되었다. 
현재 생산되는 40개의 샤블리 프리미에 크뤼 클리마 중에 가장 유명하고 뛰어난 3개의 프리미에 크뤼 클리마 중 하나이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(25000, 'WINE-0019', 'La Poda', '\resources\wine_images\2020\03\15\52281ed3-c04e-42d8-9a09-6896406cc1b4_202003111117102.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_52281ed3-c04e-42d8-9a09-6896406cc1b4_202003111117102.jpg', 
'white', 68000, 30, 
'<br>
<p>-TASTING NOTE-</p>
그린빛이 도는 레몬의 노란색을 띈다.<br>
감귤류 과일의 향이 화사하게 올라오며 입안에서는 단단한 미네랄리티와 함께 뚜렷한 산도와 약간의 짭쪼름한 풍미를 지니고 있어 알바리뇨의 독특한 개성을 분명하게 보여준다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(20000, 'WINE-0020', 'Nox Blanco', '\resources\wine_images\2020\03\15\5bda5d11-27c5-4b6a-974a-6dbbbe546c45_201805171154152.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_5bda5d11-27c5-4b6a-974a-6dbbbe546c45_201805171154152.jpg', 
'white', 42000, 30, 
'"유기농/바이오디나믹 농법 생산 와인"<br>
"수익금의 전액을 야생동식물 및 부엉이 보호에 환원하는 착한 와인"<br>
"싱그러운 열대과실 향의 넘실대는 프레쉬한 화이트"<br>
"라벨이 야광으로 밤에 더욱 빛나요"<br>
<p>-TASTING NOTE-</p>
외관은 약간의 초록빛이 감돌며 밝게 빛나는 노란 색을 띤다.
향에서는 신선한 과실향 중에서도 시트러스 계열의 과실 향들이 인상적이다.
입에서는 신선한 산도가 와인에 전반적인 생동감을 주며 매우 프레쉬한  스타일이라 어떤 음식에도 잘 어울리고 식전주로도 매우 좋다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(28000, 'WINE-0021', 'Chateau Rombeau', '\resources\wine_images\2020\03\15\cafe309b-8a23-4607-a9a8-b7ae1f3c3995_201805161646132.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_cafe309b-8a23-4607-a9a8-b7ae1f3c3995_201805161646132.jpg', 
'white', 62000, 30, 
'"생동감 있고 향의 퍼포먼스가 뛰어난 화이트"<br>
"특히 아시안 푸드와 잘 어울리는 매력만점 와인 추천"<br>
<p>-TASTING NOTE-</p>
향에서부터 생동감이 강렬하게 느껴지며 자몽향과 함께 약간의 화이트 페퍼 향도 느껴진다. 입 안에서는 크리미하면서도 약간의 점성이 느껴지며 뛰어난 구조감과 발랄함이 느껴진다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(28000, 'WINE-0022', 'Domaine Rombeau IGP', '\resources\wine_images\2020\03\15\ee8d600f-c2e8-4dae-b129-758717a645b2_201805151827432.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_ee8d600f-c2e8-4dae-b129-758717a645b2_201805151827432.jpg', 
'white', 62000, 30, 
'"유기농 인증 와인, Organic Wine Certification Ecocert"<br>
"말린 살구와 잘 익은 복숭아의 향기롭고 싱그러운 향 가득한 화이트"<br>
"생동감 있으면서 우아한 균형감의 화이트"<br>
<p>-TASTING NOTE-</p>
맑은 볕집 색을 띠는 이 와인은 말린 살구와 아주 잘 익은 복숭아의 아로마가 돋보인다. 입 안에서는 열대과일과 세이지의 풍미가 느껴진다. 
미디움 바디의 화이트 와인으로 충분한 산미와 풍부한 구조감, 생동감 있으면서 우아한 균형감이 느껴진다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(380000, 'WINE-0023', 'Aile d’argent', '\resources\wine_images\2020\03\15\e3d1c0d1-ed25-4d6d-99b6-9c767862a89b_20180504171492.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_e3d1c0d1-ed25-4d6d-99b6-9c767862a89b_20180504171492.jpg', 
'white', 450000, 30, 
'"메독 그랑크뤼 클라쎄 1등급 샤토 무통 로칠드의 화이트"<br>
"60병 미만 수입된 한정수량, 무통의 화이트"<br>
"소장용 구매 추천, 최소 10~15년 장기숙성용"<br>
<p>-TASTING NOTE-</p>
약간의 녹색 빛이 맴도는 황금색의 이 와인은 레몬 같은 시트러스 과일 향 뒤로 백도 복숭아와 서양 배의 아로마가 풍겨온다. 
마지막에는 은은한 아니스의 씨앗 향이 남는다. 우아한 오크 향과 함께 풍부하면서도 매우 복합적인 풍미가 녹차, 살구 풍미와 함께 입안을 즐겁게 해주며 피니쉬는 매우 길고 입안 가득, 아주 부드럽게 지속된다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(14000, 'WINE-0024', 'CAMAS', '\resources\wine_images\2020\03\15\9653971f-0b5c-464c-b33b-a048a71b8bef_20160609958572.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_9653971f-0b5c-464c-b33b-a048a71b8bef_20160609958572.jpg', 
'white', 36000, 30, 
'"레몬 라임 등의 시트러스 풍미가 풍성한 소비뇽 블랑"<br>
"미디움 라이트의 바디감이 있어 게, 조갸류의 음식, 생선구이와 잘 어울리는 화이트"<br>
<p>-TASTING NOTE-</p>
레몬과 라임 등의 시트러스 계열의 향이 주가 된다. 풍성한 느낌이며 긴 피니시에서 미네랄 터치가 느껴진다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(40000, 'WINE-0025', 'St. Francis w', '\resources\wine_images\2020\03\15\85e58590-f5da-402b-9b35-a44829ddc730_201701311214152.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_85e58590-f5da-402b-9b35-a44829ddc730_201701311214152.jpg', 
'white', 95000, 30, 
'"서늘한 기후대의 소노마 밸리- 매우 높은 품질의 샤르도네 산"<br>
"우아하면서도 아로마틱한 스타일, 6개월 오크숙성 & 효모 컨택을 통한 풍성한 질감"<br>
"Sonoma County Harvest Fair GOLD(2014)"<br>
"San Francisco Chronicle Wine Competition GOLD(2013)"<br>
<p>-TASTING NOTE-</p>
색은 밝은 금빛을 띠며 각종 열대과일, 망고 껍질, 자두와 꿀 아로마가 화사하게 퍼져나갑니다.
입에서는 구운 사과와 배 맛이 도드라지며 전반적인 텍스쳐가 부드럽고 풍성하며 피니시가 길게 이어집니다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(38000, 'WINE-0026', 'Auslese', '\resources\wine_images\2020\03\15\6d589183-4797-4920-b583-23f8f97025dc_201508181713552.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_6d589183-4797-4920-b583-23f8f97025dc_201508181713552.jpg', 
'white', 90000, 30, 
'"독일의 최고급 리슬링 산지 라인헤세의 아우스레제 Noble Sweet"<br>
"망고, 황도, 살구와 같은 말린 과일의 아로마와 당미, 산미의 완벽한 조화"<br>
"전통과 원칙을 고수하는 라인헤센의 대표 생산자, 스테인뮬레"<br>
<p>-TASTING NOTE-</p>
과일의 아로마가 강하게 느껴지는 이 와인은 리슬링 품종에서 전형적으로 느껴지는 살구와 복숭아의 향이 강하게 느껴진다.
입 안에서는 집중도 있고 풍부한 향이 달콤한 피니쉬와 함께 오래 이어진다. 지금도 충분히 마시기 좋으나 향후 20년까지도 숙성이 가능하다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(22000, 'WINE-0027', 'Montes Alpha', '\resources\wine_images\2020\03\15\f79a28e9-9622-47b8-9b75-2dd64a034554_201506021627592.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_f79a28e9-9622-47b8-9b75-2dd64a034554_201506021627592.jpg', 
'white', 48000, 30, 
'"칠레 카사블랑카 밸리에서 생산된 샤르도네 화이트 와인"<br>
"칠레의 인기 브랜드 몬테스 Montes"<br>
"오크숙성 및 젖산발효로 유질감 있는 스타일"<br>
<p>-TASTING NOTE-</p>
잘 익은 과일에서 나오는 꿀과 같은 향기가 있으며 오크 향과 결합되어 무게 있는 느낌을 준다.
와인의 70%는 배럴에서 발효 후 1년간 프랑스 오크통에서 숙성하여 튼튼하며 중후한 골격을 형성하였고, 나머지는 스테인레스 탱크에서 발효하여 신선함을 지켰다. 
이후에 전체 와인의 30%를 젖산발효 하여 여유롭고 풍족한 질감과 부가적인 Complexity를 부여하였다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(33000, 'WINE-0028', 'Sauvignon Blonde', '\resources\wine_images\2020\03\15\b483ddf1-8ab0-4366-892a-d29195400a1c_201505251335262.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_b483ddf1-8ab0-4366-892a-d29195400a1c_201505251335262.jpg', 
'white', 68000, 30, 
'"최고의 스타 마릴린 먼로를 형상화한 개성 있는 디자인과 이름"<br>
"라벨 수집용으로 와인 애호가들의 사랑을 받는 와인!"<br>
"소비뇽 블랑 특유의 허브와 꽃향, 신선하고 깔끔한 아로마와 맛"<br>
"여름철에 어울리는 화이트 와인, 데일리 와인으로 추천!"<br>
<p>-TASTING NOTE-</p>
옅은 볏짚 색상의 옐로우 빛 화이트 와인. 전형적인 소비뇽 블랑에서 느낄 수 있는 신선한 바이올렛과 다양한 허브 향이 잘 어우러진 아로마가 인상적이다.
레몬과 배의 풍미가 잔잔하게 드러난다. 피니시까지 깔끔하게 이어지며 데일리 와인으로 부담없이 즐길 수 있다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(16000, 'WINE-0029', 'Queen Adelaide', '\resources\wine_images\2020\03\15\def9373b-2754-463a-a603-0287db24c013_201505221817542.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_def9373b-2754-463a-a603-0287db24c013_201505221817542.jpg', 
'white', 36000, 30, 
'"호주 애들레이드의 가볍고 산뜻한 모스카토 화이트"<br>
"대영제국 시대 가장 사랑받던 여왕, 퀸 애들레이드 상징"<br>
"은은한 장미 및 흰 꽃 향과 약간의 탄산이 느껴지는 상큼한 맛"<br>
<p>-TASTING NOTE-</p>
옅지만 생기있는 옐로우 색상. 달콤하면서도 적절한 산도가 유지되어 단맛이 오래 남지 않고 깔끔한 느낌을 준다. 과일이 씹히는 듯 상큼하고 신선하다.
은은한 과일 및 꽃 향기를 즐길 수 있으며 약간의 탄산과 상큼함, 은은한 여운이 느껴지는 와인이다. 식전주나 아페리티프, 스시와 함께 즐기면 좋은 와인이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(22000, 'WINE-0030', 'MORANDE', '\resources\wine_images\2020\03\15\9ef3abd1-9067-46c0-afbe-451f576f8460_201505201620132.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_9ef3abd1-9067-46c0-afbe-451f576f8460_201505201620132.jpg', 
'white', 46000, 30, 
'"칠레 밸류 와인의 선두주자, 비냐 모란데"<br>
"균형감 있는 과일향과 산미의 조화. 오렌지, 시트러스, 신선한 과일향"<br>
"가격대비 훌륭한 품질의 소비뇽 블랑! 깔끔하고 상큼한 스타일"<br>
<p>-TASTING NOTE-</p>
매우 밝은 색감과 그린 터치의 옐로우 색상. 오렌지와 목련과 같은 신선한 향, 자몽과 시트러스, 열대 과일의 달콤한 과일 풍미가 느껴지며 입에서는 신선한 산미가 깔끔하게 정리해준다.
어떤 전채요리, 스시, 조개나 굴, 샐러드와도 완벽한 매칭을 보여준다.
');

insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(25000, 'WINE-0031', 'Les Muraires', '\resources\wine_images\2020\03\15\c901e9ef-378f-4451-8f92-397538ad713d_201702281639562.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_c901e9ef-378f-4451-8f92-397538ad713d_201702281639562.jpg', 
'rose', 53000, 30, 
'"달콤한 인생을 의미하는 두쓰 비 Douce Vie"<br>
"전형적인 프로방스 로제와인, 섬세한 붉은 과실 향과 신선한 장미향"<br>
"연어 카르파치오나 딸기 샐러드, 과일 타르트 등 어떤 음식에나 가볍게 즐겨주세요"<br>
<p>-TASTING NOTE-</p>
투명하고 밝게 빛나는 핑크빛을 띠는 와인으로 섬세한 붉은 과일(딸기, 라즈베리)의 향이 느껴지고 생기 발랄한 산도와 신선함이 돋보인다. 연어 카르파치오나 샐러드, 그릴에 구운 육류와도 잘 어울리며 과일 타르트와도 환상의 조화를 이룬다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(10000, 'WINE-0032', 'Realce', '\resources\wine_images\2020\03\15\375105ca-4f75-4f6f-985d-00b62fcebc30_201602181533442.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_375105ca-4f75-4f6f-985d-00b62fcebc30_201602181533442.jpg', 
'rose', 24000, 30, 
'"아름다운 로제 장미 빛의 와인"<br>
"라즈베리와 딸기 향이 지배적인 로제"<br>
<p>-TASTING NOTE-</p>
옅은 분홍색을 띈다. 라즈베리와 딸기 향이 지배적이며 복합적인 신선한 열대 과일 향이 더해져 향이 매력적인 와인이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(65000, 'WINE-0033', 'NV Villa Crespia', '\resources\wine_images\2020\03\15\c92d570f-d9f6-4459-813c-d410750a108c_201505111514442.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_c92d570f-d9f6-4459-813c-d410750a108c_201505111514442.jpg', 
'rose', 100000, 30, 
'"샴페인 생산방식으로 만든 이탈리아 고급 스파클링 와인, 프란치아코르타"<br>
"샤르도네 & 피노누아 블렌딩. 풍성한 바디와 꽃, 시트러스, 커피, 스파이스 풍미"<br>
"크리미한 기포의 질감, 엑스트라 드라이 스파클링 와인"<br>
"2014 Decanter World Wine Awards - Silver 수상"<br>
<p>-TASTING NOTE-</p>
빌라 크레스피아 브롤레제는 프란치아코르타 로제 엑스트라 브뤼로, 피노누아와 샤르도네 블렌딩을 통해 좋은 구조감과 풍성한 아로마를 완성했다. 
끊임없이 올라오는 기포도 훌륭하며 그린, 시트러스 과일과 같은 과일향과 산미는 와인에 신선함을 부여한다. 입 안에서 느껴지는 빵 조각과 각종 스파이스의 풍미는 이 로제 프란치아코르타의 케릭터를 더욱 풍부하고 우아하게 만들어 준다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(25000, 'WINE-0034', 'Le Retour Rose', '\resources\wine_images\2020\03\15\97381dd1-5192-4f80-865e-29150b866442_201504291659152.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_97381dd1-5192-4f80-865e-29150b866442_201504291659152.jpg', 
'rose', 60000, 30, 
'"남부 론과 프로방스의 향기를 담은 로제 와인"<br>
"흰 꽃, 석류, 약간의 후추와 같은 스파이스, 은은하고 긴 피니쉬"<br>
"아름다운 로제색상으로 여성들에게 인기가 높은 와인"<br>
<p>-TASTING NOTE-</p>
아름다운 옐로우로즈 색상 흰 꽃의 향과 석류 향이 조화를 이루며, 후추와 약간의 스파이시 풍미도 느껴진다.
강하지 않지만 은은히 이어지는 긴 피니쉬가 인상적이다. 약 4~8℃에서 즐기면 가장 좋다.
로제 와인은 레드 와인과 화이트 와인의 장점과 특징을 모두 가지고 있기 때문에 식사 시 어떤 음식과도 잘 어울릴 수 있는  만능 엔터네이너,테이블 와인라고 할 수 있다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(175000, 'WINE-0035', 'Cuvee 555 Brut', '\resources\wine_images\2020\03\15\72b05f24-18a2-47c9-bebb-03e0cb569af2_2018051517102.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_72b05f24-18a2-47c9-bebb-03e0cb569af2_2018051517102.jpg', 
'champagne', 220000, 40, 
'"샤르도네 100%, 15~20년된 부르고뉴산 올드 오크배럴에 4~6개월 숙성한 샴페인"<br>
"6~7년간의 효모컨택 병숙성으로, 볼랭저나 크룩에 못지않는 최상의 샴페인"<br>
"풍부하고 리치하고 엘레강스한 샴페인"<br>
<p>-TASTING NOTE-</p>
매우 리치하고 힘이 있는 샴페인이며, 구운 빵, 브리오슈, 스위트 스파이스, 레몬 껍질과 구운 견과류, 솔티드 카라멜과 같이 풍성한 향이 더해진다. 
매우 조밀하고 힘있는 버블과 프레쉬한 산미, 힘의 균형이 뛰어난 샴페인이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(155000, 'WINE-0036', 'Curvee Rose Brut NV', '\resources\wine_images\2020\03\15\2df00bee-169d-4d93-a18b-fe5eeb08eb35_20150421155072.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_2df00bee-169d-4d93-a18b-fe5eeb08eb35_20150421155072.jpg', 
'champagne', 200000, 40, 
'"상파뉴의 그랑크뤼 RM 부띠끄 샴페인"<br>
"샤르도네에 피노누아를 소량 블렌딩한 로제 샴페인"<br>
"옐로핑크 계열의 아름다운 칼라와 부드럽고 신선한 라즈베리 아로마"<br>
<p>-TASTING NOTE-</p>
아름답고 우아한 옐로우 핑크빛 칼라. 지속적으로 올라오는 섬세한 버블과 함께 딸기, 라즈베리, 체리의 아로마가 돋보인다. 
87%의 샤르도네에 13%의 피노누아를 블렌딩해 만든 로제 샴페인으로, 매우 부드럽고 신선하다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(145000, 'WINE-0037', 'Curvee Reserve', '\resources\wine_images\2020\03\15\d2b04685-7d8b-4ce4-bb94-fba8846e257a_20150421158202.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_d2b04685-7d8b-4ce4-bb94-fba8846e257a_20150421158202.jpg', 
'champagne', 180000, 40, 
'"상파뉴의 그랑크뤼 RM 부띠끄 샴페인"<br>
"깔끔하고 상큼한 샤르도네 샴페인, 열대과일 및 시트러스, 토스티한 풍미까지"<br>
<p>-TASTING NOTE-</p>
라이트한 옐로우 그린 컬러. 섬세하고 균일한 버블. 익힌 과일과 버트, 자몽, 꿀과 시리얼의 아로마가 돋보이며, 신선한 첫맛과 크리미한 질감이 인상적이다. 
산도가 과일 풍미와 조화를 이루어 긴 여운을 남긴다. 잘 만들어진 샤르도네 블랑 드 블랑 샴페인.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(12000, 'WINE-0038', 'Jacqueline', '\resources\wine_images\2020\03\15\939ced67-4b6f-4211-a62d-65958248b051_20150428135192.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_939ced67-4b6f-4211-a62d-65958248b051_20150428135192.jpg', 
'sparkling', 38000, 40, 
'"프랑스 최고의 주류전문회사 Camus 생산"<br>
"약간의 단 맛과 함께 풍부한 과일, 꽃향의 스파클링 와인"<br>
"파티용 와인 스파클링 와인 추천, 칵테일 베이스 용 추천"<br>
<p>-TASTING NOTE-</p>
맑게 빛나는 황금 빛의 생생한 버블이 돋보이는 스파클링 와인. 신선한 과일 향이 돋보이는데 특히 레몬과 구운 아몬드의 아로마가 두드러진다. 
시트러스 향, 발랄한 꽃 향기가 입 안에 펼쳐지며 피니쉬까지 가벼우면서도 약간의 단 맛이 기분 좋게 만들어 주는 와인이다. 파티용 와인으로 어디에서나 빛날 수 있다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(20000, 'WINE-0039', 'La Tordera', '\resources\wine_images\2020\03\15\f291fa82-7097-413c-b4d8-f4af98c8b5bd_20150723133372.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_f291fa82-7097-413c-b4d8-f4af98c8b5bd_20150723133372.jpg', 
'sparkling', 58000, 40, 
'"이태리 북동부 베네토의 스파클링 와인, 프로세코"<br>
"밝은 로제색상에 청사과, 장미, 라즈베리, 딸기의 기분좋은 향"<br>
"경쾌한 느낌을 주는 기포와 약간의 당미의 조화"<br>
"사랑스러운 느낌의 로제 프로세코"<br>
<p>-TASTING NOTE-</p>
매력적인 오렌지 빛의 로제 와인이다. 향에서부터 기분좋은 딸기, 자두, 라즈베리, 비올렛, 세이지(허브), 레드 페퍼 아로마가 느껴지며, 균형감이 좋고 당도와 신선함이 조화를 이룬다. 
가볍고 신선하게 즐기기 좋은 프로세코로 강력 추천!
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(15000, 'WINE-0040', 'La Tordera, Alne', '\resources\wine_images\2020\03\15\dd273d7a-a1d7-4c91-bb3f-e81a8cfa3e84_20150723149412.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_dd273d7a-a1d7-4c91-bb3f-e81a8cfa3e84_20150723149412.jpg', 
'sparkling', 48000, 40, 
'"이태리 북동부 베네토의 스파클링 와인, 프로세코"<br>
"청사과, 배, 바닐라 향의 신선한 아로마"<br>
"전형적인 고른 버블의 프로세코 스타일로 식전주로 추천"<br>
<p>-TASTING NOTE-</p>
볕짚 색을 띄며 약간의 녹색을 띈다. 초록 사과, 배, 등나무, 바닐라 향이 어우러지며 굉장히 신선하고 과일향이 풍부한 아로마가 인상적이다. 
우아한 피네스와 함께 오래도록 여운이 지속된다. 아페레티프로 어울리는 전형적인 프로세코 스타일이며 리소토나 랍스타와 같은 전식과 잘 어울린다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(235000, 'WINE-0041', 'Millesime 2005', '\resources\wine_images\2020\03\15\065f030d-3b3a-4271-9ec2-65cc3af6c480_201504211446352.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_065f030d-3b3a-4271-9ec2-65cc3af6c480_201504211446352.jpg', 
'champagne', 275000, 40, 
'"상파뉴의 그랑크뤼 RM 부띠끄 샴페인"<br>
"30~50년 수령의 고목에서 재배된 샤르도네, 최상의 샤르도네 샴페인"<br>
"식전, 식중, 식후 어디에나 어울리는 미식 아이템"<br>
<p>-TASTING NOTE-</p>
신선하고 깔끔한 샤르도네 샴페인을 생산하는 부띠끄 와이너리 아싸이의 가장 고급형 빈티지 샴페인. 
30~60년 수령의 고목에서 재배된 샤르도네로 양조되어 풍부한 산도와 벌꿀, 복숭아와 같은 농밀한 아로마, 미네랄이 어우러진다. 여운이 매우 길며, 식전주 뿐 아니라 생선요리, 
육류와 함께하는 식중주, 디저트 샴페인으로까지 다양한 역할을 해낸다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(10000, 'WINE-0042', 'Mosto d"Uva Rosso', '\resources\wine_images\2020\03\15\d5aad6c8-ef77-4d1b-8e40-a7e1762584cd_201505151723202.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_d5aad6c8-ef77-4d1b-8e40-a7e1762584cd_201505151723202.jpg', 
'sparkling', 32000, 40, 
'"미디움 스위트의 향긋하고 달콤한 루비 빛 레드 스파클링"<br>
"달콤한 맛과 약 발포성(버블)의 향연"<br>
"여성들에게 인기 최고인 모스토 로쏘"<br>
<p>-TASTING NOTE-</p>
루비 레드 빛을 띄는 와인으로 상큼함 과일의 풍미와 달콤한 맛이 잘 어우러진다. 
상쾌한 기포가 매력적인 와인으로 전형적인 피에몬테 지역 프레이사의 모습을 보여주고 있다. 6~8도로 차갑게 칠링해서 마시면 더욱 맛있다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(43000, 'WINE-0043', 'Moet & Chandon', '\resources\wine_images\2020\03\15\2d4d3a82-55a5-4dc0-a12e-ab51223860a2_201505291156482.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_2d4d3a82-55a5-4dc0-a12e-ab51223860a2_201505291156482.jpg', 
'champagne', 80000, 40, 
'"세계에서 가장 인기 있고 유명한 브랜드 샴페인"<br>
"선물용으로 가장 인기가 높은 샴페인 중 하나"<br>
"나폴레옹과 루이15세가 가장 사랑했던 샴페인"<br>
<p>-TASTING NOTE-</p>
골든 옐로우 색상에 섬세하고 미세한 버블이 끊임없이 올라온다. 배, 사과 등의 흰 과일 류와 바닐라, 버터쿠키와 같은 구수한 2차발효 향이 느껴진다. 
풍부한 과일향미와 토스티한 향이 매우 잘 어우러진다. 풍미가 오랫동안 지속되며 입 안에서의 버블이 거칠지 않고 부드럽고 크림같이 느껴진다. 
식전주로도 좋지만 식중/식후에도 손색이 없는 멀티 샴페인이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(110000, 'WINE-0044', 'Bollinger', '\resources\wine_images\2020\03\15\8433d929-83a2-4d0d-b6c7-3fe5b5453d06_201505311433172.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_8433d929-83a2-4d0d-b6c7-3fe5b5453d06_201505311433172.jpg', 
'champagne', 152000, 40, 
'"007시리즈의 제임스 본드가 즐겨마신 샴페인"<br>
"샴페인지역의 역사가 오래된 명품 샴페인"<br>
"피노 누아의 함량이 높아 바디감있으면서 복합미 좋은 샴페인"<br>
<p>-TASTING NOTE-</p>
밝게 빛나는 맑은 황금색을 띠고 있으며 우아하고 미세한 버블이 끊임없이 올라온다. 
레몬, 미네랄과 이스트의 향이 두드러지게 나타나는 와인으로 독특한 스타일의 바디감을 지니고 있으며 끊임없이 올라오는 기포는 맛과 향 뿐만 아니라 보는 즐거움까지 선사해 준다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(12000, 'WINE-0045', 'Saomi Prosecco', '\resources\wine_images\2020\03\15\cc21ceec-4d11-4137-a830-410ca5149b92_201507231415222.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_cc21ceec-4d11-4137-a830-410ca5149b92_201507231415222.jpg', 
'sparkling', 48000, 40, 
'"이태리 북동부 베네토의 스파클링 와인, 프로세코"<br>
"청사과, 허브, 바닐라와 아카시아 꽃 향의 균형감 좋은 스타일"<br>
"일반적인 프로세코보다 더 집중도 높은 스타일로, 식전주로 강력추천"<br>
<p>-TASTING NOTE-</p>
밝은 볕집 색이다. 프루티하며 피핀종 사과, 지중해 허브 향이 강하게 나고 약간의 바닐라와 아카시아 꽃 향이 느껴진다. 균형감이 좋고 특히나 신선하고 프루티한 팔레트가 특징적이다. 
일반적인 프로세코 보다도 집중도가 높다. 미디움 바디에 기포가 강한 편이고, 우아한 피네스가 오래도록 지속된다. 아페리티프(식전주)로 최적이며 포멀한 디너의 첫 코스 요리와도 잘 어울린다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(16000, 'WINE-0046', 'Brunei Prosecco', '\resources\wine_images\2020\03\15\03df8b3e-017c-41f3-9588-9d7bbfb1a80c_201507231420292.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_03df8b3e-017c-41f3-9588-9d7bbfb1a80c_201507231420292.jpg', 
'sparkling', 53000, 40, 
'"이태리 북동부 베네토의 스파클링 와인, 프로세코"<br>
"청사과, 리치, 배, 자스민 꽃의 아로마의 집중도 높은 맛"<br>
"음식과 함께가 아닌 와인만 즐겨도 맛있는 스타일"<br>
<p>-TASTING NOTE-</p>
옅은 볕집 색을 띈다. 꽃향기와 과일의 향이 좋은 조화를 이루며 신선한 배, 초록 사과, 리치, 백리향, 자스민 꽃 아로마가 인상적이다. 
맛에서는 사과 향이 강하며 신선하고 균형이 잘 잡혀있고 신선한 산도가 느껴진다. 와인만 즐겨도 충분히 즐길 수 있는 맛있는 프로세코다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(12000, 'WINE-0047', 'Marrugat', '\resources\wine_images\2020\03\15\4d0a2f01-c0e6-4025-9a88-7a08aa365b64_201507231452102.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_4d0a2f01-c0e6-4025-9a88-7a08aa365b64_201507231452102.jpg', 
'sparkling', 47000, 40, 
'"샴페인방식으로 생산된 스페인의 스파클링 와인, CAVA"<br>
"스페인 까바의 매력을 듬뿍담은 가격대비 강력추천 까바"<br>
"신선한 과일향이 넘치는 경쾌한 스타일"<br>
<p>-TASTING NOTE-</p>
가볍고 밝은 황금색을 띄며 사과와 배 향, 꽃 향기가 느껴진다. 미네랄과 산도가 조화를 이루며 신선하고 기포가 오랜 시간 지속된다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(22000, 'WINE-0048', 'Marrugat Gran', '\resources\wine_images\2020\03\15\595df751-3523-4466-8b1e-ff38ea427071_201607081134172.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_595df751-3523-4466-8b1e-ff38ea427071_201607081134172.jpg', 
'sparkling', 66000, 40, 
'"샴페인방식으로 생산된 스페인의 스파클링 와인, CAVA"<br>
"스페인 까바의 매력을 듬뿍담은 고 품질 빈티지 까바, 강력추천"<br>
"섬세한 기포와 과실류의 풍성하고 신선한 풍미, 균형감"<br>
<p>-TASTING NOTE-</p>
옅은 금빛 색을 띤다. 섬세한 버블이 계속 올라오며 와인 잔 표면에 왕관 모양을 그린다. 향에서는 2차 발효와 셀러에서 숙성되며 생성된 독특한 아로마가 인상적이며 각종 신선한 과실류의 향들이 느껴진다. 
과실 본연에서 느껴지는 향과 숙성 과정에서 더해지는 향들이 뛰어난 균형감을 보여준다. 입에서는 섬세하며 톡톡 튀는 산도가 신선함을 느끼게 해준다. 피니시가 길고 균형감이 뛰어난 와인이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(90000, 'WINE-0049', 'Voirin-Jumel', '\resources\wine_images\2020\03\15\508d2f5d-398c-4a3d-8578-860c8e5b1eaf_201805091217172.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_508d2f5d-398c-4a3d-8578-860c8e5b1eaf_201805091217172.jpg', 
'sparkling', 130000, 40, 
'"그랑크뤼 포도밭에서 직접 재배한 포도로 양조하는 RM 샴페인하우스"<br>
"가장 클래식한 샴페인 모델, 브륏 트라디시옹"<br>
<p>-TASTING NOTE-</p>
감귤, 오렌지 필, 잘 깎은 사과 향 등 프루티한 과실 향이 좋은 샴페인이다. 축하하는 자리나 칵테일 파티 등 어떤 상황에서도 잘 어울리며, 헤이즐넛과 신선한 아몬드, 파이의 고소한 향이 더해진다. 
버블이 매우 조밀하고 경쾌하며 크리미한 질감이 우수하다. 식전주로 추천할만하다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(130000, 'WINE-0050', 'Voirin-Jumel Rose', '\resources\wine_images\2020\03\15\af028dec-ff80-4082-9720-4aa1858d79cb_201805151525432.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_af028dec-ff80-4082-9720-4aa1858d79cb_201805151525432.jpg', 
'sparkling', 170000, 40, 
'"피노누아 100%, 적포도 껍질 침용으로 통한 자연스러운 색 추출의 매력적인 로제"<br>
"레드 베리류와 장미의 멋들어진 행, 섬세하고 우아한 맛의 샴페인"<br>
<p>-TASTING NOTE-</p>
매혹적인 체리 빛 로제 컬러 피노누아 100% Saignee(세니에)방식으로 포도껍질의 침용시간을 길게해 색을 추출하여 곱고도 강렬한 로제 컬러를 얻었다. 
화이트 샴페인에 비해 좀더 깊고도 풍부한 향과 질감을 보여주며, 딸기, 체리, 사과와 장미 향까지 은은하게 피어니는 우아한 샴페인이다.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(340000, 'WINE-0051', 'Millesime d"Exception 2002', '\resources\wine_images\2020\03\15\5594881e-eea4-415b-804c-34421688c7f5_201805151716122.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_5594881e-eea4-415b-804c-34421688c7f5_201805151716122.jpg', 
'champagne', 400000, 40, 
'"샤르도네 100%의 그랑크뤼 샴페인"<br>
"2002년 샴페인 Great Vintage 로, Ready to Drink 최상의 컨디션의 숙성 샴페인"<br>
"흰 꽃, 살구, 브리오슈, 구운 빵 등 복합미 넘치는 풍미의 매력적인 빈티지 샴페인"<br>
<p>-TASTING NOTE-</p>
RM 샴페인 하우스 보아랑 쥐멜의 그랑크뤼 시그니쳐 빈티지 샴페인 흰 꽃, 구운 빵, 오렌지 껍질, 구운 견과류 등의 깊고 복합적인 향과 함께 여전히 생기 넘치는 조밀한 버블과 입안을 상쾌하게 만들어 주는 산미, 
바디감이 적절한 균형감을 이룬다. 완벽한 컨디션으로 숙성된 빈티지 샴페인의 면모를 유감없이 보여준다.
')


========================= 상품 등록 끝 =============================
--sql 예문 --------------------------------------------------------

// 상품 삭제할때
delete from tbl_wine where wine_code = 'w000'
select wine_code from tbl_wine
delete * from tbl_wine

<잘못 만들었으면 드랍하세요>
drop table tbl_member
DROP TABLE tbl_wine CASCADE CONSTRAINTS    //외래키로 드랍안될때

<계정 내 모든 테이블 확인>
select * from tab

<테이블 정보 보기> ## cmd창에서만 가능 ##
desc tbl_wine

<컬럼 추가>
alter table tbl_member add(mem_address1 varchar2(50))

<컬럼 속성 교체>
alter table tbl_member modify(mem_name varchar2(50))
alter table tbl_wine modify(wine_stock default 1)

<컬럼 삭제>
alter table tbl_wine drop column wine_img

commit
