package com.naru.model.change.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naru.model.change.ChangeVO;

@Repository
public class ChangeDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 게시글 수정
	public void updateChange(ChangeVO vo) {
		mybatis.update("ChangeDAO.updateChange", vo);
	}

/*	// 게시물 목록
	public List<ChangeVO> listAllChange(String searchOption, String keyword, String selectedDate, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("selectedDate", selectedDate);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("ChangeDAO.listAllChange", map);
	}


	// 게시글 갯수
	public int getCountChange(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return mybatis.selectOne("ChangeDAO.getCountChange", map);
	}

	public List<ChangeVO> listByDate(String selectedDate) throws Exception {
	    Map<String, Object> Map = new HashMap<String, Object>();
	    Map.put("selectedDate", selectedDate);
	    return mybatis.selectList("ChangeDAO.listByDate", Map);
	}
*/
}