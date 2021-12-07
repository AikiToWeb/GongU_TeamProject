use gongu;

-- 관리자 정보 테이블
create table t_admin_info (
   ai_idx   int    unique auto_increment,         	-- 일련번호
   ai_id   varchar(20)   primary key,         		-- 아이디
   ai_pw  varchar(20)   not null,            		-- 비밀번호
   ai_name varchar(20) not null,            		-- 이름
   ai_date   datetime default now(),            	-- 등록일
   ai_grade char(1) default '1'            			-- 관리자 등급 1, 2
);

-- 관리자 로그인 정보 테이블
create table t_admin_login (
   al_idx int primary key auto_increment,  	 		-- 일련번호 (PK)
   ai_idx int,                           			-- 관리자 번호 (FK)
   al_ip varchar(15) not null,               		-- 로그인 IP주소
   al_date   datetime default now(),            	-- 로그인 일자
   constraint fk_login_ai_idx foreign key (ai_idx) references t_admin_info(ai_idx)
);

-- 회원 관련 테이블
-- 회원 정보 테이블 
create table t_member_info (
   mi_idx int  unique auto_increment,             	-- 일련번호  
   mi_id varchar(20) primary key,                   -- 아이디
   mi_pw varchar(20) not null,                		-- 비밀번호
   mi_name varchar(20) not null,               		-- 이름
   mi_email varchar(50) not null,                   -- 이메일
   mi_isad char(1) default 'y',                		-- 광고 수신여부
   mi_phone varchar(13) not null,               	-- 전화번호
   mi_ismem char(1) default 'y',               		-- 회원 여부
   mi_date datetime default now(),             		-- 가입일
   mi_lastlogin datetime default now(),         	-- 마지막 로그인
   mi_profile varchar(50) null,               		-- 프로필 사진
   mi_stamp int default 0                     		-- 보유 스탬프
);

select * from t_member_info;

-- 스탬프 사용 내역 테이블
create table t_member_stamp (
   ms_idx   int  auto_increment primary key,      -- 일련번호  
   mi_id      varchar(20),                     	  -- 회원 아이디 fk
   ms_kind   char(2)   not null,                  -- 사용 / 적립
   ms_coup   int         default 0,               -- 사용 / 적립 포인트
   ms_content   varchar(50)  not null,            -- 사용 / 적립 내용
   ms_date   datetime default now(),              -- 사용 / 적립일
   ai_idx   int   default 0,                      -- 관리자 번호
   constraint fk_member_stamp_mi_id foreign key (mi_id) references t_member_info(mi_id)
);


-- 지역 대분류 테이블
create table t_area_big (
   ab_id   char(2)   primary key,               -- 시/군/구  코드
   ab_name   varchar(20) not null               -- 시/군/구  명
);

-- 지역 소분류 테이블
create table t_area_small (
   as_id   	 char(4) primary key,               -- 읍/면/동  코드
   ab_id   	 char(2),                       	-- 시/군/구  코드 fk
   as_name   varchar(20) not null,              -- 읍/면/동  명
   constraint fk_t_area_small_ba_id foreign key (ab_id) references t_area_big(ab_id)
);
SET foreign_key_checks = 1;
-- 공간 관련 테이블
create table t_room_info (
   ri_idx   int    unique auto_increment,           -- 공간 번호   
   ri_id     char(5),               				-- 공간 아이디
   ri_name   varchar(30)   not null,               	-- 공간명
   ri_cata   varchar(10)   not null,         		-- 카테고리 pk
   ri_stock int default 0,							-- 재고
   ri_price int default 0,							-- 가격
   ri_title varchar(30)   not null,            		-- 대제목
   ri_subtitle   varchar(30)   null,              	-- 소제목
   ri_hash   varchar(50)   null,                  	-- 해시태그
   ri_review int   default 0,                  		-- 리뷰수
   ri_score float  default 0,                  		-- 평점
   ri_zzim   int default 0,                     	-- 찜수
   ri_img1   varchar(50)   not null,               	-- 이미지1
   ri_img2   varchar(50)   null,                  	-- 이미지2
   ri_img3   varchar(50)   null,                  	-- 이미지3
   ri_img4   varchar(50)   null,                  	-- 이미지4
   ri_img5   varchar(50)   null,                  	-- 이미지5
   ri_min   int  default 1,                     	-- 최소 인원
   ri_max   int  default 1,                     	-- 최대 인원
   ri_start   int   default   0,                  	-- 공유 가능 시간_시작
   ri_end   int   default   0,                     	-- 공유 가능 시간_종료
   ri_tel   varchar(13)   not null,               	-- 전화번호
   ab_id   char(2),                       	 		-- 지역 대분류 fk
   as_id   char(4),                        			-- 지역 소분류 fk
   ri_addr1   varchar(30)   not null,            	-- 지역 주소(서울-구)
   ri_addr2   varchar(30)   not null,            	-- 상세 주소
   ri_mapurl	varchar(100)	not null,			-- 지도 URL
   ri_info   text not null,                     	-- 공간소개 글
   ri_intro   text not null,                  		-- 시설안내 글
   ri_warning text    not null,                  	-- 유의사항글
   ri_refundimg text not null,            			-- 환불정책
   ai_idx   int,                           			-- 관리자번호 fk
   ri_date   datetime default now(),               	-- 공간 등록일
   ri_readcnt    int default 0,                  	-- 조회수
    primary key(ri_id, ri_cata),
    constraint fk_room_info_ab_id foreign key (ab_id) references t_area_big(ab_id),
    constraint fk_room_info_as_id foreign key (as_id) references t_area_small(as_id),
    constraint fk_room_info_ai_idx foreign key (ai_idx) references t_admin_info(ai_idx)      
);

