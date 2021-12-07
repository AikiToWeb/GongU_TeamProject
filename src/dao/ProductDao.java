package dao;

import static db.JdbcUtil.*;
import java.util.*;
import javax.sql.*;
import java.sql.*;
import vo.*;

public class ProductDao {
	private static ProductDao productDao;
	private Connection conn;

	private ProductDao() {
	}

	public static ProductDao getInstance() {
		if (productDao == null)
			productDao = new ProductDao();
		return productDao;
	}

	public void setConnection(Connection conn) {
		this.conn = conn;
	}

	public int getPdtCount(String where) {
		// 검색된 상품의 전체 개수를 리턴하는 메소드
		Statement stmt = null;
		ResultSet rs = null;
		int rcnt = 0;

		try {
			String sql = "select count(*) from t_room_info a, t_area_big b, t_area_small c " + where;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			rcnt = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("ProductDao 클래스의 getPdtCount() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return rcnt;
	}

	public ArrayList<ProductInfo> getPdtList(String where, String order, int cpage, int psize) {
		// 검색된 상품 목록을 ArrayList<ProductInfo>에 담아 리턴하는 메소드
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<ProductInfo> pdtList = new ArrayList<ProductInfo>();
		// 상품목록을 저장할 ArrayList로 오직 ProductInfo형 인스턴스만 저장할 수 있음
		ProductInfo pdt = null;
		// pdtList에 저장할 ProductInfo형 인스턴스

		try {
			String sql = "select a.*, b.ab_id, b.ab_name, c.as_name "
					+ " from t_room_info a, t_area_big b, t_area_small c " + where + order + " limit "
					+ ((cpage - 1) * psize) + ", " + psize;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				pdt = new ProductInfo();
				// pdtList에 저장할 하나의 상품 정보를 담을 인스턴스 생성

				pdt.setRi_idx(rs.getInt("ri_idx"));
				pdt.setRi_id(rs.getString("ri_id"));
				pdt.setRi_name(rs.getString("ri_name"));
				pdt.setRi_cata(rs.getString("ri_cata"));
				pdt.setRi_stock(rs.getInt("ri_stock"));
				pdt.setRi_price(rs.getInt("ri_price"));
				pdt.setRi_title(rs.getString("ri_title"));
				pdt.setRi_subtitle(rs.getString("ri_subtitle"));
				pdt.setRi_hash(rs.getString("ri_hash"));
				pdt.setRi_review(rs.getInt("ri_review"));
				pdt.setRi_score(rs.getInt("ri_score"));
				pdt.setRi_zzim(rs.getInt("ri_zzim"));
				pdt.setRi_img1(rs.getString("ri_img1"));
				pdt.setRi_img2(rs.getString("ri_img2"));
				pdt.setRi_img3(rs.getString("ri_img3"));
				pdt.setRi_img4(rs.getString("ri_img4"));
				pdt.setRi_img5(rs.getString("ri_img5"));
				pdt.setRi_min(rs.getInt("ri_min"));
				pdt.setRi_max(rs.getInt("ri_max"));
				pdt.setRi_start(rs.getInt("ri_start"));
				pdt.setRi_end(rs.getInt("ri_end"));
				pdt.setRi_tel(rs.getString("ri_tel"));
				pdt.setAb_id(rs.getString("ab_id"));
				pdt.setAs_id(rs.getString("as_id"));
				pdt.setRi_addr1(rs.getString("ri_addr1"));
				pdt.setRi_addr2(rs.getString("ri_addr2"));
				pdt.setRi_mapurl(rs.getString("ri_mapurl"));
				pdt.setRi_info(rs.getString("ri_info"));
				pdt.setRi_intro(rs.getString("ri_intro"));
				pdt.setRi_warning(rs.getString("ri_warning"));
				pdt.setRi_refundimg(rs.getString("ri_refundimg")); // varchar로 안 돼있고 텍스트인데 이미지???
				pdt.setAi_idx(rs.getInt("ai_idx"));
				pdt.setRi_date(rs.getString("ri_date"));
				pdt.setRi_readcnt(rs.getInt("ri_readcnt"));
				// 받아온 컬럼들의 값을 pdt 인스턴스에 저장

				pdtList.add(pdt);
				// 하나의 상품 정보를 담은 인스턴스 pdt를 pdtList에 저장
			}

		} catch (Exception e) {
			System.out.println("ProductDao 클래스의 getPdtList() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return pdtList;
	}

	public ProductInfo getPdtInfo(String riid) {
		// 검색된 상품의 정보를 ProductInfo 형 인스턴스에 담아 리턴하는 메소드
		Statement stmt = null;
		ResultSet rs = null;
		ProductInfo pdt = null;

		try {
			String sql = "select a.*, b.ab_id, b.ab_name, c.as_name "
					+ " from t_room_info a, t_area_big b, t_area_small c "
					+ " where a.as_id = c.as_id and b.ab_id = c.ab_id and "
					+ " a.ri_stock <> 0 and a.ri_id = '" + riid + "' ";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				pdt = new ProductInfo();

				pdt.setRi_idx(rs.getInt("ri_idx"));
				pdt.setRi_id(rs.getString("ri_id"));
				pdt.setRi_name(rs.getString("ri_name"));
				pdt.setRi_cata(rs.getString("ri_cata"));
				pdt.setRi_stock(rs.getInt("ri_stock"));
				pdt.setRi_price(rs.getInt("ri_price"));
				pdt.setRi_title(rs.getString("ri_title"));
				pdt.setRi_subtitle(rs.getString("ri_subtitle"));
				pdt.setRi_hash(rs.getString("ri_hash"));
				pdt.setRi_review(rs.getInt("ri_review"));
				pdt.setRi_score(rs.getInt("ri_score"));
				pdt.setRi_zzim(rs.getInt("ri_zzim"));
				pdt.setRi_img1(rs.getString("ri_img1"));
				pdt.setRi_img2(rs.getString("ri_img2"));
				pdt.setRi_img3(rs.getString("ri_img3"));
				pdt.setRi_img4(rs.getString("ri_img4"));
				pdt.setRi_img5(rs.getString("ri_img5"));
				pdt.setRi_min(rs.getInt("ri_min"));
				pdt.setRi_max(rs.getInt("ri_max"));
				pdt.setRi_start(rs.getInt("ri_start"));
				pdt.setRi_end(rs.getInt("ri_end"));
				pdt.setRi_tel(rs.getString("ri_tel"));
				pdt.setAb_id(rs.getString("ab_id"));
				pdt.setAs_id(rs.getString("as_id"));
				pdt.setRi_addr1(rs.getString("ri_addr1"));
				pdt.setRi_addr2(rs.getString("ri_addr2"));
				pdt.setRi_mapurl(rs.getString("ri_mapurl"));
				pdt.setRi_info(rs.getString("ri_info"));
				pdt.setRi_intro(rs.getString("ri_intro"));
				pdt.setRi_warning(rs.getString("ri_warning"));
				pdt.setRi_refundimg(rs.getString("ri_refundimg")); // varchar로 안 돼있고 텍스트인데 이미지???
				pdt.setAi_idx(rs.getInt("ai_idx"));
				pdt.setRi_date(rs.getString("ri_date"));
				pdt.setRi_readcnt(rs.getInt("ri_readcnt"));
				// 받아온 컬럼들의 값을 pdt 인스턴스에 저장

			}

		} catch (Exception e) {
			System.out.println("ProductDao 클래스의 getPdtInfo() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return pdt;
	}

	public ArrayList<PdtCataBig> getCataBigList() {
		// 대분류 목록을 ArrayList<PdtCataBig>에 담아 리턴하는 메소드
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<PdtCataBig> cataBigList = new ArrayList<PdtCataBig>();
		// 상품목록을 저장할 ArrayList로 오직 PdtCataBig형 인스턴스만 저장할 수 있음
		PdtCataBig cata = null;
		// cataBigList에 저장할 PdtCataBig형 인스턴스

		try {
			String sql = "select * from t_area_big";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				cata = new PdtCataBig();
				// cataBigList에 저장할 하나의 분류 정보를 담을 인스턴스 생성
				cata.setAb_id(rs.getString("ab_id"));
				cata.setAb_name(rs.getString("ab_name"));
				// 받아온 컬럼들의 값을 cata 인스턴스에 저장
				cataBigList.add(cata);
				// 하나의 상품 정보를 담은 인스턴스 pdt를 pdtList에 저장
			}

		} catch (Exception e) {
			System.out.println("ProductDao 클래스의 getCataBigList() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return cataBigList;
	}

	public ArrayList<PdtCataSmall> getCataSmallList() {
		// 소분류 목록을 ArrayList<PdtCataSmall>에 담아 리턴하는 메소드
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<PdtCataSmall> cataSmallList = new ArrayList<PdtCataSmall>();
		PdtCataSmall cata = null;

		try {
			String sql = "select * from t_area_small";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				cata = new PdtCataSmall();
				cata.setAs_id(rs.getString("as_id"));
				cata.setAb_id(rs.getString("ab_id"));
				cata.setAs_name(rs.getString("as_name"));
				cataSmallList.add(cata);
			}

		} catch (Exception e) {
			System.out.println("ProductDao 클래스의 getCataSmallList() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return cataSmallList;
	}

}
