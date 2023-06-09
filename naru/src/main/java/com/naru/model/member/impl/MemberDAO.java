package com.naru.model.member.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naru.model.member.MemberVO;

	@Repository
	public class MemberDAO {
		@Autowired
		private SqlSessionTemplate mybatis;
		
		//회원가입
		public void insertMember(MemberVO vo) {
			mybatis.insert("MemberDAO.insertMember", vo);
		}
		
		// 회원 존재 유무 검사
		public int checkMember(MemberVO vo) {
			return mybatis.selectOne("MemberDAO.checkMember", vo);
		}
		
		//로그인
		public MemberVO login(MemberVO vo) {
			return (MemberVO) mybatis.selectOne("MemberDAO.login", vo);
		}
		
		//회원정보 수정
		public void updateMember(MemberVO vo) {
			mybatis.update("MemberDAO.updateMember", vo);
		}
		
		//회원 정보 삭제
		public void deleteMember(MemberVO vo) {
			mybatis.delete("MemberDAO.deleteMember", vo);
		}
		
		//테스트용
		public List<MemberVO> getMemberList(int start, int end, MemberVO vo) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("member", vo);
			return mybatis.selectList("MenberDAO.getMemberList", map);
			
		}
		
		//아이디 찾기
		public MemberVO findId(MemberVO vo) {
			System.out.println("아이디 찾기");
			return mybatis.selectOne("MemberDAO.findId", vo);
		}
		
		//비밀번호 찾기
		public MemberVO findPassword(MemberVO vo) {
			System.out.println("비밀번호 찾기");
			return mybatis.selectOne("MemberDAO.findPassword", vo);
		}
		
		//비밀번호 찾기
		public void updatePassword(MemberVO vo) {
			System.out.println("비밀번호 찾은 후 변경");
			mybatis.selectOne("MemberDAO.updatePassword", vo);
		}
		
		//관리자 페이지 회원 리스트 갯수 체크
		public int getAdminCountMember(MemberVO vo) {
			return mybatis.selectOne("MemberDAO.getAdminCountMember", vo);
		}
		
		//회원 리스트
		public List<MemberVO> getAdminMemberList(int start, int end, MemberVO vo) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("member2", vo);
			return mybatis.selectList("MemberDAO.getAdminMemberList", map);
		}
		
		//회원 상세 보기
		public MemberVO memberDetail(MemberVO vo) {
			return (MemberVO) mybatis.selectOne("MemberDAO.memberDetail", vo);
		}
		
		//관리자 회원정보 수정
		/*
		 * public void updateMember2(MemberVO vo) {
		 * mybatis.update("MemberDAO.updateMember2", vo); }
		 */
		public void updateMember2(MemberVO vo) {
			mybatis.update("MemberDAO.updateMember2", vo);
		}
		
		/*
		 * public void updateMember2(String member_id, int member_pass) { MemberVO vo =
		 * new MemberVO(); vo.setMember_id(member_id);
		 * vo.setMember_pass(String.valueOf(member_pass));
		 * mybatis.update("MemberDAO.updateMember2", vo); }
		 */
		//관리자 회원 정보 삭제
		public void deleteMember2(MemberVO vo) {
			mybatis.update("MemberDAO.deleteMember2", vo);
		}
		
		//검색
		public List<MemberVO> listSerchMember(String sMember, int start, int end) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sMember", sMember);
			map.put("start", start);
			map.put("end", end);
			return mybatis.selectOne("MemberDAO.listSerchMember", map);
		}
		
		//갯수 가져오기
		public int countSerchMember(String sMember) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sMember", sMember);
			return mybatis.selectOne("MemberDAO.countSearchMember", map);
		}

		/*
		 * public void successId(String id) { mybatis.update("MemberDAO.successId", id);
		 * 
		 * }
		 * 
		 * public void failed(String id) { mybatis.update("MemberDAO.failed", id);
		 * 
		 * }
		 * 
		 * public void dropUser(String id) { mybatis.update("MemberDAO.dropUser", id);
		 * 
		 * }
		 */
		
		/*
		 * // @Override // public List<MemberVO> selectMembersByApproval(boolean
		 * approved){ // return mybatis.selectList("MemberDAO.selectMembersByApproval",
		 * approved); // }
		 */		
	}