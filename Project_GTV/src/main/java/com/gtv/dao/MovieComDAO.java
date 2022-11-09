package com.gtv.dao;





import java.util.List;

import com.gtv.vo.ComVO;
import com.gtv.vo.MovieVO;

public interface MovieComDAO {

	void insertCom(ComVO c);

	int getRowCount();

	List<ComVO> getComList(ComVO c);

	ComVO getCont(int com_num);

	void editCom(ComVO ec);

	void delCom(int com_num);

	int getlikeCount(MovieVO movieVo);

	int getTotalCount(MovieVO movieVo);


}
