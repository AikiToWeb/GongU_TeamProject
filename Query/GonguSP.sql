use gongu;

-- 회원 가입 프로시저 : sp_member_insert
drop procedure if exists sp_member_insert;
delimiter $$
create procedure sp_member_insert(miid varchar(20), mipw varchar(20), 
miname varchar(20), miemail varchar(50), miisad char(1), miphone varchar(13), 
miprofile varchar(50), mistamp int)
begin
	insert into t_member_info (mi_id, mi_pw, mi_name, mi_email, mi_isad, mi_phone, mi_profile, mi_stamp) 
	values (miid, mipw, miname, miemail, miisad, miphone, miprofile, mistamp);
end $$
delimiter ;

call sp_member_insert('test', '1111', '백종원', 'test@naver.com', 'y', '010-1234-5678', '', 0);
select * from t_member_info;



-- 상품관리(등록, 수정 포함) 프로시저 : sp_room_manage
drop procedure if exists sp_room_manage;
delimiter $$
create procedure sp_room_manage(kind char(1), riid	char(5), riname	varchar(30), ricata	varchar(10), ristock int, riprice int, rititle varchar(30), risubtitle varchar(30), 
	rihash	varchar(50), rireview	int, riscore	float, rizzim	int, riimg1	varchar(50), riimg2	varchar(50), riimg3	varchar(50), riimg4	varchar(50),
	riimg5	varchar(50), rimin	int, rimax	int, ristart	int, riend	int, ritel	varchar(13), abid	char(2), asid	char(4), riaddr1	varchar(30),
	riaddr2	varchar(30), rimapurl	varchar(100), riinfo	text, riintro	text, riwarning	text, rirefundimg	text, aiidx	int)
begin
	if kind = 'i' then		-- 상품 등록일 경우
	   insert into t_room_info (ri_id, ri_name, ri_cata, ri_stock, ri_price, ri_title, ri_subtitle,  
			ri_hash, ri_review, ri_score, ri_zzim, ri_img1, ri_img2, ri_img3, ri_img4, ri_img5,
            ri_min, ri_max, ri_start, ri_end, ri_tel, ab_id, as_id, ri_addr1, ri_addr2, ri_mapurl,
            ri_info, ri_intro, ri_warning, ri_refundimg, ai_idx)
       values (riid, riname, ricata, ristock, riprice, rititle, risubtitle, rihash, rireview, riscore, rizzim, riimg1, riimg2, riimg3, riimg4, riimg5,
            rimin, rimax, ristart, riend, ritel, abid, asid, riaddr1, riaddr2, rimapurl, riinfo, riintro, riwarning, rirefundimg, aiidx);
            
	elseif kind = 'u' then	-- 상품 정보 수정일 경우
		update t_room_info set ri_name = riname, ri_cata = ricata, ri_stock = ristock, ri_price = riprice, ri_title = rititle, ri_subtitle = risubtitle, ri_hash = rihash,
			ri_img1 = riimg1, ri_img2 = riimg2, ri_img3 = riimg3, ri_img4 = riimg4, ri_img5 = riimg5, ri_min = rimin, ri_max = rimax,
			ri_start = ristart, ri_end = riend, ri_tel = ritel, ab_id = abid, as_id = asid, ri_addr1 = riaddr1, ri_addr2 = riaddr2, 
            ri_mapurl = rimapurl, ri_info = riinfo, ri_intro = riintro, ri_warning = riwarning, ri_refundimg = rirefundimg 
		where ri_id = riid;
	end if;
end $$
delimiter ;

-- ri_id, ri_name, ri_cata, ri_stock, ri_price, ri_title, ri_subtitle,  ri_hash, ri_review, ri_score, ri_zzim, ri_img1, ri_img2, ri_img3, ri_img4, ri_img5, 
-- ri_min, ri_max, ri_start, ri_end, ri_tel, ab_id, as_id, ri_addr1, ri_addr2, ri_mapurl, ri_info, ri_intro, ri_warning, ri_refundimg, ai_idx
SET FOREIGN_KEY_CHECKS = 0;



-- 파티룸 생성

-- 강남(A1) 역삼동(AA01)
call sp_room_manage('i', 'AAA01', '테스트 파티룸01', '파티룸', 1, 10000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA01', '강남', '역삼동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);
call sp_room_manage('i', 'AAA02', '테스트 파티룸02', '파티룸', 1, 15000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA01', '강남', '역삼동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);
call sp_room_manage('i', 'AAA03', '테스트 파티룸03', '파티룸', 1, 20000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA01', '강남', '역삼동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);    
call sp_room_manage('i', 'AAA04', '테스트 파티룸04', '파티룸', 1, 18000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA01', '강남', '역삼동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);    
call sp_room_manage('i', 'AAA05', '테스트 파티룸05', '파티룸', 1, 18000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA01', '강남', '역삼동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);
call sp_room_manage('i', 'AAA06', '테스트 파티룸06', '파티룸', 1, 22000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA01', '강남', '역삼동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);    
call sp_room_manage('i', 'AAA07', '테스트 파티룸07', '파티룸', 1, 25000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA01', '강남', '역삼동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);
call sp_room_manage('i', 'AAA08', '테스트 파티룸08', '파티룸', 1, 12000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA01', '강남', '역삼동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);
call sp_room_manage('i', 'AAA09', '테스트 파티룸09', '파티룸', 1, 25000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA01', '강남', '역삼동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);
    
