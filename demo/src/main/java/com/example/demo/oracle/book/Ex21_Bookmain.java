package com.example.demo.oracle.book;

import java.util.List;

public class Ex21_Bookmain {

	public static void main(String[] args) {
		BookDao bDao = new BookDao();	
		
//		BookTest b1 = bDao.getBook(1);
//		System.out.println(b1);
//		
//		List<BookTest> list = bDao.getBookList();
//		for (BookTest b2: list)
//			System.out.println(b2);
	
	
		// bDao.insertBook(BookTest b)
		BookTest c3 = new BookTest(14, "선비는 가라", "벼슬아치" ,5000);
		bDao.insertBook(c3);
		List<BookTest> list = bDao.getBookList();
		for (BookTest b2: list)
			System.out.println(b2);
	}
	
	
	
	

}
