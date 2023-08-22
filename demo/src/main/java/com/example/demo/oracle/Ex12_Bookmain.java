package com.example.demo.oracle;

import java.util.List;

public class Ex12_Bookmain {

	public static void main(String[] args) {
		BookDao bDao = new BookDao();	
		
		Book b1 = bDao.getBook(1);
		System.out.println(b1);
		
		List<Book> list = bDao.getBookList();
		for (Book b2: list)
			System.out.println(b2);
	}

}
