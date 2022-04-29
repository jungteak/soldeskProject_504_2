package movie.pro.mypage.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MyboardDto {

	 int movbd_no;
	 String moviebd_id;	 
	 String movbd_title;
	 String movbd_content;
	 Date movbd_regdate;
	 int movbd_readcnt;	
	 
}
