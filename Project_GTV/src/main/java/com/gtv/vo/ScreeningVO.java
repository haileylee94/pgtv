package com.gtv.vo;

import lombok.Data;

@Data
public class ScreeningVO {
	
	private int sc_code; // pk ������ �ڵ�
	private int mov_no; // fk ��ȭ�ڵ�
	private String sc_branch; //�� ����
	private String sc_date; //�� ��¥
	private String sc_time; //�� �ð�
	private String theater; //�󿵰�
	private int all_seat; //��ü �¼�
	private int left_seat; //���� �¼�
}
