package com.naru.model.member;

import java.util.List;


public interface MemberService {
				
		// �α��ν� ȸ�� üũ
		int checkMember(MemberVO vo);
		
		//ȸ������
		void insertMember(MemberVO vo);
		
		//ȸ������ ����
		void updateMember(MemberVO vo);
		
		//ȸ������ ����
		void deleteMember(MemberVO vo);
		
		//�α���
		MemberVO login(MemberVO vo);
		
		//ȸ�� ����Ʈ
		List<MemberVO> getMemberList(int start, int end, MemberVO vo);
		
		//���̵� ã��
		MemberVO findId(MemberVO vo);
		
		//��й�ȣ ã��
		MemberVO findPassword(MemberVO vo);
		
		//��й�ȣ ã�Ƽ� ����
		void updatePassword(MemberVO vo);
		
		//������ ȸ�� ī��Ʈ
		int getAdminCountMember(MemberVO vo);
		
		//������ ȸ�� ���
		List<MemberVO> getAdminMemberList(int start, int end, MemberVO vo);
		
		//ȸ�� �󼼺���
		MemberVO memberDetail(MemberVO vo);
		
		//������ ȸ�� ����
		void updateMember2(MemberVO vo);
		
		//������ ȸ�� ����
		void deleteMember2(MemberVO vo);
		
		//ȸ�� �˻�
		List<MemberVO> listSearchMember(String sMember, int start, int end);
		
		//ȸ�� ���� ��������
		int countSearchMember(String sMember);

		//������ ȸ�� ���� ����
//		List<MemberVO> getMembersByApproval(boolean approved)
		
		/*
		 * //���Խ��� void successId(String id);
		 * 
		 * //���� ���� void failed(String id);
		 * 
		 * //���� ��� void dropUser(String id);
		 */
		
	}
