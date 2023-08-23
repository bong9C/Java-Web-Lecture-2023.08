package com.example.demo.oracle.book;

import java.util.List;

public class Ex21_Bookmain {

	public static void main(String[] args) {
		BookDao bDao = new BookDao();	
		
		BookTest b1 = bDao.getBook(1);
		System.out.println(b1);
		
		List<BookTest> list = bDao.getBookList();
		for (BookTest b2: list)
			System.out.println(b2);
	}

}
