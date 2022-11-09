package com.gtv.service;

import java.util.List;

import com.gtv.vo.MemberVO;
import com.gtv.vo.MovietotalVO;

public interface AdminService {

	int getRowCount();

	List<MemberVO> getBoardList(MemberVO mem);

	int deleteMember(int num);

	int getMovRowCount();

	List<MovietotalVO> getMovieList(MovietotalVO mov);

	int deleteMovie(int num);

}
