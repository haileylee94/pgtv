package com.gtv.dao;

import java.util.List;

import com.gtv.vo.MovieVO;
import com.gtv.vo.MovietotalVO;
import com.gtv.vo.RegiondetailVO;

public interface ScreeningDAO {

	List<MovieVO> getList(MovieVO mv);

	List<RegiondetailVO> getBranch(RegiondetailVO rv);

	List<RegiondetailVO> getRegion(RegiondetailVO rv);

	MovieVO getMovieData(int movienum);

	RegiondetailVO getRegiondetail(int theaternum);

	List<MovietotalVO> getMovieTotalList(MovietotalVO mtvo);

	MovietotalVO movieselect(MovietotalVO mtvo);






}
