package com.example.demo.chinadrama;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.blog.Blog;

@Mapper
public interface DramaDaoOracle {
	
	@Select("select * from drama where no=#{no}")
	Drama getDrama(int no);
	
	
	@Select("select * from drama where ${field} like #{query} and isDeleted=0")
	List<Drama> getDramaList(String field, String query);
	
	
	@Insert("insert into drama(title, content, episodes, casting, broadcaster)"
			+ " values (#{episodes}, #{title}, #{casting}, #{broadcaster} #{content, jdbcType=VARCHAR})")
	void insertDrama(Drama drama);
	
	@Update("update drama set episodes=#{episodes}, title=#{title}, content=#{content, jdbcType=VARCHAR},"
			+ " where bid=#{bid}")
	void updateDrama(Drama drama);
	
	@Update("update drama set isDeleted=1 where no=#{no}")
	void deleteDrama(int no);
	
	@Update("update drama set viewCount=viewCount+1 where  no=#{no}")
	void increaseViewCount(int no);
}
