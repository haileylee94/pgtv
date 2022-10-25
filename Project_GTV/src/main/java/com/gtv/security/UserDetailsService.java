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
		
		MemberVO vo = this.memberMapperDao.readMember(username); // DB�κ��� ���̵� �ش��ϴ� ȸ�������� ����
		System.out.println("queried by member Info : " + vo);
		
		return (vo == null)? null : new CustomUser(vo); // �����ڸ� ȣ���ؼ� �˻��� ȸ���������� �ѱ�. �׷����� ������ ��ü�� ��ȯ
	}

}
