package com.gtv.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gtv.dao.MovieComDAO;

@Service
public class MovieComServiceImpl implements MovieComService {

	@Autowired
	private MovieComDAO moviecomDao;
	
}
