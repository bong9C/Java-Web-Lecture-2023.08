package com.example.demo.chinadrama;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.blog.Blog;

@Service
public class DramaServiceOracleImpl implements DramaService {
	@Autowired private DramaDaoOracle dramaDao;


	@Override
	public Drama getdrama(int no) {
		Drama drama = dramaDao.getDrama(no);
		return drama;
	}

	@Override
	public List<Drama> getDramaList(String field, String query) {
		query = "%" + query + "%";
		List<Drama> list = dramaDao.getDramaList(field, query);
		return list;
	}

	@Override
	public void insertDrama(Drama drama) {
		dramaDao.insertDrama(drama);
		
	}

	@Override
	public void updateDrama(Drama drama) {
		dramaDao.updateDrama(drama);
		
	}

	@Override
	public void deleteDrama(int no) {
		dramaDao.deleteDrama(no);
		
	}

	@Override
	public void increaseViewCount(int no) {
		dramaDao.deleteDrama(no);
		
	}
	

	



	

	
	
	
	
	

}
