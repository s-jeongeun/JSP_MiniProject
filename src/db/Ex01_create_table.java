package db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex01_create_table {

	@SuppressWarnings("resource")
	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBConnect.getConnection();
			sql = "create table score (" +
					"idx number constraint GPA_pk primary key, " +
					"title varchar2(50) not null, " +
					"score varchar2(10) not null, " +
					"u_comment clob, " +								// clob : 큰 값
					"ip varchar2(15)," +
					"img varchar2(100), " +
					"reg_date date" + 
				  ")";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("SCORE 테이블 생성 성공!");
			}
			sql = "create table s_user (" +
					"idx number constraint GUser_pk primary key, " +
					"u_id varchar2(50) not null, " +
					"pw varchar2(20), " +
					"reg_date date" + 
				  ")";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("S_USER 테이블 생성 성공!");
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