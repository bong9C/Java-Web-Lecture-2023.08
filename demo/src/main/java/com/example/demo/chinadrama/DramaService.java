package com.example.demo.chinadrama;

import java.util.List;

public interface DramaService {
	
	Drama getdrama(int no);
	
	List<Drama> getDramaList(String field, String query);
	
	void insertDrama(Drama drama);
	
	void updateDrama(Drama drama);
	
	void deleteDrama(int no);
	
	void increaseViewCount(int no);
}
