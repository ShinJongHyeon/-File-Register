package com.naru.model.codecheck.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naru.model.codecheck.CodecheckService;
import com.naru.model.codecheck.CodecheckVO;

@Service("CodecheckService")
public class CodecheckServiceImpl implements CodecheckService {

	@Autowired
	private CodecheckDAO codecheckDAO;
	
	
	// 게시글 쓰기
	public void createCodecheck(CodecheckVO vo) throws Exception {
		codecheckDAO.createCodecheck(vo);
	}

	// 게시글 수정
	public void updateCodecheck(CodecheckVO vo) throws Exception {
		codecheckDAO.updateCodecheck(vo);
	}

	// 게시글 삭제
	public void deleteCodecheck(String codecheck_bcode) throws Exception {
		codecheckDAO.deleteCodecheck(codecheck_bcode);
	}

	// 게시글 읽기
	public CodecheckVO readCodecheck(String codecheck_bcode) throws Exception {
		return codecheckDAO.readCodecheck(codecheck_bcode);
	}

	// 게시글 목록
	public List<CodecheckVO> listAllCodecheck(String searchOption, String keyword, int start, int end) throws Exception {
		return codecheckDAO.listAllCodecheck(searchOption, keyword, start, end);
	}


	// 게시글 갯수
	public int getCountCodecheck(String searchOption, String keyword) throws Exception {
		return codecheckDAO.getCountCodecheck(searchOption, keyword);
	}

	
}