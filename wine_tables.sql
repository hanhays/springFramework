< ȸ�� ���̺� ���� >-----------------------------------------------------------------------------

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


//������, �濵�� ���
insert into tbl_member (mem_id, mem_pw, mem_name, mem_gender, mem_contact, mem_birth) 
values('admin','admin','������','m','01011112222','2020-01-01')
insert into tbl_member (mem_id, mem_pw, mem_name, mem_gender, mem_contact, mem_birth) 
values('ceo','ceo','�濵��','f','01033334444','2020-01-01')

// ������, �濵�� mem_type �� ����
update tbl_member set mem_type = 1 where mem_id = 'admin'
update tbl_member set mem_type = 2 where mem_id = 'ceo'

// ���氪 Ȯ��
select mem_type from tbl_member where mem_id = 'admin'
select mem_type from tbl_member where mem_id = 'ceo'



< ���� ���̺� ���� >------------------------------------------------------------------------------

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


// �ؿ� ��ǰ���


< ��ٱ��� ���̺� ���� >--------------------------------------------------------------------

CREATE TABLE tbl_cart(
cart_no number(5) PRIMARY KEY,
cart_memId varchar2(50),
cart_wineCode varchar2(30),
cart_amount number(5) default 0,
cart_regdate date default sysdate,
FOREIGN KEY (cart_memId) REFERENCES tbl_member(mem_id) ON DELETE CASCADE,
FOREIGN KEY (cart_wineCode) REFERENCES tbl_wine(wine_code) ON DELETE CASCADE
)				



< �̿��ı� �Խ��� ���̺� ���� >------------------------------------------------------------------

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



< �̿��ı� ��� ���̺� ���� >-------------------------------------------------------------

CREATE TABLE tbl_reviewBoardReply(
rpy_no number(5) PRIMARY KEY,
rpy_bno number(5),
rpy_writer varchar2(50) not null,
rpy_content varchar2(100) not null,
rpy_regdate date default sysdate,
FOREIGN KEY (rpy_bno) REFERENCES tbl_reviewBoard(rb_no) ON DELETE CASCADE
)



< QnA �Խ��� ���̺� ���� >-------------------------------------------------------------

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



< �ֹ� ���̺� ���� >--------------------------------------------------------------------

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



< �ֹ� �󼼳��� ���̺� ���� >--------------------------------------------------------------------

CREATE TABLE tbl_order_details(
od_no number(5) PRIMARY KEY,
od_orderIdnumber varchar2(50),
od_wineCode varchar2(30),
od_amount number(5),
FOREIGN KEY (od_orderIdnumber) REFERENCES tbl_order(order_idnumber) ON DELETE CASCADE,
FOREIGN KEY (od_wineCode) REFERENCES tbl_wine(wine_code) ON DELETE CASCADE
)	



============ ��ǰ ��� ���� ===============================================================================================================

insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(30000, 'WINE-0001', 'Chateau Moulin', '\resources\wine_images\2020\03\15\a3b9222d-b34f-4985-9a97-fa5cfae84dce_20200311103282.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_a3b9222d-b34f-4985-9a97-fa5cfae84dce_20200311103282.jpg', 
'red', 83000, 30, 
'<br>
<p>-TASTING NOTE-</p>
�̻�ȭȲ ÷������ ��ü ������� ���� �������� ���� ���� ���� ��� �ִ�. 
���� ������� ���ݷ����� ���õ� ü�� �׸��� �߻� ��纣�� ���� ���� �� �ִ�. 
�̵�� �÷����� �ٵ��� ���� �� ������ �ܴ��ϰ� ���� ���ڰ��� ź�Ѱ� �ż����� �� �� ���� ���� �� �ִ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(33000, 'WINE-0002', 'Domaine Mur-Mur-Ium', '\resources\wine_images\2020\03\15\e7291da4-e753-43a5-9e36-c1ab456737a5_20200311153172.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_e7291da4-e753-43a5-9e36-c1ab456737a5_20200311153172.jpg', 
'red', 85000, 30, 
'<br>
<p>-TASTING NOTE-</p>
�� �� ������Ʈ �ö��� ���� Ȧ�� ����ϰ� ���ִ� �ڳ����� ��¡�ϸ�, 
�ٸ� �� ���� ���κ��ٵ� ��ο� ������ ��� ���ߵ� ������, 
�Կ��� �������� ���ӵǴ� ���� ���� �����̴�.<br>
�õ� ���� �ö��� ����Ͽ� ����� Ư���� �����̴�.<br> 
���ι潺�� �ۿ��ϴ� �¾�Ʒ� ������ �������� �ٴ޾��� �� ��Ȯ�ϸ� �� �� ��ũ ������ �����Ѵ�.<br> 
���� ���� �������� �λ����̸� ��ũ ���ݷ�, Ŀ��, ���� ��ŷ�� ���ι潺���� �ڶ�� ��� �迭�� ���� Ư¡���̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(130000, 'WINE-0003', 'Domaine Rollan', '\resources\wine_images\2020\03\15\c660f3c4-b3b6-4485-ae94-05e7888232a4_202003111548342.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_c660f3c4-b3b6-4485-ae94-05e7888232a4_202003111548342.jpg', 
'red', 190000, 30, 
'<br>
<p>-TASTING NOTE-</p>
���� ���� �������� ���.<br> 
�ż��ϰ� ����Ƽ�ϸ� �̳׶� ��Ʈ�� �پ��.<br> 
���� ���Ƿ��� ����, ���� ���� ��ŷ� ��� ���ʷ� ������ �Ǵ� �Ʒθ��� �λ����̴�.<br> 
�Կ����� ����� �ٵ𰨰� ������ ź�Ѱ��� ������ �̷��.<br>
���� �ð� �긮�� �� ����� ������ ����� �״�� �̾�����.<br> 
�������� �������� �پ�� �ǴϽÿ��� �ٴҶ� ��Ʈ�� �������ȴ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(50000, 'WINE-0004', 'Domaine Jean', '\resources\wine_images\2020\03\15\bfcba4b9-5450-4b00-87e0-40ef45fde100_202003111558562.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_bfcba4b9-5450-4b00-87e0-40ef45fde100_202003111558562.jpg', 
'red', 94000, 30, 
'<br>
<p>-TASTING NOTE-</p>
���� ��� ���� ��� �� ������ ü���� �� Ŀ��Ʈ �� ���� �ƿ� ��� �Բ� ��������.<br> 
�Ծȿ����� �ε巯��鼭�� ǳ���� ������ ���� �� �ִ�.<br> 
���� ���ǰ� ���� ������ ǳ�̰� �Ծȿ��� ��ȭ�Ӱ� ��췯���� ���� Ư���� �ż��� �� ���� ��Ǿ�� �Ʒθ��� �������� ������ �ڱ��Ѵ�.<br>
*������ �� ����� ����� ���� ��ũ�� ȹ���Ͽ� �󺧿� AB���� ��ũ�� �ִ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(140000, 'WINE-0005', 'Domaine Jean', '\resources\wine_images\2020\03\15\d59b88e1-1830-4cce-b72c-0770d9029a0c_20200311168132.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_d59b88e1-1830-4cce-b72c-0770d9029a0c_20200311168132.jpg', 
'red', 195000, 30, 
'<br>
<p>-TASTING NOTE-</p>
���� ���� ��, ������ ��� �� ������ �𷼷� ü���� ü�� ������ ���� ���� �� �ִ�.<br>
������ �������� �Բ� �ε巯�� ������ ���� �� ������ �� ���� �������� ǳ���� ǳ�̰� �λ����� �����̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(48000, 'WINE-0006', 'Domain Denis Carre', '\resources\wine_images\2020\03\15\0bc5a301-0383-4498-9673-ba89b022464f_202003111615192.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_0bc5a301-0383-4498-9673-ba89b022464f_202003111615192.jpg', 
'red', 99000, 30, 
'<br>
<p>-TASTING NOTE-</p>
���� ���� ��, ������ ��� �� ������ �𷼷� ü���� ü�� ������ ���� ���� �� �ִ�.<br>
������ �������� �Բ� �ε巯�� ������ ���� �� ������ �� ���� �������� ǳ���� ǳ�̰� �λ����� �����̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(510000, 'WINE-0007', 'Rene Bouvier', '\resources\wine_images\2020\03\15\0f34fc56-a620-4d01-b370-cf3ef58f44b9_202003111631272.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_0f34fc56-a620-4d01-b370-cf3ef58f44b9_202003111631272.jpg', 
'red', 580000, 30, 
'<br>
<p>-TASTING NOTE-</p>
- ���� : 30% �� ����, 18������ ����<br>
�������� ��� ���� ���� ���� ���� ��� �ֺ��ο� ������� ���.<br> 
ü��, ����, ü��, ȭ��Ʈ ����, �ν��� �� Ŀ��, �ڵ� ���� �λ����̴�.<br>
���� �������� �پ ���ϰ� �а� ������ �����̸� ź���� �����ϴ�.<br>
�ǴϽð� �������� ���ӵȴ�.<br>
��︮�� ������ ���¿� �������� ������ ����, ��ŷḦ ������ �Ұ�� �丮, ���� ���� ��� ��� �� ��︰��.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(25000, 'WINE-0008', 'Chateldon Reserva', '\resources\wine_images\2020\03\15\bb331f86-69a0-4ff6-bb24-11b5d97ba2f8_201805171210502.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_bb331f86-69a0-4ff6-bb24-11b5d97ba2f8_201805171210502.jpg', 
'red', 74000, 30, 
'"�����/���̿��𳪹� ��� ���� ����"<br>
"����� �پ�� �ε巯�� ����ǳ���� Ǯ�ٵ� �������"<br>
"12��Ƽ���� ���� ������� ������ ����"<br>
<p>-TASTING NOTE-</p>
��ο� ���� ���� ���̿÷� ���� ������. ���� �� �������� ���� �������� ��������� ���̴�. ��ũ���� ���� �ٴҶ� ��� ���� ��ŷ� �⵵ ���� �� �ִ�. 
�Կ����� �ε巯�� ������ ������ �ٵ��� �پ �������� ������. ������ ���� �ε巯���� ź���� �λ����̰� �ǴϽð� ���.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(60000, 'WINE-0009', 'Domaine Mur-Mur-Ium', '\resources\wine_images\2020\03\15\8452bb87-4d89-4834-b5ee-dfcac38c49a3_20180516174812.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_8452bb87-4d89-4834-b5ee-dfcac38c49a3_20180516174812.jpg', 
'red', 110000, 30, 
'"���������� �õ���� �׸������� ǥ��"<br>
"����� �ִ� ������, ���� �����̽� ��Ʈ�� ������ �������� �����̴� ����"<br>
<p>-TASTING NOTE-</p>
���� ��ŷ�� ���� ��Ʈ�� �Բ� �� Ŀ��Ʈ, ���� ��, �ڵ� �� �Ʒθ��� �������� ���� �߻� ��� �⵵ ��������. Ǯ�ٵ��ϸ� ������ ������ �����̴�. 
ź�Ѱ� ���ڿ�, �굵, �絵 ���� ������ �������� ���̸� �������� ���� �ҽ��� �� ���İ� ���� �ڿ� ġ���� �� ��︰��.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(78000, 'WINE-0010', 'St.Francis', '\resources\wine_images\2020\03\15\965b1b3f-d540-4168-b163-693301b1ea11_201701311248192.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_965b1b3f-d540-4168-b163-693301b1ea11_201701311248192.jpg', 
'red', 120000, 30, 
'"�ҳ븶 �븮�� �޸��θ� ó�� ���� ����Ʈ �����ý��� ������ �� ��ƾ"<br>
"ū �ϱ����� �ؾ缺 ���ķ� �޸��� ǰ���� ������ ����"<br>
"���� �� �ְ� ����Ƽ�� �޸��� ����"<br>
<p>-TASTING NOTE-</p>
�� ������ Ŀ�� ��� ü��, ���ݷ� ��� ���� ��ŷ� �Ʒθ��� �ŷ����Դϴ�.
�̵�� �� Ǯ �ٵ� �پ �������� ��� �̾����� �ǴϽð� ��ǰ����, �����߳� �ҽ��� �ѱ��� ����� ���� �丮, ���� ����, ���� �� ���İ� �ſ� �� ��︳�ϴ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(25000, 'WINE-0011', 'La Grande Dame', '\resources\wine_images\2020\03\15\b4ef4d5d-ac6d-4880-9f97-0cc772e899eb_201605271733352.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_b4ef4d5d-ac6d-4880-9f97-0cc772e899eb_201605271733352.jpg', 
'red', 64000, 30, 
'"ǳ���ϰ� ���ߵ� �ִ� ���� ���� ��� ��ũ ǳ���� ��ȭ"<br>
"Ư�� �ǴϽ��� ��� �����ϸ�, 10�� �̻� ���� ����"<br>
<p>-TASTING NOTE-</p>
ǳ���� ������ ǳ�̿� ��ũ���� ��ȭ�� �̷�� �ִ�.
ǳ���� ź�Ѱ� ����ó�� �ε巯�� ������ �����̰� ������� �پ �������� �������� �̾����� �ǴϽ��� �� ������ Ư¡�̶�� �� �� �ִ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(140000, 'WINE-0012', 'Tabali, Payen', '\resources\wine_images\2020\03\15\4cb3cac2-c911-46d0-b66a-f0a301d3143a_20160401170352.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_4cb3cac2-c911-46d0-b66a-f0a301d3143a_20160401170352.jpg', 
'red', 190000, 30, 
'"ĥ�� �ֺϴ��� �������� �̼� ��������, ������ �븮"<br>
"�������븮 �ְ��� ���̳ʸ� ��� ���߸��� ������ ����"<br>
"�ֻ�ǰ �ö� Syrah 100% �������� ����ġ��ũ 18���� ����"<br>
<p>-TASTING NOTE-</p>
���� ���� ���� ��� �ֺ��ο����� �������� ���. ü��, ��纣��, �����, �� ����, �ƿ��� �׸��� ���� ��ŷ� ���� ���� �� �ִ�. 
Ǯ�ٵ��� ������ �����̸� ���ÿ� �������� ���� ����ϸ� �������� �������� ��������. ź�Ѱ��� ���ϸ鼭�� ����ó�� �ε巴��. 
���չ̿� ���� ���� ���� ��ũ ������ ������ �ε巯���� ��� �ε巯�� �ǴϽð� �λ����̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(28000, 'WINE-0013', 'Tabali, Reserva Especial', '\resources\wine_images\2020\03\15\c86b88a3-89f0-406f-9c08-d63506e2e7be_20160401160172.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_c86b88a3-89f0-406f-9c08-d63506e2e7be_20160401160172.jpg', 
'red', 62000, 30, 
'"ĥ�� �ֺϴ��� �������� �̼� ��������, ������ �븮"<br>
"�������븮 �ְ��� ���̳ʸ� ��� ���߸��� �����伣 ��� ����"<br>
"2013�� ù ��Ƽ��. ǳ���� ���� �������� ����� ���� 100%"<br>
"Ǯ�ٵ�, �ε巯�� �ؽ��Ŀ� ������"<br>
<p>-TASTING NOTE-</p>
���� ���� ���� ���. ���� ��ŷ�� �����, ���� ���Ƿ��� �濬 ���� ��췯���� �������� �Ʒθ��� ���� �� �ִ�.
���ϸ鼭�� �ؽ��Ĵ� �ε巯�� ź��, �׸��� ���� ���������� ���� �ǴϽð� ��� ���չ̰� �λ����̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(240000, 'WINE-0014', 'Schild Estate', '\resources\wine_images\2020\03\15\278cfde7-4d84-49d4-915b-ad0e17cb8491_201511231038222.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_278cfde7-4d84-49d4-915b-ad0e17cb8491_201511231038222.jpg', 
'red', 320000, 30, 
'"ȣ�� �ٷλ�븮�� ģȯ�� �����濵 ���̳ʸ� - Schild Estate"<br>
"167�� ������ Old Vine���� ������ �������� �ְ�� Shiraz 100%"<br>
"ȣ�� �ٷλ� �븮�� �ູ���� ��Ƽ�� 2012��"<br>
"�������̰� ��ȭ�ο� ���� ǳ��, ��ũ�� �ٴҶ���� �����ִ� ��"<br>
<p>-TASTING NOTE-</p>
���� £�� ��� ���̸�, ���� ���� �������� ������, �ڵ�, ü�� �� ���� ���� �� �ִ�. ��ũ���� ���� �ٴҶ� ��, ���� �迭�� ���ɰ� ��� ���� �ö�´�.
�⿡�� �������� �ٴҶ� ��� �ڵδ� �Կ����� ��ȭ�� �̷��, ���� ���� �굵�� ������ ź�Ѱ�, ���� ���ӵǴ� �ǴϽ� ���� ���� �� �ִ� ����� �����̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(22000, 'WINE-0015', 'Diorama Collection', '\resources\wine_images\2020\03\15\41763c84-0e71-463a-9af8-cff5d7651247_20151029113732.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_41763c84-0e71-463a-9af8-cff5d7651247_20151029113732.jpg', 
'red', 52000, 30, 
'"�׶� ��Ÿ�� ����� ���� ���� ����� ����"<br>
"ü��, �ó���, ���� ��, �����̽� ���� �������� �Ʒθ�"<br>
"�̵�� �ٵ�, �ε巯�� ź������ ������ ��� �� �ִ� ����"<br>
"������ ��Ÿ���� ����� ���� ����"<br>
<p>-TASTING NOTE-</p>
��ũ ���� ������ ���̿÷� ���� ���. ü���� ���� ���� ���� ���� �������̰� �ð��� ������ �ó���, ���� ��, �����̽� ����� �ö�´�.
�Կ����� �ε巯�� ź���� �λ����� ������ ���� ���� �����̴�. ��� ���� ���� ���� �Բ� ������� ���� �� �ִ�.
��Ʃ, �ܹ���, ���� �߿丮, ����ġ�� ��� �� ��︰��.
');

insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(24000, 'WINE-0016', 'Domaine', '\resources\wine_images\2020\03\15\def32c96-401a-4aaf-8708-49654e5bcc99_202003111542252.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_def32c96-401a-4aaf-8708-49654e5bcc99_202003111542252.jpg', 
'white', 69000, 30, 
'<br>
<p>-TASTING NOTE-</p>
�� ��, ���, ��, ������ �Ʒθ��� �̾� �ƴϽ��� ���ʿ� ���� �̱����� ��ŷ� ��, ����� ��, �ٴҶ��� ���ӽ��� ��� �� �ִ�.<br>
�߰� ������ �굵�� �̵�� �ٵ��� �������ְ� �������� �̳׶���Ƽ�� ������ ����.<br>
�ν�Ʈ ġŲ, ��긦 ���� ���� �丮, ����Ÿ ġ��� �ñ�ġ�� ä�� ũ����, �׸� ������ �����̳� �����丮�� �Բ� ���� �����Ѵ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(180000, 'WINE-0017', 'Domain Denis Carre', '\resources\wine_images\2020\03\15\ddebfbf7f-4f25-44e5-8002-f4f7b6e868d8_20200311163342.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_debfbf7f-4f25-44e5-8002-f4f7b6e868d8_20200311163342.jpg', 
'white', 250000, 30, 
'<br>
<p>-TASTING NOTE-</p>
���� Ȳ�ݺ� ����� ��� �� ������ ���� �Ƹ��� ������� �׸��� ��Ʈ���� �迭�� �Ʒθ��� ���� �� �ִ�.<br>
�Ծȿ����� ǳ���� ������ �Բ� ��������� ǳ�̰� ��������, ����� �������� �� �ǴϽ��� �̾�����.<br>
���� ���ñ⿡�� ������ �����ε� �پ ����������� ���� �����̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(75000, 'WINE-0018', 'Olivier Tricon', '\resources\wine_images\2020\03\15\018f2694-104a-4741-b52a-ec58140ebe07_202003131546252.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_018f2694-104a-4741-b52a-ec58140ebe07_202003131546252.jpg', 
'white', 129000, 30, 
'<br>
<p>-TASTING NOTE-</p>
���� �ݻ� ���� �� ������ �̳׶���Ƽ�� �λ����̴�. <br>
������ ������ ��� �Բ� ��翡�� ���� �̳׶��� ����, �ϼ��� ǳ�̰� ���������� ��������. <br>
������ ��̿� �Բ� �ε巯��鼭�� �ż��� ǳ�̰� �Ծ��� ���Ѵ�.<br>
�׶� ũ�� ������� ���� �ణ ���ʿ� ��ġ���ִ�. �׶� ũ���� �������� ������ ������ ���� ���� �ϰ� ������ ���Ҿ� ���� ����Ƽ�� Ű�޸����� ����� ���ϰ� �־� �����̿� ũ��� �з��Ǿ���. 
���� ����Ǵ� 40���� ���� �����̿� ũ�� Ŭ���� �߿� ���� �����ϰ� �پ 3���� �����̿� ũ�� Ŭ���� �� �ϳ��̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(25000, 'WINE-0019', 'La Poda', '\resources\wine_images\2020\03\15\52281ed3-c04e-42d8-9a09-6896406cc1b4_202003111117102.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_52281ed3-c04e-42d8-9a09-6896406cc1b4_202003111117102.jpg', 
'white', 68000, 30, 
'<br>
<p>-TASTING NOTE-</p>
�׸����� ���� ������ ������� ���.<br>
���ַ� ������ ���� ȭ���ϰ� �ö���� �Ծȿ����� �ܴ��� �̳׶���Ƽ�� �Բ� �ѷ��� �굵�� �ణ�� ¬�ɸ��� ǳ�̸� ���ϰ� �־� �˹ٸ����� ��Ư�� ������ �и��ϰ� �����ش�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(20000, 'WINE-0020', 'Nox Blanco', '\resources\wine_images\2020\03\15\5bda5d11-27c5-4b6a-974a-6dbbbe546c45_201805171154152.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_5bda5d11-27c5-4b6a-974a-6dbbbe546c45_201805171154152.jpg', 
'white', 42000, 30, 
'"�����/���̿��𳪹� ��� ���� ����"<br>
"���ͱ��� ������ �߻����Ĺ� �� �ξ��� ��ȣ�� ȯ���ϴ� ���� ����"<br>
"�̱׷��� ������� ���� �ѽǴ�� �������� ȭ��Ʈ"<br>
"���� �߱����� �㿡 ���� ������"<br>
<p>-TASTING NOTE-</p>
�ܰ��� �ణ�� �ʷϺ��� ������ ��� ������ ��� ���� ���.
�⿡���� �ż��� ������ �߿����� ��Ʈ���� �迭�� ���� ����� �λ����̴�.
�Կ����� �ż��� �굵�� ���ο� �������� �������� �ָ� �ſ� ��������  ��Ÿ���̶� � ���Ŀ��� �� ��︮�� �����ַε� �ſ� ����.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(28000, 'WINE-0021', 'Chateau Rombeau', '\resources\wine_images\2020\03\15\cafe309b-8a23-4607-a9a8-b7ae1f3c3995_201805161646132.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_cafe309b-8a23-4607-a9a8-b7ae1f3c3995_201805161646132.jpg', 
'white', 62000, 30, 
'"������ �ְ� ���� �����ս��� �پ ȭ��Ʈ"<br>
"Ư�� �ƽþ� Ǫ��� �� ��︮�� �ŷ¸��� ���� ��õ"<br>
<p>-TASTING NOTE-</p>
�⿡������ �������� �����ϰ� �������� �ڸ���� �Բ� �ణ�� ȭ��Ʈ ���� �⵵ ��������. �� �ȿ����� ũ�����ϸ鼭�� �ణ�� ������ �������� �پ �������� �߶����� ��������.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(28000, 'WINE-0022', 'Domaine Rombeau IGP', '\resources\wine_images\2020\03\15\ee8d600f-c2e8-4dae-b129-758717a645b2_201805151827432.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_ee8d600f-c2e8-4dae-b129-758717a645b2_201805151827432.jpg', 
'white', 62000, 30, 
'"����� ���� ����, Organic Wine Certification Ecocert"<br>
"���� �챸�� �� ���� �������� ���Ӱ� �̱׷��� �� ������ ȭ��Ʈ"<br>
"������ �����鼭 ����� �������� ȭ��Ʈ"<br>
<p>-TASTING NOTE-</p>
���� ���� ���� ��� �� ������ ���� �챸�� ���� �� ���� �������� �Ʒθ��� �����δ�. �� �ȿ����� ������ϰ� �������� ǳ�̰� ��������. 
�̵�� �ٵ��� ȭ��Ʈ �������� ����� ��̿� ǳ���� ������, ������ �����鼭 ����� �������� ��������.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(380000, 'WINE-0023', 'Aile d��argent', '\resources\wine_images\2020\03\15\e3d1c0d1-ed25-4d6d-99b6-9c767862a89b_20180504171492.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_e3d1c0d1-ed25-4d6d-99b6-9c767862a89b_20180504171492.jpg', 
'white', 450000, 30, 
'"�޵� �׶�ũ�� Ŭ��� 1��� ���� ���� ��ĥ���� ȭ��Ʈ"<br>
"60�� �̸� ���Ե� ��������, ������ ȭ��Ʈ"<br>
"����� ���� ��õ, �ּ� 10~15�� ��������"<br>
<p>-TASTING NOTE-</p>
�ణ�� ��� ���� �ɵ��� Ȳ�ݻ��� �� ������ ���� ���� ��Ʈ���� ���� �� �ڷ� �鵵 �����ƿ� ���� ���� �Ʒθ��� ǳ�ܿ´�. 
���������� ������ �ƴϽ��� ���� ���� ���´�. ����� ��ũ ��� �Բ� ǳ���ϸ鼭�� �ſ� �������� ǳ�̰� ����, �챸 ǳ�̿� �Բ� �Ծ��� ��̰� ���ָ� �ǴϽ��� �ſ� ��� �Ծ� ����, ���� �ε巴�� ���ӵȴ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(14000, 'WINE-0024', 'CAMAS', '\resources\wine_images\2020\03\15\9653971f-0b5c-464c-b33b-a048a71b8bef_20160609958572.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_9653971f-0b5c-464c-b33b-a048a71b8bef_20160609958572.jpg', 
'white', 36000, 30, 
'"���� ���� ���� ��Ʈ���� ǳ�̰� ǳ���� �Һ� ���"<br>
"�̵�� ����Ʈ�� �ٵ��� �־� ��, �������� ����, �������̿� �� ��︮�� ȭ��Ʈ"<br>
<p>-TASTING NOTE-</p>
����� ���� ���� ��Ʈ���� �迭�� ���� �ְ� �ȴ�. ǳ���� �����̸� �� �ǴϽÿ��� �̳׶� ��ġ�� ��������.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(40000, 'WINE-0025', 'St. Francis w', '\resources\wine_images\2020\03\15\85e58590-f5da-402b-9b35-a44829ddc730_201701311214152.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_85e58590-f5da-402b-9b35-a44829ddc730_201701311214152.jpg', 
'white', 95000, 30, 
'"������ ���Ĵ��� �ҳ븶 �븮- �ſ� ���� ǰ���� �������� ��"<br>
"����ϸ鼭�� �Ʒθ�ƽ�� ��Ÿ��, 6���� ��ũ���� & ȿ�� ������ ���� ǳ���� ����"<br>
"Sonoma County Harvest Fair GOLD(2014)"<br>
"San Francisco Chronicle Wine Competition GOLD(2013)"<br>
<p>-TASTING NOTE-</p>
���� ���� �ݺ��� ��� ���� �������, ���� ����, �ڵο� �� �Ʒθ��� ȭ���ϰ� ���������ϴ�.
�Կ����� ���� ����� �� ���� ��������� �������� �ؽ��İ� �ε巴�� ǳ���ϸ� �ǴϽð� ��� �̾����ϴ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(38000, 'WINE-0026', 'Auslese', '\resources\wine_images\2020\03\15\6d589183-4797-4920-b583-23f8f97025dc_201508181713552.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_6d589183-4797-4920-b583-23f8f97025dc_201508181713552.jpg', 
'white', 90000, 30, 
'"������ �ְ�� ������ ���� �����켼�� �ƿ콺���� Noble Sweet"<br>
"����, Ȳ��, �챸�� ���� ���� ������ �Ʒθ��� ���, ����� �Ϻ��� ��ȭ"<br>
"����� ��Ģ�� ����ϴ� �����켾�� ��ǥ ������, �����ιķ�"<br>
<p>-TASTING NOTE-</p>
������ �Ʒθ��� ���ϰ� �������� �� ������ ������ ǰ������ ���������� �������� �챸�� �������� ���� ���ϰ� ��������.
�� �ȿ����� ���ߵ� �ְ� ǳ���� ���� ������ �ǴϽ��� �Բ� ���� �̾�����. ���ݵ� ����� ���ñ� ������ ���� 20������� ������ �����ϴ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(22000, 'WINE-0027', 'Montes Alpha', '\resources\wine_images\2020\03\15\f79a28e9-9622-47b8-9b75-2dd64a034554_201506021627592.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_f79a28e9-9622-47b8-9b75-2dd64a034554_201506021627592.jpg', 
'white', 48000, 30, 
'"ĥ�� ī����ī �븮���� ����� �������� ȭ��Ʈ ����"<br>
"ĥ���� �α� �귣�� ���׽� Montes"<br>
"��ũ���� �� �����ȿ�� ������ �ִ� ��Ÿ��"<br>
<p>-TASTING NOTE-</p>
�� ���� ���Ͽ��� ������ �ܰ� ���� ��Ⱑ ������ ��ũ ��� ���յǾ� ���� �ִ� ������ �ش�.
������ 70%�� �跲���� ��ȿ �� 1�Ⱓ ������ ��ũ�뿡�� �����Ͽ� ưư�ϸ� ������ ����� �����Ͽ���, �������� �����η��� ��ũ���� ��ȿ�Ͽ� �ż����� ���״�. 
���Ŀ� ��ü ������ 30%�� �����ȿ �Ͽ� �����Ӱ� ǳ���� ������ �ΰ����� Complexity�� �ο��Ͽ���.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(33000, 'WINE-0028', 'Sauvignon Blonde', '\resources\wine_images\2020\03\15\b483ddf1-8ab0-4366-892a-d29195400a1c_201505251335262.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_b483ddf1-8ab0-4366-892a-d29195400a1c_201505251335262.jpg', 
'white', 68000, 30, 
'"�ְ��� ��Ÿ ������ �շθ� ����ȭ�� ���� �ִ� �����ΰ� �̸�"<br>
"�� ���������� ���� ��ȣ������ ����� �޴� ����!"<br>
"�Һ� ��� Ư���� ���� ����, �ż��ϰ� ����� �Ʒθ��� ��"<br>
"����ö�� ��︮�� ȭ��Ʈ ����, ���ϸ� �������� ��õ!"<br>
<p>-TASTING NOTE-</p>
���� ��¤ ������ ���ο� �� ȭ��Ʈ ����. �������� �Һ� ������� ���� �� �ִ� �ż��� ���̿÷��� �پ��� ��� ���� �� ��췯�� �Ʒθ��� �λ����̴�.
����� ���� ǳ�̰� �����ϰ� �巯����. �ǴϽñ��� ����ϰ� �̾����� ���ϸ� �������� �δ���� ��� �� �ִ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(16000, 'WINE-0029', 'Queen Adelaide', '\resources\wine_images\2020\03\15\def9373b-2754-463a-a603-0287db24c013_201505221817542.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_def9373b-2754-463a-a603-0287db24c013_201505221817542.jpg', 
'white', 36000, 30, 
'"ȣ�� �ֵ鷹�̵��� ������ ����� ��ī�� ȭ��Ʈ"<br>
"�뿵���� �ô� ���� ����޴� ����, �� �ֵ鷹�̵� ��¡"<br>
"������ ��� �� �� �� ��� �ణ�� ź���� �������� ��ŭ�� ��"<br>
<p>-TASTING NOTE-</p>
������ �����ִ� ���ο� ����. �����ϸ鼭�� ������ �굵�� �����Ǿ� �ܸ��� ���� ���� �ʰ� ����� ������ �ش�. ������ ������ �� ��ŭ�ϰ� �ż��ϴ�.
������ ���� �� �� ��⸦ ��� �� ������ �ణ�� ź��� ��ŭ��, ������ ������ �������� �����̴�. �����ֳ� ���丮Ƽ��, ���ÿ� �Բ� ���� ���� �����̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(22000, 'WINE-0030', 'MORANDE', '\resources\wine_images\2020\03\15\9ef3abd1-9067-46c0-afbe-451f576f8460_201505201620132.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_9ef3abd1-9067-46c0-afbe-451f576f8460_201505201620132.jpg', 
'white', 46000, 30, 
'"ĥ�� ��� ������ ��������, ��� �����"<br>
"������ �ִ� ������� ����� ��ȭ. ������, ��Ʈ����, �ż��� ������"<br>
"���ݴ�� �Ǹ��� ǰ���� �Һ� ���! ����ϰ� ��ŭ�� ��Ÿ��"<br>
<p>-TASTING NOTE-</p>
�ſ� ���� ������ �׸� ��ġ�� ���ο� ����. �������� ��ð� ���� �ż��� ��, �ڸ��� ��Ʈ����, ���� ������ ������ ���� ǳ�̰� �������� �Կ����� �ż��� ��̰� ����ϰ� �������ش�.
� ��ä�丮, ����, ������ ��, ������͵� �Ϻ��� ��Ī�� �����ش�.
');

insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(25000, 'WINE-0031', 'Les Muraires', '\resources\wine_images\2020\03\15\c901e9ef-378f-4451-8f92-397538ad713d_201702281639562.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_c901e9ef-378f-4451-8f92-397538ad713d_201702281639562.jpg', 
'rose', 53000, 30, 
'"������ �λ��� �ǹ��ϴ� �ξ� �� Douce Vie"<br>
"�������� ���ι潺 ��������, ������ ���� ���� ��� �ż��� �����"<br>
"���� ī����ġ���� ���� ������, ���� Ÿ��Ʈ �� � ���Ŀ��� ������ ����ּ���"<br>
<p>-TASTING NOTE-</p>
�����ϰ� ��� ������ ��ũ���� ��� �������� ������ ���� ����(����, �����)�� ���� �������� ���� �߶��� �굵�� �ż����� �����δ�. ���� ī����ġ���� ������, �׸��� ���� �����͵� �� ��︮�� ���� Ÿ��Ʈ�͵� ȯ���� ��ȭ�� �̷��.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(10000, 'WINE-0032', 'Realce', '\resources\wine_images\2020\03\15\375105ca-4f75-4f6f-985d-00b62fcebc30_201602181533442.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_375105ca-4f75-4f6f-985d-00b62fcebc30_201602181533442.jpg', 
'rose', 24000, 30, 
'"�Ƹ��ٿ� ���� ��� ���� ����"<br>
"������� ���� ���� �������� ����"<br>
<p>-TASTING NOTE-</p>
���� ��ȫ���� ���. ������� ���� ���� �������̸� �������� �ż��� ���� ���� ���� ������ ���� �ŷ����� �����̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(65000, 'WINE-0033', 'NV Villa Crespia', '\resources\wine_images\2020\03\15\c92d570f-d9f6-4459-813c-d410750a108c_201505111514442.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_c92d570f-d9f6-4459-813c-d410750a108c_201505111514442.jpg', 
'rose', 100000, 30, 
'"������ ���������� ���� ��Ż���� ��� ����Ŭ�� ����, ����ġ���ڸ�Ÿ"<br>
"�������� & �ǳ봩�� ����. ǳ���� �ٵ�� ��, ��Ʈ����, Ŀ��, �����̽� ǳ��"<br>
"ũ������ ������ ����, ����Ʈ�� ����� ����Ŭ�� ����"<br>
"2014 Decanter World Wine Awards - Silver ����"<br>
<p>-TASTING NOTE-</p>
���� ũ�����Ǿ� ��ѷ����� ����ġ���ڸ�Ÿ ���� ����Ʈ�� ����, �ǳ봩�ƿ� �������� ������ ���� ���� �������� ǳ���� �Ʒθ��� �ϼ��ߴ�. 
���Ӿ��� �ö���� ������ �Ǹ��ϸ� �׸�, ��Ʈ���� ���ϰ� ���� ������� ��̴� ���ο� �ż����� �ο��Ѵ�. �� �ȿ��� �������� �� ������ ���� �����̽��� ǳ�̴� �� ���� ����ġ���ڸ�Ÿ�� �ɸ��͸� ���� ǳ���ϰ� ����ϰ� ����� �ش�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(25000, 'WINE-0034', 'Le Retour Rose', '\resources\wine_images\2020\03\15\97381dd1-5192-4f80-865e-29150b866442_201504291659152.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_97381dd1-5192-4f80-865e-29150b866442_201504291659152.jpg', 
'rose', 60000, 30, 
'"���� �а� ���ι潺�� ��⸦ ���� ���� ����"<br>
"�� ��, ����, �ణ�� ���߿� ���� �����̽�, �����ϰ� �� �ǴϽ�"<br>
"�Ƹ��ٿ� ������������ �����鿡�� �αⰡ ���� ����"<br>
<p>-TASTING NOTE-</p>
�Ƹ��ٿ� ���ο���� ���� �� ���� ��� ���� ���� ��ȭ�� �̷��, ���߿� �ణ�� �����̽� ǳ�̵� ��������.
������ ������ ������ �̾����� �� �ǴϽ��� �λ����̴�. �� 4~8�ɿ��� ���� ���� ����.
���� ������ ���� ���ΰ� ȭ��Ʈ ������ ������ Ư¡�� ��� ������ �ֱ� ������ �Ļ� �� � ���İ��� �� ��︱ �� �ִ�  ���� ���ͳ��̳�,���̺� ���ζ�� �� �� �ִ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(175000, 'WINE-0035', 'Cuvee 555 Brut', '\resources\wine_images\2020\03\15\72b05f24-18a2-47c9-bebb-03e0cb569af2_2018051517102.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_72b05f24-18a2-47c9-bebb-03e0cb569af2_2018051517102.jpg', 
'champagne', 220000, 40, 
'"�������� 100%, 15~20��� �θ����� �õ� ��ũ�跲�� 4~6���� ������ ������"<br>
"6~7�Ⱓ�� ȿ������ ����������, �������� ũ�迡 �����ʴ� �ֻ��� ������"<br>
"ǳ���ϰ� ��ġ�ϰ� ���������� ������"<br>
<p>-TASTING NOTE-</p>
�ſ� ��ġ�ϰ� ���� �ִ� �������̸�, ���� ��, �긮����, ����Ʈ �����̽�, ���� ������ ���� �߰���, ��Ƽ�� ī���� ���� ǳ���� ���� ��������. 
�ſ� �����ϰ� ���ִ� ����� �������� ���, ���� ������ �پ �������̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(155000, 'WINE-0036', 'Curvee Rose Brut NV', '\resources\wine_images\2020\03\15\2df00bee-169d-4d93-a18b-fe5eeb08eb35_20150421155072.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_2df00bee-169d-4d93-a18b-fe5eeb08eb35_20150421155072.jpg', 
'champagne', 200000, 40, 
'"���Ĵ��� �׶�ũ�� RM �ζ�� ������"<br>
"�������׿� �ǳ봩�Ƹ� �ҷ� ������ ���� ������"<br>
"������ũ �迭�� �Ƹ��ٿ� Į��� �ε巴�� �ż��� ����� �Ʒθ�"<br>
<p>-TASTING NOTE-</p>
�Ƹ���� ����� ���ο� ��ũ�� Į��. ���������� �ö���� ������ ����� �Բ� ����, �����, ü���� �Ʒθ��� �����δ�. 
87%�� �������׿� 13%�� �ǳ봩�Ƹ� ������ ���� ���� ����������, �ſ� �ε巴�� �ż��ϴ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(145000, 'WINE-0037', 'Curvee Reserve', '\resources\wine_images\2020\03\15\d2b04685-7d8b-4ce4-bb94-fba8846e257a_20150421158202.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_d2b04685-7d8b-4ce4-bb94-fba8846e257a_20150421158202.jpg', 
'champagne', 180000, 40, 
'"���Ĵ��� �׶�ũ�� RM �ζ�� ������"<br>
"����ϰ� ��ŭ�� �������� ������, ������� �� ��Ʈ����, �佺Ƽ�� ǳ�̱���"<br>
<p>-TASTING NOTE-</p>
����Ʈ�� ���ο� �׸� �÷�. �����ϰ� ������ ����. ���� ���ϰ� ��Ʈ, �ڸ�, �ܰ� �ø����� �Ʒθ��� �����̸�, �ż��� ù���� ũ������ ������ �λ����̴�. 
�굵�� ���� ǳ�̿� ��ȭ�� �̷�� �� ������ �����. �� ������� �������� ��� �� ��� ������.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(12000, 'WINE-0038', 'Jacqueline', '\resources\wine_images\2020\03\15\939ced67-4b6f-4211-a62d-65958248b051_20150428135192.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_939ced67-4b6f-4211-a62d-65958248b051_20150428135192.jpg', 
'sparkling', 38000, 40, 
'"������ �ְ��� �ַ�����ȸ�� Camus ����"<br>
"�ణ�� �� ���� �Բ� ǳ���� ����, ������ ����Ŭ�� ����"<br>
"��Ƽ�� ���� ����Ŭ�� ���� ��õ, Ĭ���� ���̽� �� ��õ"<br>
<p>-TASTING NOTE-</p>
���� ������ Ȳ�� ���� ������ ������ �����̴� ����Ŭ�� ����. �ż��� ���� ���� �����̴µ� Ư�� ����� ���� �Ƹ���� �Ʒθ��� �ε巯����. 
��Ʈ���� ��, �߶��� �� ��Ⱑ �� �ȿ� �������� �ǴϽ����� ������鼭�� �ణ�� �� ���� ��� ���� ����� �ִ� �����̴�. ��Ƽ�� �������� ��𿡼��� ���� �� �ִ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(20000, 'WINE-0039', 'La Tordera', '\resources\wine_images\2020\03\15\f291fa82-7097-413c-b4d8-f4af98c8b5bd_20150723133372.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_f291fa82-7097-413c-b4d8-f4af98c8b5bd_20150723133372.jpg', 
'sparkling', 58000, 40, 
'"���¸� �ϵ��� �������� ����Ŭ�� ����, ���μ���"<br>
"���� �������� û���, ���, �����, ������ ������� ��"<br>
"������ ������ �ִ� ������ �ణ�� ����� ��ȭ"<br>
"��������� ������ ���� ���μ���"<br>
<p>-TASTING NOTE-</p>
�ŷ����� ������ ���� ���� �����̴�. �⿡������ ������� ����, �ڵ�, �����, ��÷�, ������(���), ���� ���� �Ʒθ��� ��������, �������� ���� �絵�� �ż����� ��ȭ�� �̷��. 
������ �ż��ϰ� ���� ���� ���μ��ڷ� ���� ��õ!
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(15000, 'WINE-0040', 'La Tordera, Alne', '\resources\wine_images\2020\03\15\dd273d7a-a1d7-4c91-bb3f-e81a8cfa3e84_20150723149412.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_dd273d7a-a1d7-4c91-bb3f-e81a8cfa3e84_20150723149412.jpg', 
'sparkling', 48000, 40, 
'"���¸� �ϵ��� �������� ����Ŭ�� ����, ���μ���"<br>
"û���, ��, �ٴҶ� ���� �ż��� �Ʒθ�"<br>
"�������� �� ������ ���μ��� ��Ÿ�Ϸ� �����ַ� ��õ"<br>
<p>-TASTING NOTE-</p>
��¤ ���� ��� �ణ�� ����� ���. �ʷ� ���, ��, ���, �ٴҶ� ���� ��췯���� ������ �ż��ϰ� �������� ǳ���� �Ʒθ��� �λ����̴�. 
����� �ǳ׽��� �Բ� �������� ������ ���ӵȴ�. ���䷹Ƽ���� ��︮�� �������� ���μ��� ��Ÿ���̸� �����䳪 ����Ÿ�� ���� ���İ� �� ��︰��.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(235000, 'WINE-0041', 'Millesime 2005', '\resources\wine_images\2020\03\15\065f030d-3b3a-4271-9ec2-65cc3af6c480_201504211446352.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_065f030d-3b3a-4271-9ec2-65cc3af6c480_201504211446352.jpg', 
'champagne', 275000, 40, 
'"���Ĵ��� �׶�ũ�� RM �ζ�� ������"<br>
"30~50�� ������ ��񿡼� ���� ��������, �ֻ��� �������� ������"<br>
"����, ����, ���� ��𿡳� ��︮�� �̽� ������"<br>
<p>-TASTING NOTE-</p>
�ż��ϰ� ����� �������� �������� �����ϴ� �ζ�� ���̳ʸ� �ƽ����� ���� ����� ��Ƽ�� ������. 
30~60�� ������ ��񿡼� ���� �������׷� �����Ǿ� ǳ���� �굵�� ����, �����ƿ� ���� ����� �Ʒθ�, �̳׶��� ��췯����. ������ �ſ� ���, ������ �� �ƴ϶� �����丮, 
������ �Բ��ϴ� ������, ����Ʈ ���������α��� �پ��� ������ �س���.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(10000, 'WINE-0042', 'Mosto d"Uva Rosso', '\resources\wine_images\2020\03\15\d5aad6c8-ef77-4d1b-8e40-a7e1762584cd_201505151723202.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_d5aad6c8-ef77-4d1b-8e40-a7e1762584cd_201505151723202.jpg', 
'sparkling', 32000, 40, 
'"�̵�� ����Ʈ�� ����ϰ� ������ ��� �� ���� ����Ŭ��"<br>
"������ ���� �� ������(����)�� �⿬"<br>
"�����鿡�� �α� �ְ��� ���� �ν�"<br>
<p>-TASTING NOTE-</p>
��� ���� ���� ��� �������� ��ŭ�� ������ ǳ�̿� ������ ���� �� ��췯����. 
������ ������ �ŷ����� �������� �������� �ǿ����� ���� �����̻��� ����� �����ְ� �ִ�. 6~8���� ������ ĥ���ؼ� ���ø� ���� ���ִ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(43000, 'WINE-0043', 'Moet & Chandon', '\resources\wine_images\2020\03\15\2d4d3a82-55a5-4dc0-a12e-ab51223860a2_201505291156482.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_2d4d3a82-55a5-4dc0-a12e-ab51223860a2_201505291156482.jpg', 
'champagne', 80000, 40, 
'"���迡�� ���� �α� �ְ� ������ �귣�� ������"<br>
"���������� ���� �αⰡ ���� ������ �� �ϳ�"<br>
"�������˰� ����15���� ���� ����ߴ� ������"<br>
<p>-TASTING NOTE-</p>
��� ���ο� ���� �����ϰ� �̼��� ������ ���Ӿ��� �ö�´�. ��, ��� ���� �� ���� ���� �ٴҶ�, ������Ű�� ���� ������ 2����ȿ ���� ��������. 
ǳ���� ������̿� �佺Ƽ�� ���� �ſ� �� ��췯����. ǳ�̰� �������� ���ӵǸ� �� �ȿ����� ������ ��ĥ�� �ʰ� �ε巴�� ũ������ ��������. 
�����ַε� ������ ����/���Ŀ��� �ջ��� ���� ��Ƽ �������̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(110000, 'WINE-0044', 'Bollinger', '\resources\wine_images\2020\03\15\8433d929-83a2-4d0d-b6c7-3fe5b5453d06_201505311433172.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_8433d929-83a2-4d0d-b6c7-3fe5b5453d06_201505311433172.jpg', 
'champagne', 152000, 40, 
'"007�ø����� ���ӽ� ���尡 ��ܸ��� ������"<br>
"������������ ���簡 ������ ��ǰ ������"<br>
"�ǳ� ������ �Է��� ���� �ٵ������鼭 ���չ� ���� ������"<br>
<p>-TASTING NOTE-</p>
��� ������ ���� Ȳ�ݻ��� ��� ������ ����ϰ� �̼��� ������ ���Ӿ��� �ö�´�. 
����, �̳׶��� �̽�Ʈ�� ���� �ε巯���� ��Ÿ���� �������� ��Ư�� ��Ÿ���� �ٵ��� ���ϰ� ������ ���Ӿ��� �ö���� ������ ���� �� �Ӹ� �ƴ϶� ���� ��ſ���� ������ �ش�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(12000, 'WINE-0045', 'Saomi Prosecco', '\resources\wine_images\2020\03\15\cc21ceec-4d11-4137-a830-410ca5149b92_201507231415222.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_cc21ceec-4d11-4137-a830-410ca5149b92_201507231415222.jpg', 
'sparkling', 48000, 40, 
'"���¸� �ϵ��� �������� ����Ŭ�� ����, ���μ���"<br>
"û���, ���, �ٴҶ�� ��ī�þ� �� ���� ������ ���� ��Ÿ��"<br>
"�Ϲ����� ���μ��ں��� �� ���ߵ� ���� ��Ÿ�Ϸ�, �����ַ� ������õ"<br>
<p>-TASTING NOTE-</p>
���� ���� ���̴�. ����Ƽ�ϸ� ������ ���, ������ ��� ���� ���ϰ� ���� �ణ�� �ٴҶ�� ��ī�þ� �� ���� ��������. �������� ���� Ư���� �ż��ϰ� ����Ƽ�� �ȷ�Ʈ�� Ư¡���̴�. 
�Ϲ����� ���μ��� ���ٵ� ���ߵ��� ����. �̵�� �ٵ� ������ ���� ���̰�, ����� �ǳ׽��� �������� ���ӵȴ�. ���丮Ƽ��(������)�� �����̸� ������ ����� ù �ڽ� �丮�͵� �� ��︰��.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(16000, 'WINE-0046', 'Brunei Prosecco', '\resources\wine_images\2020\03\15\03df8b3e-017c-41f3-9588-9d7bbfb1a80c_201507231420292.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_03df8b3e-017c-41f3-9588-9d7bbfb1a80c_201507231420292.jpg', 
'sparkling', 53000, 40, 
'"���¸� �ϵ��� �������� ����Ŭ�� ����, ���μ���"<br>
"û���, ��ġ, ��, �ڽ��� ���� �Ʒθ��� ���ߵ� ���� ��"<br>
"���İ� �Բ��� �ƴ� ���θ� ��ܵ� ���ִ� ��Ÿ��"<br>
<p>-TASTING NOTE-</p>
���� ���� ���� ���. ������ ������ ���� ���� ��ȭ�� �̷�� �ż��� ��, �ʷ� ���, ��ġ, �鸮��, �ڽ��� �� �Ʒθ��� �λ����̴�. 
�������� ��� ���� ���ϸ� �ż��ϰ� ������ �� �����ְ� �ż��� �굵�� ��������. ���θ� ��ܵ� ����� ��� �� �ִ� ���ִ� ���μ��ڴ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(12000, 'WINE-0047', 'Marrugat', '\resources\wine_images\2020\03\15\4d0a2f01-c0e6-4025-9a88-7a08aa365b64_201507231452102.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_4d0a2f01-c0e6-4025-9a88-7a08aa365b64_201507231452102.jpg', 
'sparkling', 47000, 40, 
'"�����ι������ ����� �������� ����Ŭ�� ����, CAVA"<br>
"������ ����� �ŷ��� ��Ҵ��� ���ݴ�� ������õ ���"<br>
"�ż��� �������� ��ġ�� ������ ��Ÿ��"<br>
<p>-TASTING NOTE-</p>
������ ���� Ȳ�ݻ��� ��� ����� �� ��, �� ��Ⱑ ��������. �̳׶��� �굵�� ��ȭ�� �̷�� �ż��ϰ� ������ ���� �ð� ���ӵȴ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(22000, 'WINE-0048', 'Marrugat Gran', '\resources\wine_images\2020\03\15\595df751-3523-4466-8b1e-ff38ea427071_201607081134172.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_595df751-3523-4466-8b1e-ff38ea427071_201607081134172.jpg', 
'sparkling', 66000, 40, 
'"�����ι������ ����� �������� ����Ŭ�� ����, CAVA"<br>
"������ ����� �ŷ��� ��Ҵ��� �� ǰ�� ��Ƽ�� ���, ������õ"<br>
"������ ������ ���Ƿ��� ǳ���ϰ� �ż��� ǳ��, ������"<br>
<p>-TASTING NOTE-</p>
���� �ݺ� ���� ���. ������ ������ ��� �ö���� ���� �� ǥ�鿡 �հ� ����� �׸���. �⿡���� 2�� ��ȿ�� �������� �����Ǹ� ������ ��Ư�� �Ʒθ��� �λ����̸� ���� �ż��� ���Ƿ��� ����� ��������. 
���� �������� �������� ��� ���� �������� �������� ����� �پ �������� �����ش�. �Կ����� �����ϸ� ���� Ƣ�� �굵�� �ż����� ������ ���ش�. �ǴϽð� ��� �������� �پ �����̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(90000, 'WINE-0049', 'Voirin-Jumel', '\resources\wine_images\2020\03\15\508d2f5d-398c-4a3d-8578-860c8e5b1eaf_201805091217172.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_508d2f5d-398c-4a3d-8578-860c8e5b1eaf_201805091217172.jpg', 
'sparkling', 130000, 40, 
'"�׶�ũ�� �����翡�� ���� ����� ������ �����ϴ� RM �������Ͽ콺"<br>
"���� Ŭ������ ������ ��, ��� Ʈ���ÿ�"<br>
<p>-TASTING NOTE-</p>
����, ������ ��, �� ���� ��� �� �� ����Ƽ�� ���� ���� ���� �������̴�. �����ϴ� �ڸ��� Ĭ���� ��Ƽ �� � ��Ȳ������ �� ��︮��, ������Ӱ� �ż��� �Ƹ��, ������ ����� ���� ��������. 
������ �ſ� �����ϰ� �����ϸ� ũ������ ������ ����ϴ�. �����ַ� ��õ�Ҹ��ϴ�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(130000, 'WINE-0050', 'Voirin-Jumel Rose', '\resources\wine_images\2020\03\15\af028dec-ff80-4082-9720-4aa1858d79cb_201805151525432.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_af028dec-ff80-4082-9720-4aa1858d79cb_201805151525432.jpg', 
'sparkling', 170000, 40, 
'"�ǳ봩�� 100%, ������ ���� ħ������ ���� �ڿ������� �� ������ �ŷ����� ����"<br>
"���� �������� ����� �ڵ���� ��, �����ϰ� ����� ���� ������"<br>
<p>-TASTING NOTE-</p>
��Ȥ���� ü�� �� ���� �÷� �ǳ봩�� 100% Saignee(���Ͽ�)������� ���������� ħ��ð��� ����� ���� �����Ͽ� ���� ������ ���� �÷��� �����. 
ȭ��Ʈ �����ο� ���� ���� ��� ǳ���� ��� ������ �����ָ�, ����, ü��, ����� ��� ����� �����ϰ� �Ǿ�ϴ� ����� �������̴�.
');
insert into tbl_wine(wine_cost, wine_code, wine_name, wine_img, wine_thumbimg, wine_type, wine_price, wine_stock, wine_info)
values(340000, 'WINE-0051', 'Millesime d"Exception 2002', '\resources\wine_images\2020\03\15\5594881e-eea4-415b-804c-34421688c7f5_201805151716122.jpg', 
'\resources\wine_images\2020\03\15\thumb\thumb_5594881e-eea4-415b-804c-34421688c7f5_201805151716122.jpg', 
'champagne', 400000, 40, 
'"�������� 100%�� �׶�ũ�� ������"<br>
"2002�� ������ Great Vintage ��, Ready to Drink �ֻ��� ������� ���� ������"<br>
"�� ��, �챸, �긮����, ���� �� �� ���չ� ��ġ�� ǳ���� �ŷ����� ��Ƽ�� ������"<br>
<p>-TASTING NOTE-</p>
RM ������ �Ͽ콺 ���ƶ� ����� �׶�ũ�� �ñ״��� ��Ƽ�� ������ �� ��, ���� ��, ������ ����, ���� �߰��� ���� ��� �������� ��� �Բ� ������ ���� ��ġ�� ������ ����� �Ծ��� �����ϰ� ����� �ִ� ���, 
�ٵ��� ������ �������� �̷��. �Ϻ��� ��������� ������ ��Ƽ�� �������� ��� �������� �����ش�.
')


========================= ��ǰ ��� �� =============================
--sql ���� --------------------------------------------------------

// ��ǰ �����Ҷ�
delete from tbl_wine where wine_code = 'w000'
select wine_code from tbl_wine
delete * from tbl_wine

<�߸� ��������� ����ϼ���>
drop table tbl_member
DROP TABLE tbl_wine CASCADE CONSTRAINTS    //�ܷ�Ű�� ����ȵɶ�

<���� �� ��� ���̺� Ȯ��>
select * from tab

<���̺� ���� ����> ## cmdâ������ ���� ##
desc tbl_wine

<�÷� �߰�>
alter table tbl_member add(mem_address1 varchar2(50))

<�÷� �Ӽ� ��ü>
alter table tbl_member modify(mem_name varchar2(50))
alter table tbl_wine modify(wine_stock default 1)

<�÷� ����>
alter table tbl_wine drop column wine_img

commit
