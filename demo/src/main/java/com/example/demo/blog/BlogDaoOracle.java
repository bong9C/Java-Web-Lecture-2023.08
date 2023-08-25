package com.example.demo.blog;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface BlogDaoOracle {

	@Select("select * from blog where bid=#{bid}") 
	// 아래 getBlog 에 있는 int bid 값이 bid=에 들어오게 하려면 #{bid}
	Blog getBlog(int bid);   // 인터페이스이기 때문에 굳이 public 를 안붙여도 됨
	
	
	@Select("select * from blog where ${field} like #{query} and isDeleted=0"
			+ "order by modTime desc")
	List<Blog> getBlogList(String field, String query);
	
	@Insert("insert into blog(penName, title, content)"
			+ "values (#{pneName}, #{title}, #{content, jdbcType=VARCHAR})")
	void insertBlog(Blog blog);
	
	@Update("update blog set penName=#{pneName}, title=#{title}, content=#{content, jdbcType=VARCHAR}, "
			+ "+ modTime=current_timestamp, where bid=#{bid}")
	void updateBlog(Blog blog);
	
	@Delete("update blog set isDeleted=1 where=#{bid}")
	void deleteBlog(int bid);
	
	@Update("update blog set viewCount=viewCount+1 where bid=#{bid}")
	void increaseViewCount(int bid);
	
}
