package com.example.demo.oracle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.jsp.tagext.TryCatchFinally;

/*
 * 파라메터가 있는 SQL을 사용하여, Madang/customer 테이블 검색 ( 모든 DB 코드 동일 "jdbc:oracle:thin:@localhost:1521:xe" 만 바꾸면 됨)
 */


public class Ex02_SelectParameter {
		public static void main(String[] args) {
			int custId = 5;			// custid가 5인 고객 검색
			try {
				Connection conn = DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:xe",
						"hmuser", "hmpass");
				String sql = "select * from customer where custid=?";  // ? 는 파라메타의 자리라네
				
				// SQL 파라메터 세팅
				PreparedStatement pstmt = conn.prepareStatement(sql); // 파라메타가 있을 경우 PreparedStatement pstmt = conn.prepareStatement(sql); 이거 쓰기
				pstmt.setInt(1, custId); // ?첫번째 값에 custId 값을 세팅
				
				//Select 실행
				ResultSet rs =  pstmt.executeQuery();
				while (rs.next()) {
					custId = rs.getInt(1);
					String name = rs.getString(2);
					String addr = rs.getString(3);
					String phone = rs.getString(4);
					System.out.printf("%d, %s, %s, %s%n", custId, name, addr, phone);
					
				}
				rs.close(); pstmt.close(); rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
