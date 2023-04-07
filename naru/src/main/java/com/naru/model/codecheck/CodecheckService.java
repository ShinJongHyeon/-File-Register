package com.naru.model.codecheck;

import java.util.List;



public interface CodecheckService {
		
		void createCodecheck(CodecheckVO vo) throws Exception;				 //게시글 쓰기
		
		void updateCodecheck(CodecheckVO vo) throws Exception;				 //게시글 수정
		
		void deleteCodecheck(String codecheck_bcode) throws Exception;					 //게시글 삭제
		
		CodecheckVO readCodecheck(String codecheck_bcode) throws Exception; 				 //게시글 읽기

		//게시글 목록
		List<CodecheckVO> listAllCodecheck(String searchOption, String keyword, int start, int end) throws Exception;
		
		//게시글 갯수
		int getCountCodecheck(String searchOption, String keyword) throws Exception;
	
	}
