package com.gtv.vo;


import lombok.Data;

@Data
public class ReservationVO {
	
	private int reservenum; //예매 정보 코드
	private int movietotalnum; //영화 정보 코드
	private int adult; //어른
	private int teen; //청소년
	private String seat; //좌석
	private int payment; // 가격 
	
	private int totalpeople; //총 인원수
	
}
