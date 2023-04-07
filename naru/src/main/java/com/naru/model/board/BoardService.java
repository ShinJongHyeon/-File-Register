package com.naru.model.board;

import java.util.List;

import javax.servlet.http.HttpSession;


public interface BoardService {
		
		void createBoard(BoardVO vo) throws Exception;				 //�Խñ� ����
		
		void updateBoard(BoardVO vo) throws Exception;				 //�Խñ� ����
		
		void deleteBoard(int bno) throws Exception;					 //�Խñ� ����
		
		BoardVO readBoard(int bno) throws Exception; 				 //�Խñ� �б�
		
		void viewCnt(int bno, HttpSession session) throws Exception; //��ȸ��
		
		BoardVO previousB(int bno) throws Exception;				 //������
		
		BoardVO nextB(int bno) throws Exception;					 //������
		
		//�Խñ� ���
		List<BoardVO> listAllBoard(String searchOption, String keyword, int start, int end) throws Exception;
		
		//�Խñ� ����
		int getCountBoard(String searchOption, String keyword) throws Exception;


		
	}
