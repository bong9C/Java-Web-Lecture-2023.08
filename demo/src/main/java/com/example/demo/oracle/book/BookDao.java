package com.example.demo.oracle.book;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.example.demo.oracle.customer.CustomerTest;

public class BookDao {
	private String host;
	private String user;
	private String password;
	private String database;
	private String port;
	
	public BookDao() {
		try {
			Properties props = new Properties();
			String filename = "D:/Javaweb/demo/src/main/java/com/example/demo/oracle";
			InputStream is = new FileInputStream(filename);
			props.load(is);
			is.close();
			
			this.host = props.getProperty("host");
			this.user = props.getProperty("user");
			this.password = props.getProperty("password");
			this.database = props.getProperty("datebase");
			this.port = props.getProperty("port");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
		
		Connection myConnection() {
			Connection conn = null;
			try {
				String connStr = "jdbc:oracle:thin:@"+ host + ":" + port + ":" + database;
				conn = DriverManager.getConnection(connStr, user, password);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return conn;
	}
	
	public BookTest getBook(int bookId) {  //int BookId가 파라메터
		Connection conn = myConnection();
		String sql = "select * from book where bookid=?"; // ? 에 첫번째 custid를 셋팅 하겠다.
		BookTest book = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookId);		// ? 자리 세팅, int 차리, 첫번째 파라메터 
			ResultSet rs = pstmt.executeQuery(); // SQL 을 JDBC 을 거쳐서 오라클에서 데이터를 가지고 옴
			while(rs.next()) {
				bookId = rs.getInt(1);
				String bookname = rs.getString(2);
				String publisher = rs.getString(3);
				int price = rs.getInt(4);
				book = new BookTest(bookId, bookname, publisher, price);
			}
			rs.close(); pstmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return book;
	}
	
	public List<BookTest> getBookList() {
		Connection conn = myConnection();
		String sql = "select * from book";
		// sql 실행(select) -> 결과는 Resultset으로 받음(rs에 그 값이 들어옴)
		List<BookTest> list = new ArrayList<>();
		try {
			Statement stmt = conn.createStatement(); 
			ResultSet rs = stmt.executeQuery(sql);// 테이블의 값을 rs에 넣는다.
			while(rs.next()) {
				int bookId = rs.getInt(1);
				String bookname = rs.getString(2);
				String publisher = rs.getString(3);
				int price = rs.getInt(4);
				
				BookTest b = new BookTest(bookId, bookname, publisher, price);
				list.add(b);
			}
			rs.close(); stmt.close(); conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	

		
}
	
	

