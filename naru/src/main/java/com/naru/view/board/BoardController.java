package com.naru.view.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.naru.main.Pager;
import com.naru.model.board.BoardService;
import com.naru.model.board.BoardVO;

@Controller

@SessionAttributes("board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	// �Խñ� ��� ��
	@RequestMapping("/write")
	public String write(BoardVO vo) throws Exception {
		return "board/write";
	}
	// �Խñ� ���
	@RequestMapping(value = "/createBoard", method = RequestMethod.POST)
	public String createBoard(BoardVO vo) throws Exception {
		boardService.createBoard(vo);
		return "board/list";
	}

	// �Խñ� ���� ��
	@RequestMapping("/updateWrite")
	public String updateWrite(BoardVO vo) throws Exception {
		return "board/updateWrite";
	}

	// �Խñ� ����
	@RequestMapping(value = "/updateBoard", method = RequestMethod.POST)
	public String updateBoard(BoardVO vo) throws Exception {
		if (vo.getTitle() != null) {
			boardService.updateBoard(vo);
			return "board/view";
		} else {
			return "board/write";
		}
		// return "redirect:/board";
	}

	// �Խñ� ����
	@RequestMapping("/delete")
	public String deleteBoard(int bno) throws Exception {
		boardService.deleteBoard(bno); // ���� ó��
		return "redirect:/board"; // ������� �̵�
	}

	// �Խñ� ��� + �˻� + ����¡
	@RequestMapping("/board")
	public String listAllBoard(Model model, HttpSession session,
			@RequestParam(defaultValue = "TITLE") String searchOption,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// �Խñ� ���� ���
		int count = boardService.getCountBoard(searchOption, keyword);

		session.setAttribute("searchOption", searchOption);
		session.setAttribute("keyword", keyword);
		session.setAttribute("search", search);
		session.setAttribute("curPage", curPage);

		// ������ ���� ����
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<BoardVO> list = boardService.listAllBoard(searchOption, keyword, start, end); // �Խñ� ���

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // map�� �ڷ� ����
		map.put("count", count);
		map.put("pager", pager); // ������ �׹����̼��� ���� ����
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("search", search);
		model.addAttribute("map", map);
		return "board/list";
	}

	// �Խñ� �󼼺���
	@RequestMapping("/view")
	public String readBoard(@RequestParam("bno") int bno, @RequestParam("show") String show, Model model,
			HttpSession session, @RequestParam(defaultValue = "TITLE") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {


		boardService.viewCnt(bno, session); // ��ȸ��
		model.addAttribute("board", boardService.readBoard(bno)); // �Խñ� �б�

		// ���� ����
		searchOption = (String) session.getAttribute("searchOption");
		session.setAttribute("searchOption", searchOption);

		keyword = (String) session.getAttribute("keyword");
		session.setAttribute("keyword", keyword);

		search = (String) session.getAttribute("search");
		session.setAttribute("search", search);

		// curPage = (int) session.getAttribute("curPage");
		curPage = (Integer) session.getAttribute("curPage");
		session.setAttribute("curPage", curPage);

		BoardVO plist = boardService.previousB(bno);
		BoardVO nlist = boardService.nextB(bno);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("previousB", plist);
		map.put("nextB", nlist);
		model.addAttribute("map", map);

		return "board/view";
	}
}