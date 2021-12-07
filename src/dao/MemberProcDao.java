package dao;

import static db.JdbcUtil.*;
import java.util.*;
import javax.sql.*;
import java.sql.*;
import vo.*;

public class MemberProcDao {
	private static MemberProcDao memberProcDao;
	private Connection conn;

	private MemberProcDao() {
	}

	public static MemberProcDao getInstance() {
		if (memberProcDao == null)
			memberProcDao = new MemberProcDao();
		return memberProcDao;
	}

	public void setConnection(Connection conn) {
		this.conn = conn;
	}

	public int memberInsert(MemberInfo memberInfo) {
		// ����ڰ� �Է��� ������� ȸ�� ������ �ϴ� �޼ҵ�
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			String sql = "insert into t_member_info (mi_id, mi_pw, mi_name, mi_email, mi_isad, mi_phone, mi_stamp) values (?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberInfo.getMi_id());
			pstmt.setString(2, memberInfo.getMi_pw());
			pstmt.setString(3, memberInfo.getMi_name());
			pstmt.setString(7, memberInfo.getMi_email());
			pstmt.setString(8, memberInfo.getMi_isad());
			pstmt.setString(6, memberInfo.getMi_phone());
			pstmt.setInt(9, 1); // ���� ���� ������
			result = pstmt.executeUpdate();

			if (result > 0) { // ���������� t_member_addr ���̺� ���ڵ尡 �߰��Ǿ��� ���
				result = 0;
				sql = "insert into t_member_stamp (mi_id, ms_kind, ms_coup, ms_content) values (?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberInfo.getMi_id());
				pstmt.setString(2, "����");
				pstmt.setInt(3, 1);
				pstmt.setString(4, "���� ���ϱ�");
				result = pstmt.executeUpdate();
			}

		} catch (Exception e) {
			System.out.println("MmeberProcDao Ŭ������ memberInsert() �޼ҵ� ����");
			e.printStackTrace();
		}

		return result;
	}

	public int memberUpdate(MemberInfo memberInfo) {
		// ����ڰ� �Է��� �������� �����ϴ� �޼ҵ�
		Statement stmt = null;
		int result = 0;

		try {
			stmt = conn.createStatement();
			String sql = "update t_member_info set " + "mi_phone = '" + memberInfo.getMi_phone() + "', "
					+ "mi_email = '" + memberInfo.getMi_email() + "', " + "mi_isad = '" + memberInfo.getMi_isad() + "' "
					+ "where mi_id = '" + memberInfo.getMi_id() + "' ";
			result = stmt.executeUpdate(sql);

		} catch (Exception e) {
			System.out.println("MmeberProcDao Ŭ������ memberupdate() �޼ҵ� ����");
			e.printStackTrace();
		}

		return result;
	}
}
