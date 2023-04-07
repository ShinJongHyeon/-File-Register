package com.naru.model.codecheck.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naru.model.codecheck.CodecheckVO;

@Repository
public class CodecheckDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 게시글 쓰기
	public void createCodecheck(CodecheckVO vo) {
		mybatis.insert("CodecheckDAO.createCodecheck", vo);
	}

	// 게시글 수정
	public void updateCodecheck(CodecheckVO vo) {
		mybatis.update("CodecheckDAO.updateCodecheck", vo);
	}

	// 게시글 삭제
	public void deleteCodecheck(String codecheck_bcode) {
		mybatis.update("CodecheckDAO.deleteCodecheck", codecheck_bcode);
	}

	// 게시글 읽기
	public CodecheckVO readCodecheck(String codecheck_bcode) {
		return (CodecheckVO) mybatis.selectOne("CodecheckDAO.readCodecheck", codecheck_bcode);
	}


	// 게시물 목록
	public List<CodecheckVO> listAllCodecheck(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("CodecheckDAO.listAllCodecheck", map);
	}

	// 게시글 갯수
	public int getCountCodecheck(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return mybatis.selectOne("CodecheckDAO.getCountCodecheck", map);
	}


}