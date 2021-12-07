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
		// �˻��� ��ǰ�� ��ü ������ �����ϴ� �޼ҵ�
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
			System.out.println("ProductDao Ŭ������ getPdtCount() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return rcnt;
	}

	public ArrayList<ProductInfo> getPdtList(String where, String order, int cpage, int psize) {
		// �˻��� ��ǰ ����� ArrayList<ProductInfo>�� ��� �����ϴ� �޼ҵ�
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<ProductInfo> pdtList = new ArrayList<ProductInfo>();
		// ��ǰ����� ������ ArrayList�� ���� ProductInfo�� �ν��Ͻ��� ������ �� ����
		ProductInfo pdt = null;
		// pdtList�� ������ ProductInfo�� �ν��Ͻ�

		try {
			String sql = "select a.*, b.ab_id, b.ab_name, c.as_name "
					+ " from t_room_info a, t_area_big b, t_area_small c " + where + order + " limit "
					+ ((cpage - 1) * psize) + ", " + psize;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				pdt = new ProductInfo();
				// pdtList�� ������ �ϳ��� ��ǰ ������ ���� �ν��Ͻ� ����

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
				pdt.setRi_refundimg(rs.getString("ri_refundimg")); // varchar�� �� ���ְ� �ؽ�Ʈ�ε� �̹���???
				pdt.setAi_idx(rs.getInt("ai_idx"));
				pdt.setRi_date(rs.getString("ri_date"));
				pdt.setRi_readcnt(rs.getInt("ri_readcnt"));
				// �޾ƿ� �÷����� ���� pdt �ν��Ͻ��� ����

				pdtList.add(pdt);
				// �ϳ��� ��ǰ ������ ���� �ν��Ͻ� pdt�� pdtList�� ����
			}

		} catch (Exception e) {
			System.out.println("ProductDao Ŭ������ getPdtList() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return pdtList;
	}

	public ProductInfo getPdtInfo(String riid) {
		// �˻��� ��ǰ�� ������ ProductInfo �� �ν��Ͻ��� ��� �����ϴ� �޼ҵ�
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
				pdt.setRi_refundimg(rs.getString("ri_refundimg")); // varchar�� �� ���ְ� �ؽ�Ʈ�ε� �̹���???
				pdt.setAi_idx(rs.getInt("ai_idx"));
				pdt.setRi_date(rs.getString("ri_date"));
				pdt.setRi_readcnt(rs.getInt("ri_readcnt"));
				// �޾ƿ� �÷����� ���� pdt �ν��Ͻ��� ����

			}

		} catch (Exception e) {
			System.out.println("ProductDao Ŭ������ getPdtInfo() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return pdt;
	}

	public ArrayList<PdtCataBig> getCataBigList() {
		// ��з� ����� ArrayList<PdtCataBig>�� ��� �����ϴ� �޼ҵ�
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<PdtCataBig> cataBigList = new ArrayList<PdtCataBig>();
		// ��ǰ����� ������ ArrayList�� ���� PdtCataBig�� �ν��Ͻ��� ������ �� ����
		PdtCataBig cata = null;
		// cataBigList�� ������ PdtCataBig�� �ν��Ͻ�

		try {
			String sql = "select * from t_area_big";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				cata = new PdtCataBig();
				// cataBigList�� ������ �ϳ��� �з� ������ ���� �ν��Ͻ� ����
				cata.setAb_id(rs.getString("ab_id"));
				cata.setAb_name(rs.getString("ab_name"));
				// �޾ƿ� �÷����� ���� cata �ν��Ͻ��� ����
				cataBigList.add(cata);
				// �ϳ��� ��ǰ ������ ���� �ν��Ͻ� pdt�� pdtList�� ����
			}

		} catch (Exception e) {
			System.out.println("ProductDao Ŭ������ getCataBigList() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return cataBigList;
	}

	public ArrayList<PdtCataSmall> getCataSmallList() {
		// �Һз� ����� ArrayList<PdtCataSmall>�� ��� �����ϴ� �޼ҵ�
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
			System.out.println("ProductDao Ŭ������ getCataSmallList() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}

		return cataSmallList;
	}

}
