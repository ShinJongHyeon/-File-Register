package com.naru.model.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naru.model.board.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// �Խñ� ����
	public void createBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.createBoard", vo);
	}

	// �Խñ� ����
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}

	// �Խñ� ����
	public void deleteBoard(int bno) {
		mybatis.update("BoardDAO.deleteBoard", bno);
	}

	// �Խñ� ���� üũ
	public int checkBoard(int bno) throws Exception {
		return mybatis.selectOne("BoardDAO.checkBoard", bno);
	}

	// �Խñ� �б�
	public BoardVO readBoard(int bno) {
		return (BoardVO) mybatis.selectOne("BoardDAO.readBoard", bno);
	}

	// ������
	public BoardVO previousB(int bno) {
		return (BoardVO) mybatis.selectOne("BoardDAO.previousB", bno);
	}

	// ������
	public BoardVO nextB(int bno) {
		return (BoardVO) mybatis.selectOne("BoardDAO.nextB", bno);
	}

	// �Խù� ���
	public List<BoardVO> listAllBoard(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("BoardDAO.listAllBoard", map);
	}

	// ��ȸ��
	public void viewCnt(int bno) {
		mybatis.update("BoardDAO.viewCnt", bno);
	}

	// �Խñ� ����
	public int getCountBoard(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return mybatis.selectOne("BoardDAO.getCountBoard", map);
	}

}