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

	// �н����� ��ȣȭ
	public void securityPWD(MemberVO vo) {
		SHA3.DigestSHA3 digestSHA3 = new SHA3.DigestSHA3(512);
		byte[] digest = digestSHA3.digest(vo.getMember_pwd().getBytes());
		String securitypwd = Hex.toHexString(digest);
		vo.setMember_pwd(securitypwd);
	}

	// ȸ�� ���� �˻�
	public int checkMember(MemberVO vo) {
		securityPWD(vo);
		return memberDAO.checkMember(vo);
	}

	// ȸ������
	public void insertMember(MemberVO vo) {
		securityPWD(vo);
		memberDAO.insertMember(vo);
	}

	// ȸ������ ����
	public void updateMember(MemberVO vo) {
		securityPWD(vo);
		memberDAO.updateMember(vo);
	}

	// ȸ������ ����
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
	}

	// �α���
	public MemberVO login(MemberVO vo) {
		securityPWD(vo);
		return memberDAO.login(vo);
	}

	// ȸ�� ����Ʈ
	public List<MemberVO> getMemberList(int start, int end, MemberVO vo) {
		return memberDAO.getMemberList(start, end, vo);
	}

	// ���̵� ã��
	@Override
	public MemberVO findId(MemberVO vo) {
		return memberDAO.findId(vo);
	}

	// ��й�ȣ ã��
	@Override
	public MemberVO findPassword(MemberVO vo) {
		return memberDAO.findPassword(vo);
	}

	// ��й�ȣ ã�Ƽ� ����
	@Override
	public void updatePassword(MemberVO vo) {
		securityPWD(vo);
		memberDAO.updatePassword(vo);
	}

	// ������ ȸ�� ī��Ʈ
	public int getAdminCountMember(MemberVO vo) {
		return memberDAO.getAdminCountMember(vo);
	}

	// ������ ȸ�� ���
	public List<MemberVO> getAdminMemberList(int start, int end, MemberVO vo) {
		return memberDAO.getAdminMemberList(start, end, vo);
	}

	// ȸ�� �󼼺���
	public MemberVO memberDetail(MemberVO vo) {
		return memberDAO.memberDetail(vo);
	}

	// ������ ȸ�� ����
	@Override
	public void updateMember2(MemberVO vo) {
		memberDAO.updateMember2(vo);
	}

	// ������ ȸ�� ����
	public void deleteMember2(MemberVO vo) {
		memberDAO.deleteMember2(vo);
	}

	// ȸ�� �˻�
	public List<MemberVO> listSearchMember(String sMember, int start, int end) {
		return memberDAO.listSerchMember(sMember, start, end);
	}

	// ȸ�� ���� ��������
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
