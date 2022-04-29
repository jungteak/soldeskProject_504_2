package movie.pro.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import movie.pro.mypage.dto.MyboardDto;

@Mapper
public interface MyboardDao {
	
	List<MyboardDto> myboardList(Map<String, Object> m);//내글목록
	
	int countmyBd();//전체 글 갯수

}
