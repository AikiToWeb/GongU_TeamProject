package vo;

public class ProductInfo {
	private int ri_idx, ri_review, ri_score, ri_zzim, ri_min, ri_max, ri_start, ri_end, ai_idx, ri_readcnt, ri_stock,
			ri_price;
	// 공간 번호, 별점, 찜수, 최소 인원, 최대 인원, 공유 가능 시간_시작, 공유 가능 시간_종료, 관리자 번호, 조회수
	private String ri_id, ri_name, ri_cata, ri_subtitle, ri_title, ri_hash, ri_img1, ri_img2, ri_img3, ri_img4, ri_img5,
			ri_tel;
	// 공간 아이디, 공간명, 카테고리명, 소제목, 대제목, 해시태그,
	private String ri_addr1, ri_addr2, ri_mapurl, ri_info, ri_intro, ri_warning, ri_refundimg, ri_date;
	// 지역 주소(서울 구), 상세주소, 지도URL, 공간소개글, 시설안내글, 유의사항글, 환불정책

	/* 조인 해서 받아올 데이터들 */
	private String ab_id, as_id;
	// 지역 대분류, 지역 소분류

	public int getRi_idx() {
		return ri_idx;
	}

	public void setRi_idx(int ri_idx) {
		this.ri_idx = ri_idx;
	}

	public int getRi_review() {
		return ri_review;
	}

	public void setRi_review(int ri_review) {
		this.ri_review = ri_review;
	}

	public int getRi_score() {
		return ri_score;
	}

	public void setRi_score(int ri_score) {
		this.ri_score = ri_score;
	}

	public int getRi_zzim() {
		return ri_zzim;
	}

	public void setRi_zzim(int ri_zzim) {
		this.ri_zzim = ri_zzim;
	}

	public int getRi_min() {
		return ri_min;
	}

	public void setRi_min(int ri_min) {
		this.ri_min = ri_min;
	}

	public int getRi_max() {
		return ri_max;
	}

	public void setRi_max(int ri_max) {
		this.ri_max = ri_max;
	}

	public int getRi_start() {
		return ri_start;
	}

	public void setRi_start(int ri_start) {
		this.ri_start = ri_start;
	}

	public int getRi_end() {
		return ri_end;
	}

	public void setRi_end(int ri_end) {
		this.ri_end = ri_end;
	}

	public int getAi_idx() {
		return ai_idx;
	}

	public void setAi_idx(int ai_idx) {
		this.ai_idx = ai_idx;
	}

	public int getRi_readcnt() {
		return ri_readcnt;
	}

	public void setRi_readcnt(int ri_readcnt) {
		this.ri_readcnt = ri_readcnt;
	}

	public int getRi_stock() {
		return ri_stock;
	}

	public void setRi_stock(int ri_stock) {
		this.ri_stock = ri_stock;
	}

	public int getRi_price() {
		return ri_price;
	}

	public void setRi_price(int ri_price) {
		this.ri_price = ri_price;
	}

	public String getRi_id() {
		return ri_id;
	}

	public void setRi_id(String ri_id) {
		this.ri_id = ri_id;
	}

	public String getRi_name() {
		return ri_name;
	}

	public void setRi_name(String ri_name) {
		this.ri_name = ri_name;
	}

	public String getRi_cata() {
		return ri_cata;
	}

	public void setRi_cata(String ri_cata) {
		this.ri_cata = ri_cata;
	}

	public String getRi_subtitle() {
		return ri_subtitle;
	}

	public void setRi_subtitle(String ri_subtitle) {
		this.ri_subtitle = ri_subtitle;
	}

	public String getRi_title() {
		return ri_title;
	}

	public void setRi_title(String ri_title) {
		this.ri_title = ri_title;
	}

	public String getRi_hash() {
		return ri_hash;
	}

	public void setRi_hash(String ri_hash) {
		this.ri_hash = ri_hash;
	}

	public String getRi_img1() {
		return ri_img1;
	}

	public void setRi_img1(String ri_img1) {
		this.ri_img1 = ri_img1;
	}

	public String getRi_img2() {
		return ri_img2;
	}

	public void setRi_img2(String ri_img2) {
		this.ri_img2 = ri_img2;
	}

	public String getRi_img3() {
		return ri_img3;
	}

	public void setRi_img3(String ri_img3) {
		this.ri_img3 = ri_img3;
	}

	public String getRi_img4() {
		return ri_img4;
	}

	public void setRi_img4(String ri_img4) {
		this.ri_img4 = ri_img4;
	}

	public String getRi_img5() {
		return ri_img5;
	}

	public void setRi_img5(String ri_img5) {
		this.ri_img5 = ri_img5;
	}

	public String getRi_tel() {
		return ri_tel;
	}

	public void setRi_tel(String ri_tel) {
		this.ri_tel = ri_tel;
	}

	public String getRi_addr1() {
		return ri_addr1;
	}

	public void setRi_addr1(String ri_addr1) {
		this.ri_addr1 = ri_addr1;
	}

	public String getRi_addr2() {
		return ri_addr2;
	}

	public void setRi_addr2(String ri_addr2) {
		this.ri_addr2 = ri_addr2;
	}

	public String getRi_mapurl() {
		return ri_mapurl;
	}

	public void setRi_mapurl(String ri_mapurl) {
		this.ri_mapurl = ri_mapurl;
	}

	public String getRi_info() {
		return ri_info;
	}

	public void setRi_info(String ri_info) {
		this.ri_info = ri_info;
	}

	public String getRi_intro() {
		return ri_intro;
	}

	public void setRi_intro(String ri_intro) {
		this.ri_intro = ri_intro;
	}

	public String getRi_warning() {
		return ri_warning;
	}

	public void setRi_warning(String ri_warning) {
		this.ri_warning = ri_warning;
	}

	public String getRi_refundimg() {
		return ri_refundimg;
	}

	public void setRi_refundimg(String ri_refundimg) {
		this.ri_refundimg = ri_refundimg;
	}

	public String getRi_date() {
		return ri_date;
	}

	public void setRi_date(String ri_date) {
		this.ri_date = ri_date;
	}

	public String getAb_id() {
		return ab_id;
	}

	public void setAb_id(String ab_id) {
		this.ab_id = ab_id;
	}

	public String getAs_id() {
		return as_id;
	}

	public void setAs_id(String as_id) {
		this.as_id = as_id;
	}

}
