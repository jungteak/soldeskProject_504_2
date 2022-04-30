package movie.pro.mypage.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MyinqubdDto {
	
	int inqubd_no;
	String inqubd_id;
	String inqubd_title;
	String inqubd_div;
	String inqubd_cinema;
	String inqubd_content;
	@DateTimeFormat(pattern = "yy/MM/dd")
	Date inqubd_regdate;
	String inqubd_comm;
	@DateTimeFormat(pattern = "yy/MM/dd")
	Date inqubd_comm_regdate;
	String inqubd_a;
	
}