SET foreign_key_checks = 0;

-- 공간 옵션 테이블
create table t_room_extend_opt (
   reo_idx    int   auto_increment primary key,         -- 옵션번호 pk
   reo_name    varchar(30) not null,               		-- 옵션명 
   reo_price  int       default 0,                  	-- 옵션가격
   ri_id    char(5),                           			-- 공간 아이디
   reo_img    varchar(30)    null,                  	-- 옵션 이미지 
   reo_optcnt int default 0,                     		-- 옵션 수량
   constraint fk_room_extend_opt_ri_id foreign key (ri_id) references t_room_info(ri_id)
);



-- 예약 관련 테이블
-- 예약 정보 테이블
create table t_order_info (
   oi_idx    int   auto_increment primary key,         	-- 예약번호 pk
   mi_id   varchar(20),                  			   	-- 회원아이디 pk, fk
   oi_usenum	int	default 0,							-- 이용 인원
   ri_id   char(5),                    					-- 공간 아이디 pk, fk
   ab_id   char(2),                    					-- 시/군/구 코드 fk
   as_id   char(4),                     				-- 읍/면/동 코드 fk 
   oi_purpose varchar(50)  null,            			-- 공간 사용목적
   oi_request  text null,                  				-- 고객 요청사항
   oi_reservedate   char(10) not null,         			-- 예약일(yyyy-mm-dd)
   oi_stime	int	not null,								-- 이용범위(시작)
   oi_etime	int	not null,								-- 이용범위(종료)
   oi_pmethod char(1)     default 'a',      			-- 결제방법
   oi_status	char(1)	default 'a',					-- 예약상태
   oi_total   int      default 0,            			-- 결제액
   od_stamp  int      default 0,            			-- 사용 스탬프
   oi_date   varchar(13)   not null,            		-- 예약등록일
   constraint fk_order_info_mi_id foreign key (mi_id) references t_member_info(mi_id),
   constraint fk_order_info_ri_id foreign key (ri_id) references t_room_info(ri_id),
   constraint fk_order_info_ab_id foreign key (ab_id) references t_area_big(ab_id),
   constraint fk_order_info_as_id foreign key (as_id) references t_area_small(as_id)
);
-- 에러 1882 자꾸 떠서 order_info에서 카테고리 빼버렸읍니다...


-- 찜 목록 테이블
create table t_order_zzim (
   oz_idx int   auto_increment unique,               -- 일련번호 (PK)
   mi_id varchar(20),                       		 -- 회원아이디 (PK) (FK)
   ri_id char(5),                           		 -- 공간 아이디 (PK) (FK)
   oz_iszzim  char(1)   default 'y',          		 -- 찜 여부
   oz_date   datetime default now(),              	 -- 찜 등록일
   primary key(oz_idx, mi_id, ri_id),
   constraint fk_order_zzim_mi_id foreign key (mi_id) references t_member_info(mi_id),
   constraint fk_order_zzim_ri_id foreign key (ri_id) references t_room_info(ri_id)
);

-- 예약 옵션 테이블
create table t_order_opt(
	oo_id	char(5)	primary key,	-- 예약 옵션 아이디
	oi_idx 	int,					-- 예약번호fk
	reo_idx	int,					-- 옵션번호fk
	oo_cnt	int	default 1,			-- 옵션개수
    constraint fk_order_opt_oi_idx foreign key (oi_idx) references t_order_info(oi_idx),
    constraint fk_order_opt_reo_idx foreign key (reo_idx) references t_room_extend_opt(reo_idx)
);


