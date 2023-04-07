package com.naru.model.board.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naru.model.board.BoardService;
import com.naru.model.board.BoardVO;

@Service("BoardService")

public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	// �Խñ� ����
	public void createBoard(BoardVO vo) throws Exception {
		boardDAO.createBoard(vo);
	}

	// �Խñ� ����
	public void updateBoard(BoardVO vo) throws Exception {
		boardDAO.updateBoard(vo);
	}

	// �Խñ� ����
	public void deleteBoard(int bno) throws Exception {
		boardDAO.deleteBoard(bno);
	}

	// �Խñ� ���� üũ
	public int checkBoard(int bno) throws Exception {
		return boardDAO.checkBoard(bno);
	}

	// �Խñ� �б�
	public BoardVO readBoard(int bno) throws Exception {
		return boardDAO.readBoard(bno);
	}

	// �Խñ� ���
	public List<BoardVO> listAllBoard(String searchOption, String keyword, int start, int end) throws Exception {
		return boardDAO.listAllBoard(searchOption, keyword, start, end);
	}

	// ������
	public BoardVO previousB(int bno) throws Exception {
		return boardDAO.previousB(bno);
	}

	// ������
	public BoardVO nextB(int bno) throws Exception {
		return boardDAO.nextB(bno);
	}

	// ��ȸ��
	public void viewCnt(int bno, HttpSession session) throws Exception {
		// Ÿ�̸� ����
		long update_time = 0;

		if (session.getAttribute("update_time_" + bno) != null) {
			// �ֱٿ� ��ȸ���� �ø� �ð�
			update_time = (Long) session.getAttribute("update_time_" + bno);
		}
		long current_time = System.currentTimeMillis();
		// ���� �ð��� ����� �� ��ȸ�� ���� ó��
		if (current_time - update_time > 5 * 10000) {
			// ��ȸ�� ���� ó��
			boardDAO.viewCnt(bno);
			// ��ȸ���� �ø� �ð� ����
			session.setAttribute("update_time_" + bno, current_time);
		}
	}

	// �Խñ� ����
	public int getCountBoard(String searchOption, String keyword) throws Exception {
		return boardDAO.getCountBoard(searchOption, keyword);
	}

	
}