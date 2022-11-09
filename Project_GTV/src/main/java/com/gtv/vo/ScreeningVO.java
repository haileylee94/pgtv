package com.gtv.vo;

import lombok.Data;

@Data
public class ScreeningVO {
	
	private int sc_code; //상영정보 코드
	private int mov_no;	//영화 번호
	private String mov_name; //영화 제목
	private String sc_branch; //상영 지점
	private String sc_date; //상영 날짜
	private String theater; //상영관
	private int all_seat; //전체 좌석
	private int left_seat; //남은 좌석
	private String sc_hour; //상영 시간
	private String sc_minute; //상영 분
	private String sc_hour_end; //상영 종료 시간
	private String sc_minute_end; //상영 종료 분
	private int branch_no;//상영 지점 번호
}
