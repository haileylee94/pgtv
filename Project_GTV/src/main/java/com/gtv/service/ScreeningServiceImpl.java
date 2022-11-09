package com.gtv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gtv.dao.ScreeningDAO;
import com.gtv.vo.MovieVO;
import com.gtv.vo.MovietotalVO;
import com.gtv.vo.RegiondetailVO;
import com.gtv.vo.ScreeningVO;

@Service
public class ScreeningServiceImpl implements ScreeningService {
	@Autowired
	private ScreeningDAO screeningDao;

	@Override
	public List<MovieVO> getList(MovieVO mv) {
		return screeningDao.getList(mv);
	}

	@Override
	public List<RegiondetailVO> getBranch(RegiondetailVO rv) {
		return screeningDao.getBranch(rv);
	}

	@Override
	public List<RegiondetailVO> getRegion(RegiondetailVO rv) {
		return screeningDao.getRegion(rv);
	}

	@Override
	public MovieVO getMovieData(int movienum) {
		return screeningDao.getMovieData(movienum);
	}

	@Override
	public RegiondetailVO getRegiondetail(int theaternum) {
		return screeningDao.getRegiondetail(theaternum);
	}

	@Override
	public List<MovietotalVO> getMovieTotalList(MovietotalVO mtvo) {
		return screeningDao.getMovieTotalList(mtvo);
	}

	@Override
	public MovietotalVO movieselect(MovietotalVO mtvo) {
		return screeningDao.movieselect(mtvo);
	}

	
}
