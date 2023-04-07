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
		
		//ȸ������
		public void insertMember(MemberVO vo) {
			mybatis.insert("MemberDAO.insertMember", vo);
		}
		
		// ȸ�� ���� ���� �˻�
		public int checkMember(MemberVO vo) {
			return mybatis.selectOne("MemberDAO.checkMember", vo);
		}
		
		//�α���
		public MemberVO login(MemberVO vo) {
			return (MemberVO) mybatis.selectOne("MemberDAO.login", vo);
		}
		
		//ȸ������ ����
		public void updateMember(MemberVO vo) {
			mybatis.update("MemberDAO.updateMember", vo);
		}
		
		//ȸ�� ���� ����
		public void deleteMember(MemberVO vo) {
			mybatis.delete("MemberDAO.deleteMember", vo);
		}
		
		//�׽�Ʈ��
		public List<MemberVO> getMemberList(int start, int end, MemberVO vo) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("member", vo);
			return mybatis.selectList("MenberDAO.getMemberList", map);
			
		}
		
		//���̵� ã��
		public MemberVO findId(MemberVO vo) {
			System.out.println("���̵� ã��");
			return mybatis.selectOne("MemberDAO.findId", vo);
		}
		
		//��й�ȣ ã��
		public MemberVO findPassword(MemberVO vo) {
			System.out.println("��й�ȣ ã��");
			return mybatis.selectOne("MemberDAO.findPassword", vo);
		}
		
		//��й�ȣ ã��
		public void updatePassword(MemberVO vo) {
			System.out.println("��й�ȣ ã�� �� ����");
			mybatis.selectOne("MemberDAO.updatePassword", vo);
		}
		
		//������ ������ ȸ�� ����Ʈ ���� üũ
		public int getAdminCountMember(MemberVO vo) {
			return mybatis.selectOne("MemberDAO.getAdminCountMember", vo);
		}
		
		//ȸ�� ����Ʈ
		public List<MemberVO> getAdminMemberList(int start, int end, MemberVO vo) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("member2", vo);
			return mybatis.selectList("MemberDAO.getAdminMemberList", map);
		}
		
		//ȸ�� �� ����
		public MemberVO memberDetail(MemberVO vo) {
			return (MemberVO) mybatis.selectOne("MemberDAO.memberDetail", vo);
		}
		
		//������ ȸ������ ����
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
		//������ ȸ�� ���� ����
		public void deleteMember2(MemberVO vo) {
			mybatis.update("MemberDAO.deleteMember2", vo);
		}
		
		//�˻�
		public List<MemberVO> listSerchMember(String sMember, int start, int end) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sMember", sMember);
			map.put("start", start);
			map.put("end", end);
			return mybatis.selectOne("MemberDAO.listSerchMember", map);
		}
		
		//���� ��������
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