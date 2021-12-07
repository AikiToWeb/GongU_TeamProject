package dao;

import static db.JdbcUtil.*;	
import java.util.*;
import javax.sql.*;
import java.sql.*;
import vo.*;

public class LoginDao {
	private static LoginDao loginDao;
	private Connection conn;

	private LoginDao() {}
	
	public static LoginDao getInstance() {
	// �̱��� ������� �ν��Ͻ� ���� ����
		if (loginDao == null)	loginDao = new LoginDao();
		return loginDao;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	public MemberInfo getLoginMember(String uid, String pwd) {
		// ������ ���̵�(uid)�� ��ȣ(pwd)�� �α��� �۾��� ó���� �� ȸ�������� MemberInfo�� �ν��Ͻ��� ��� �����ϴ� �޼ҵ�
			Statement stmt = null;
			ResultSet rs = null;
			MemberInfo memberInfo = null;	// �����Ͱ� ���� ��� null�� �����ϰ� ��
			
			try {
				stmt = conn.createStatement();
				String sql = "select * from t_member_info " +
					" where mi_id = '" + uid + "' and mi_pw ='" + pwd + "' and mi_ismem = 'y'";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					memberInfo = new MemberInfo();	// rs�� ��� �����͵��� ������ �ν��Ͻ� ����
					memberInfo.setMi_idx(rs.getInt("mi_idx"));
					memberInfo.setMi_id(rs.getString("mi_id"));
					memberInfo.setMi_pw(rs.getString("mi_pw"));
					memberInfo.setMi_name(rs.getString("mi_name"));
					memberInfo.setMi_phone(rs.getString("mi_phone"));
					memberInfo.setMi_email(rs.getString("mi_email"));
					memberInfo.setMi_isad(rs.getString("mi_isad"));
					memberInfo.setMi_stamp(rs.getInt("mi_point"));
					memberInfo.setMi_date(rs.getString("mi_date"));
					memberInfo.setMi_ismem(rs.getString("mi_ismem"));
					memberInfo.setMi_lastlogin(rs.getString("mi_lastlogin"));
					
				}	 // rs�� ������� else ���� �׳� notice�� null�� ����ִ� ���·� ������
				
			} catch(Exception e) {
				System.out.println("LoginDao Ŭ������ getLoginMember() �޼ҵ� ����");
				e.printStackTrace();
			}
			
			return memberInfo;
		}
}