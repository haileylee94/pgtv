package com.gtv.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveVO {
	
	private int re_code; // pk ���� ���� �ڵ�
	private int sc_code; // fk ������ �ڵ�
	private int user_no; // fk ���� �ڵ�
	private Date re_date; // ���� ��¥
	private int re_ck; //���� ��� ����
	private String re_seat; //���� �¼�
	private int adult; //�
	private int teen; //û�ҳ�
	
}