-- 예약 후기 관련 테이블
-- 예약 후기 테이블
create table t_review_list (
	rl_idx   int   auto_increment primary key,          -- 글번호(PK)
	mi_id   varchar(20),               					-- 회원ID(FK)
	oi_idx   int,                     					-- 예약 번호(FK)
	ri_id   char(5),                  					-- 공간 아이디(FK)
	rl_content text   not null,            				-- 내용
	rl_img1   varchar(50),               				-- 이미지1
	rl_img2   varchar(50),               				-- 이미지2
	rl_img3   varchar(50),               				-- 이미지3
	rl_img4   varchar(50),               				-- 이미지4
	rl_ip   varchar(15) not null,        				-- IP주소
	rl_likecnt	int	default 0,							-- 공감수
	rl_isview   char(1)   default 'y',      			-- 게시여부
	rl_date   datetime default now(),         			-- 등록일
	ai_idx   int   default 0,               			-- 삭제 관리자
	constraint fk_review_list_mi_id foreign key (mi_id) references t_member_info(mi_id),
    constraint fk_review_list_oi_idx foreign key (oi_idx) references t_order_info(oi_idx),
    constraint fk_review_list_ri_id foreign key (ri_id) references t_room_info(ri_id)
);

-- 스탬프 관련 테이블
-- 스탬프 사용 상세내역
create table t_stamp_history (
	sh_idx	int	auto_increment primary key,		-- 일련번호
	mi_id	varchar(20),						-- 회원 아이디(사용회원) fk
	sh_used	int	default 0,						-- 사용한 스탬프
	sh_discount	int	default 0,					-- 할인액
	sh_date	datetime default now(),				-- 사용일
	constraint fk_stamp_history_mi_id foreign key (mi_id) references t_member_info(mi_id)
);



-- QnA 질문(게시판) 테이블
create table t_qna_bbs_question (
   qbq_idx int auto_increment primary key,              -- 글번호 (PK)
   mi_id varchar(20),                     				-- 회원ID (FK)
   qbq_content text not null,               			-- 질문 내용
   qbq_date datetime default now(),         			-- 등록일
   qbq_isanswer char(1) default 'n',         			-- 답변여부
   qbq_isview char(1) default 'y',            			-- 게시여부
   constraint fk_qna_bbs_question_mi_id foreign key (mi_id) references t_member_info(mi_id)
);

 -- QnA 답변(게시판) 테이블
create table t_qna_bbs_answer (
   qba_idx int  auto_increment primary key,            -- 글번호 (PK)
   qbq_idx int,                                 -- 질문번호 (FK)
   qba_answer text not null,                        -- 답변내용
   ai_idx int,                                    -- 답변자 (FK)
   qba_date datetime default now(),                  -- 답변일
    constraint fk_qna_bbs_answer_qbq_idx foreign key (qbq_idx) references t_qna_bbs_question(qbq_idx),
    constraint fk_qna_bbs_answer_ai_idx foreign key (ai_idx) references t_admin_info(ai_idx)
);

-- QnA 질문(상품) 테이블
create table t_qna_room_question (
   qrq_idx int,                     -- 글번호 (PK)
   ri_idx  int,                     -- 공간 번호(FK)
   mi_id varchar(20),                  -- 회원ID (PK,FK)
   qrq_content text not null,            -- 질문 내용
   qrq_date datetime default now(),      -- 등록일
   qrq_isanswer char(1) default 'n',      -- 답변여부
   qrq_isview char(1) default 'y',         -- 게시여부
   primary key(qrq_idx, mi_id),
    constraint fk_qna_room_question_mi_id foreign key (mi_id) references t_member_info(mi_id),
    constraint fk_qna_room_question_ri_idx foreign key (ri_idx) references t_room_info(ri_idx)
   -- t_member_info 테이블의 mi_id 컬럼을 참조하는 외래키 fk_qna_mi_id 생성
);

-- QnA 답변(상품) 테이블
create table t_qna_room_answer (
   qra_idx int  auto_increment,         -- 상품질문 답변번호 (PK)
   qrq_idx int ,                     -- 질문번호 (PK,FK)
   qra_answer text not null,            -- 답변내용
   ai_idx int ,                     -- 답변자 (FK)
   qra_date datetime default now(),      -- 답변일
   primary key(qra_idx, qrq_idx),
    constraint fk_qna_room_answer_idx foreign key (qrq_idx) references t_qna_room_question(qrq_idx),
    constraint fk_qna_room_answer_ai_idx foreign key (ai_idx) references t_admin_info(ai_idx)
);

-- 공지사항 목록 테이블
create table t_notice_list (
   nl_idx int  primary key,               -- 글번호 (PK)
   nl_kind   char(1)   default 'a',            -- 글종류 ( a : 단순공지 , b : 이벤트 , c : 상품 관련 , d : 보도 자료  )
   nl_title varchar(100) not null,            -- 제목
   nl_content text not null,               -- 내용
   nl_date   datetime default now(),            -- 등록일
   ai_idx   int   ,                        -- 등록자 (FK)
    constraint fk_notice_ai_idx foreign key (ai_idx) references t_admin_info(ai_idx)
);

select * from t_room_info;