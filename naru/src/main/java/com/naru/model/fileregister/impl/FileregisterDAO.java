package com.naru.model.fileregister.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naru.model.change.ChangeVO;
import com.naru.model.fileregister.FileregisterVO;

@Repository
public class FileregisterDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 게시글 쓰기
	public void uploadFile(FileregisterVO vo) {
		mybatis.insert("FileregisterDAO.uploadFile", vo);
	}
	
	// 게시글 수정
		public void updateFileregister(FileregisterVO vo) {
			mybatis.update("FileregisterDAO.updateFileregister", vo);
		}

	// 게시물 목록
	public List<FileregisterVO> listAllFileregister(String searchOption, String keyword, String selectedDate, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("selectedDate", selectedDate);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("FileregisterDAO.listAllFileregister", map);
	}


	// 게시글 갯수
	public int getCountFileregister(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return mybatis.selectOne("FileregisterDAO.getCountFileregister", map);
	}

	public List<FileregisterVO> listByDate(String selectedDate) throws Exception {
	    Map<String, Object> Map = new HashMap<String, Object>();
	    Map.put("selectedDate", selectedDate);
	    return mybatis.selectList("FileregisterDAO.listByDate", Map);
	}

}