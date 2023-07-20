package com.myspring.pro30.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.pro30.member.vo.MemberVO;



@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
//	@Qualifier("sqlSession") 같은 타입의 빈의 2개 이상이면, @Qualifier을 통해 주입할 빈의 id를 명시적으로 지정.
	private SqlSession sqlSession;
	
	@Override
	public List selectAllMemberList() throws DataAccessException {
		List<MemberVO> membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		
		return membersList;
	}

	@Override
	public void insertMember(MemberVO memberVO) throws DataAccessException {
		sqlSession.insert("mapper.member.insertMember", memberVO);
	}

	@Override
	public void deleteMember(String id) throws DataAccessException {
		sqlSession.delete("mapper.member.deleteMember", id);
	}

	@Override
	public void modMember(MemberVO memberVO) throws DataAccessException {
		sqlSession.update("mapper.member.updateMember",memberVO);
		
	}

	@Override
	public MemberVO selectMemberById(String id) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.selectMemberById", id);
		// selectOne 메서드의 반환 타입은 항상 단일 객체(Object).
		// 따라서 쿼리의 resultType이 MemberVO로 되어있어도 형변환 필요함.
		// 단 sts3 spring legacy project에서는 자동 매핑  가능으로 필요없음.
	}

	@Override
	public List searchMember(MemberVO memberVO) throws DataAccessException {
		return sqlSession.selectList("mapper.member.searchMember", memberVO);
	}

	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.loginById", memberVO);
	}
	
	
}