-- 강남(A1) 삼성동(AA02)
call sp_room_manage('i', 'AAA10', '테스트 파티룸10', '파티룸', 1, 30000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA02', '강남', '삼성동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);
call sp_room_manage('i', 'AAA11', '테스트 파티룸11', '파티룸', 1, 30000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA02', '강남', '삼성동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);
call sp_room_manage('i', 'AAA12', '테스트 파티룸12', '파티룸', 1, 30000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA02', '강남', '삼성동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);
call sp_room_manage('i', 'AAA13', '테스트 파티룸13', '파티룸', 1, 30000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA02', '강남', '삼성동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);
call sp_room_manage('i', 'AAA14', '테스트 파티룸14', '파티룸', 1, 35000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA02', '강남', '삼성동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);    
    
-- 강남(A1) 서초동(AA03)
call sp_room_manage('i', 'AAA15', '테스트 파티룸15', '파티룸', 1, 35000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA03', '강남', '서초동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);    
call sp_room_manage('i', 'AAA16', '테스트 파티룸16', '파티룸', 1, 35000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA03', '강남', '서초동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);    
-- 강남(A1) 대치동(AA04)
call sp_room_manage('i', 'AAA17', '테스트 파티룸17', '파티룸', 1, 35000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA04', '강남', '대치동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);    
call sp_room_manage('i', 'AAA18', '테스트 파티룸18', '파티룸', 1, 35000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'A1', 'AA04', '강남', '대치동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);    

-- 신촌(B1) 창천동(BB01)
call sp_room_manage('i', 'AAA19', '테스트 파티룸19', '파티룸', 1, 10000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'B1', 'BB01', '신촌', '창천동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);    
call sp_room_manage('i', 'AAA20', '테스트 파티룸20', '파티룸', 1, 12000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'B1', 'BB01', '신촌', '창천동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);   
call sp_room_manage('i', 'AAA21', '테스트 파티룸21', '파티룸', 1, 5000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 10, 9, 23, '010-1111-1111', 'B1', 'BB01', '신촌', '창천동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);   
call sp_room_manage('i', 'AAA22', '테스트 파티룸22', '파티룸', 1, 20000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 30, 9, 23, '010-1111-1111', 'B1', 'BB01', '신촌', '창천동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);   
-- 신촌(B1) 서교동(BB02)
call sp_room_manage('i', 'AAA23', '테스트 파티룸23', '파티룸', 1, 50000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 50, 9, 23, '010-1111-1111', 'B1', 'BB02', '신촌', '서교동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);   
call sp_room_manage('i', 'AAA24', '테스트 파티룸24', '파티룸', 1, 30000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 60, 9, 23, '010-1111-1111', 'B1', 'BB02', '신촌', '서교동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1); 
call sp_room_manage('i', 'AAA25', '테스트 파티룸25', '파티룸', 1, 25000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 50, 9, 23, '010-1111-1111', 'B1', 'BB02', '신촌', '서교동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1);   
call sp_room_manage('i', 'AAA26', '테스트 파티룸26', '파티룸', 1, 100000, '파티룸 대제목', '파티룸 소제목', '#파티룸 #테스트', 0, 0.0, 
	0, '', '', '', '', '', 1, 100, 9, 23, '010-1111-1111', 'B1', 'BB02', '신촌', '서교동', '', '공간소개글', '시설안내글', '유의사항글', '환불정책', 1); 
select * from t_room_info; 

-- 대분류
insert into t_area_big (ab_id, ab_name) values ('A1', '강남');
insert into t_area_big (ab_id, ab_name) values ('B1', '신촌');
select * from t_area_big;

-- 소분류
-- 강남
insert into t_area_small (as_id, ab_id, as_name) values ('AA01', 'A1', '역삼동');
insert into t_area_small (as_id, ab_id, as_name) values ('AA02', 'A1', '삼성동');
insert into t_area_small (as_id, ab_id, as_name) values ('AA03', 'A1', '서초동');
insert into t_area_small (as_id, ab_id, as_name) values ('AA04', 'A1', '대치동');
select * from t_area_small;

-- 신촌
insert into t_area_small (as_id, ab_id, as_name) values ('BB01', 'B1', '창천동');
insert into t_area_small (as_id, ab_id, as_name) values ('BB02', 'B1', '서교동');
select * from t_area_small;


select a.*, b.ab_id, b.ab_name, c.as_name  
from t_room_info a, t_area_big b, t_area_small c  
where a.as_id = c.as_id and b.ab_id = c.ab_id  order by ri_id desc limit 0, 8;

-- 카테고리


