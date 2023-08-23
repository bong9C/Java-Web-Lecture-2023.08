package com.example.demo.oracle;

import java.util.ArrayList;
import java.util.List;

import com.example.demo.oracle.customer.CustomerTest;

public class Ex99_ListApp {

	public static void main(String[] args) {
		CustomerTest c1 = new CustomerTest();
		c1.setCustId(101);
		c1.setName("박찬호");
		c1.setAddr("미국 엘에이");
		c1.setPhone("010-2345-6789");
		CustomerTest c2 = new CustomerTest(102, "박인비", "대한민국 서울", "010-3456-7890");
		// System.out.println(c1); System.out.println(c2);
		
		List<CustomerTest> list = new ArrayList<>();
		list.add(c1); list.add(c2);
		System.out.println(list.get(0)); System.out.println(list.get(1)); // 이 출력 방법 보단 
		System.out.println();
		
		for (CustomerTest c: list)
			System.out.println(c); // 이 출력 방법이 좋음
		System.out.println();
		
		list.forEach(x -> System.out.println(x)); // 이런 출력 방법도 있음
	}

}
