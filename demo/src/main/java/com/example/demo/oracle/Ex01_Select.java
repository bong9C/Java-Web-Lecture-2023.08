package com.example.demo.oracle;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/*
 * 파라메터가 없는 SQL을 사용하여, Madang/customer 테이블 조회 ( 모든 DB 코드 동일 "jdbc:oracle:thin:@localhost:1521:xe" 만 바꾸면 됨)
 */

public class Ex01_Select {

	public static void main(String[] args) {
			Connection conn = null;
			Statement stmt = null;
			try {
				conn = DriverManager.getConnection(
								"jdbc:oracle:thin:@localhost:1521:xe",
								"hmuser", "hmpass");
				stmt = conn.createStatement();
				String sql = "select * from customer";
				
				// sql 실행
				ResultSet rs = stmt.executeQuery(sql);	// 결과는 rs 에 들어옴 // 파라메타가 없을 경우 ResultSet rs = stmt.executeQuery(sql); 이거 쓰기
				while (rs.next()) {			// 리턴값이 남아있는 동안 while 내용을 실행하거라, 오라클에 있는 데이터
					int custId = rs.getInt(1); // ("custid") 처럼 컬럼 이름을 써도 된다. 
					String name = rs.getString(2);
					String addr = rs.getString(3);
					String phone = rs.getString(4);
					System.out.printf("%d, %s, %s, %s%n", custId, name, addr, phone);
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

}
