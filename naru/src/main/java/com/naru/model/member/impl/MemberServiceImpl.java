package com.naru.model.member.impl;

import java.util.List;

import org.bouncycastle.jcajce.provider.digest.SHA3;
import org.bouncycastle.util.encoders.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naru.model.member.MemberService;
import com.naru.model.member.MemberVO;

@Service("memberService")

public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	// 패스워드 암호화
	public void securityPWD(MemberVO vo) {
		SHA3.DigestSHA3 digestSHA3 = new SHA3.DigestSHA3(512);
		byte[] digest = digestSHA3.digest(vo.getMember_pwd().getBytes());
		String securitypwd = Hex.toHexString(digest);
		vo.setMember_pwd(securitypwd);
	}

	// 회원 유무 검사
	public int checkMember(MemberVO vo) {
		securityPWD(vo);
		return memberDAO.checkMember(vo);
	}

	// 회원가입
	public void insertMember(MemberVO vo) {
		securityPWD(vo);
		memberDAO.insertMember(vo);
	}

	// 회원정보 수정
	public void updateMember(MemberVO vo) {
		securityPWD(vo);
		memberDAO.updateMember(vo);
	}

	// 회원정보 삭제
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
	}

	// 로그인
	public MemberVO login(MemberVO vo) {
		securityPWD(vo);
		return memberDAO.login(vo);
	}

	// 회원 리스트
	public List<MemberVO> getMemberList(int start, int end, MemberVO vo) {
		return memberDAO.getMemberList(start, end, vo);
	}

	// 아이디 찾기
	@Override
	public MemberVO findId(MemberVO vo) {
		return memberDAO.findId(vo);
	}

	// 비밀번호 찾기
	@Override
	public MemberVO findPassword(MemberVO vo) {
		return memberDAO.findPassword(vo);
	}

	// 비밀번호 찾아서 변경
	@Override
	public void updatePassword(MemberVO vo) {
		securityPWD(vo);
		memberDAO.updatePassword(vo);
	}

	// 관리자 회원 카운트
	public int getAdminCountMember(MemberVO vo) {
		return memberDAO.getAdminCountMember(vo);
	}

	// 관리자 회원 목록
	public List<MemberVO> getAdminMemberList(int start, int end, MemberVO vo) {
		return memberDAO.getAdminMemberList(start, end, vo);
	}

	// 회원 상세보기
	public MemberVO memberDetail(MemberVO vo) {
		return memberDAO.memberDetail(vo);
	}

	// 관리자 회원 수정
	@Override
	public void updateMember2(MemberVO vo) {
		memberDAO.updateMember2(vo);
	}

	// 관리자 회원 삭제
	public void deleteMember2(MemberVO vo) {
		memberDAO.deleteMember2(vo);
	}

	// 회원 검색
	public List<MemberVO> listSearchMember(String sMember, int start, int end) {
		return memberDAO.listSerchMember(sMember, start, end);
	}

	// 회원 갯수 가져오기
	public int countSearchMember(String sMember) {
		return memberDAO.countSerchMember(sMember);
	}

	
	/*
	 * @Override public List<MemberVO> getMembersByApproval(boolean approved){
	 * return memberDAO.selectMembersByApproval(approved) }
	 */
	
	/*
	 * @Override public void successId(String id) { memberDAO.successId(id); }
	 * 
	 * @Override public void failed(String id) { memberDAO.failed(id); }
	 * 
	 * @Override public void dropUser(String id) { memberDAO.dropUser(id); }
	 */
	 
}
