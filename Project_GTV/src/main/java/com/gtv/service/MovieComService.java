package com.gtv.service;




import java.util.List;

import com.gtv.vo.ComVO;

public interface MovieComService {

	void insertCom(ComVO c);

	int getRowCount();

	List<ComVO> getComList(ComVO c);

	ComVO getCont(int com_num);

	void editCom(ComVO ec);

	void delCom(int com_num);


}
