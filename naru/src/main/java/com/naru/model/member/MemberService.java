package com.naru.model.member;

import java.util.List;


public interface MemberService {
				
		// 로그인시 회원 체크
		int checkMember(MemberVO vo);
		
		//회원가입
		void insertMember(MemberVO vo);
		
		//회원정보 수정
		void updateMember(MemberVO vo);
		
		//회원정보 삭제
		void deleteMember(MemberVO vo);
		
		//로그인
		MemberVO login(MemberVO vo);
		
		//회원 리스트
		List<MemberVO> getMemberList(int start, int end, MemberVO vo);
		
		//아이디 찾기
		MemberVO findId(MemberVO vo);
		
		//비밀번호 찾기
		MemberVO findPassword(MemberVO vo);
		
		//비밀번호 찾아서 변경
		void updatePassword(MemberVO vo);
		
		//관리자 회원 카운트
		int getAdminCountMember(MemberVO vo);
		
		//관리자 회원 목록
		List<MemberVO> getAdminMemberList(int start, int end, MemberVO vo);
		
		//회원 상세보기
		MemberVO memberDetail(MemberVO vo);
		
		//관리자 회원 수정
		void updateMember2(MemberVO vo);
		
		//관리자 회원 삭제
		void deleteMember2(MemberVO vo);
		
		//회원 검색
		List<MemberVO> listSearchMember(String sMember, int start, int end);
		
		//회원 갯수 가져오기
		int countSearchMember(String sMember);

		//관리자 회원 가입 승인
//		List<MemberVO> getMembersByApproval(boolean approved)
		
		/*
		 * //가입승인 void successId(String id);
		 * 
		 * //가입 거절 void failed(String id);
		 * 
		 * //유저 드롭 void dropUser(String id);
		 */
		
	}
