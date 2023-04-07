package com.naru.model.codecheck;

import java.util.List;



public interface CodecheckService {
		
		void createCodecheck(CodecheckVO vo) throws Exception;				 //�Խñ� ����
		
		void updateCodecheck(CodecheckVO vo) throws Exception;				 //�Խñ� ����
		
		void deleteCodecheck(String codecheck_bcode) throws Exception;					 //�Խñ� ����
		
		CodecheckVO readCodecheck(String codecheck_bcode) throws Exception; 				 //�Խñ� �б�

		//�Խñ� ���
		List<CodecheckVO> listAllCodecheck(String searchOption, String keyword, int start, int end) throws Exception;
		
		//�Խñ� ����
		int getCountCodecheck(String searchOption, String keyword) throws Exception;
	
	}
