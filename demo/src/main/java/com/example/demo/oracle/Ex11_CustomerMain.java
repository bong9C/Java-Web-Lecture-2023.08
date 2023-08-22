package com.example.demo.oracle;

public class Ex11_CustomerMain {

	public static void main(String[] args) {
		CustomerDao cDao = new CustomerDao();
		
		// custId 값으로 검색해서 Customer 객체를 구하고 출력 
		Customer c = cDao.getCustomer(6);
		System.out.println(c);
		//cDao.getCustomerList()
		
		// cDao.getCustomer(int custId)
		
		// cDao.insertCustomer(Customer c)
		
		// cDao.updateCustomer(Customer c)
		
		// cDao.deleteCustomer(int custId)
	}

}
