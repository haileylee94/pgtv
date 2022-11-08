package com.gtv.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.gtv.dao.MemberMapperDAO;
import com.gtv.security.domain.CustomUser;
import com.gtv.vo.MemberVO;

import lombok.Setter;

public class UserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapperDAO memberMapperDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("Load User By UserName : " + username);
		
		MemberVO vo = this.memberMapperDao.readMember(username); // DB로부터 아이디에 해당하는 회원정보를 구함
		System.out.println("queried by member Info : " + vo);
		
		return (vo == null)? null : new CustomUser(vo); // 생성자를 호출해서 검색된 회원정보값을 넘김. 그런다음 생성된 객체를 반환
	}

}
