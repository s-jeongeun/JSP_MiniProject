package db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex02_drop_table {

	@SuppressWarnings("resource")
	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBConnect.getConnection();
			sql = "drop table GPA";							// 외래키를 포함한 테이블 먼저 drop 해야한다!
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("GPA 테이블 삭제 성공!");		 
			}
			sql = "drop table GPA_USER";							
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("GPA_USER 테이블 삭제 성공!");		 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}