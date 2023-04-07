package com.naru.view.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naru.main.Pager;
import com.naru.model.member.MemberService;
import com.naru.model.member.MemberVO;

	@Controller
	public class MemberController {
		
		@Autowired
		private MemberService memberService;
		
		@RequestMapping("/home")
		public String home() {
			return "home";
		}
		
		//회원 가입 뷰
		@RequestMapping(value = "/signup", method = RequestMethod.GET)
		public String signUpView(MemberVO vo) {
			return "member/signup";
		}
		
		//마이페이지 - 비밀번호 view
		@RequestMapping(value = "/mypage2", method = RequestMethod.GET)
		public String mypageView2(MemberVO vo) {
			return "member/mypage2";
		}
		
		//마이페이지 - 비밀번호 확인 처리
		@RequestMapping(value = "/mypage2", method = RequestMethod.POST)
		public String mypage2(MemberVO vo) {
			memberService.login(vo);
			return "member/mypage3";
		}
		
		//마이페이지 - 회원정보 수정 view
		@RequestMapping(value = "/mypage3", method = RequestMethod.GET)
		public String mypageView3(MemberVO vo) {
			return "member/mypage3";
		}
		
		//마이페이지 - 회원정보 수정 처리
		@RequestMapping(value = "/mypage3", method = RequestMethod.POST)
		public String mypage3(MemberVO vo) {
			memberService.updateMember(vo);
			return "member/mypage";
		}
		
		//마이페이지 - 완료 view
		@RequestMapping(value = "/mypage4")
		public String mypage4(MemberVO vo) {
			return "member/mypage4";
		}
		
		//로그아웃
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			session.invalidate();
			return "member/login";
		}
		
		//회원정보 삭제
		@RequestMapping(value = "/delMember", method = RequestMethod.GET)
		public String deleteMember(MemberVO vo, HttpSession session) {
			memberService.deleteMember(vo);
			session.invalidate();
			return "home";
		}
		
		//회원가입
		@RequestMapping(value = "/join")
		public String signUp(MemberVO vo) {
			System.out.println("가입 성공!");
			memberService.insertMember(vo);
			return "home";
		}
		
		// 회원 체크
		@ResponseBody
		@RequestMapping(value = "/checkMember")
		public int checkMember(MemberVO vo) {
			int checkMember = memberService.checkMember(vo);
			
			return checkMember;
		}
		
		//로그인 view
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String loginView(MemberVO vo) {
			return "member/login";
		}
		
		//로그인
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String login(MemberVO vo, HttpSession session) {
			MemberVO member = memberService.login(vo);
			if(member != null) {
			session.setAttribute("member", member); 
				return "home";
			} else {
				return "member/login";
			}
		}
		
		/* //회원승인 컨트롤러(수정필요)
		 * if(member != null) { if(member.isApproved()) {
		 * session.setAttribute("member", member); return "home"; } else { return
		 * "member/not-approved"; } } else { return "member/login"; }
		 */
		
		//아이디 찾기 페이지 view
		@RequestMapping(value = "/findId")
		public String findIdView() {
			return "member/findId";
		}
		
		
		//아이디 찾기 실행
		@RequestMapping(value = "/findId", method = RequestMethod.POST)
		public String findIdAction(MemberVO vo, Model model) {
			MemberVO user = memberService.findId(vo);
			
			if(user == null) {
				model.addAttribute("check", 1);
			} else {
				model.addAttribute("check", 0);
				model.addAttribute("member_id", user.getMember_id());
			} return "member/findId";
		}
		
		//비밀번호 찾기
		//비밀번호 찾기 페이지로 이동
		@RequestMapping(value = "/findPassword")
		public String findPassword() {
			return "member/findPassword";
		}
		
		//비밀번호 찾기 실행
		@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
		public String findPasswordAction(MemberVO vo, Model model) {
			MemberVO user = memberService.findPassword(vo);
			
			if(user == null) {
				model.addAttribute("check", 1);
			} else {
				model.addAttribute("check", 0);
				model.addAttribute("updateid", user.getMember_id());
			} return "member/findPassword";
		}
		
		//비밀번호 바꾸기 메서드
		@RequestMapping(value = "/update_password", method = RequestMethod.POST)
		public String updatePasswordAction
			(@RequestParam(value = "updateid", required = false)
			String id, MemberVO vo) {
			vo.setMember_id(id);
			System.out.println(vo);
			memberService.updatePassword(vo);
			return "member/findPasswordConfirm";
		}
		
		//비밀번호 변경 후 성공 페이지로 이동
		@RequestMapping(value = "/check_password_view")
		public String checkPasswordForModify(HttpSession session, Model model) {
			MemberVO loginUser = (MemberVO) session.getAttribute("login");
			
			if(loginUser == null) {
				return "member/login";
			} else {
			return "member/findPasswordConfirm";
			}
		}
		
		//관리자용 회원 목록
		@RequestMapping(value = "/memberList", method = RequestMethod.GET)
		public String memberListView(@RequestParam(defaultValue = "1")
				int curPage, MemberVO vo, Model model) {
			int count = memberService.getAdminCountMember(vo); 
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			
			List<MemberVO> list = memberService.getAdminMemberList(start, end, vo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("count", count);
			map.put("pager", pager);
			model.addAttribute("map", map);
			return "admin/memberList";
		}
		
		//관리자 - 회원정보 수정 view
		@RequestMapping(value = "/updateMember", method = RequestMethod.GET)
		public String adminUpdateView(MemberVO vo, Model model) {
			model.addAttribute("member2", memberService.memberDetail(vo));
			return "admin/updateMember";
		}
		
		//관리자 - 회원정보 수정 처리
		@RequestMapping(value = "/updateMember2", method = RequestMethod.POST)
		public String adminUpdate(MemberVO vo) {
			System.out.println("전");
			memberService.updateMember2(vo);
			System.out.println("후");
			return "admin/memberList";
		}
		
		//관리자 - 회원정보 삭제 처리
		@RequestMapping(value = "/delMember2", method = RequestMethod.GET)
		public String deleteMember2(MemberVO vo) {
			memberService.deleteMember(vo);
			return "admin/memberList";
		}
		
		/*
		 * @RequestMapping(value = "/updateMember", method = RequestMethod.GET) public
		 * String listMembers(Model model) { List<MemberVO> members =
		 * memberService.getMembersByApproval(vo) }
		 */
		
		/*
		 * @ResponseBody
		 * 
		 * @RequestMapping("/dropId") public void dropID(String id) {
		 * memberService.dropUser(id); }
		 * 
		 * @ResponseBody
		 * 
		 * @RequestMapping("/successId") public void successId(String id) {
		 * System.out.println(id);
		 * System.out.println("open! user sign success Id ajax!");
		 * memberService.successId(id); }
		 * 
		 * @ResponseBody
		 * 
		 * @RequestMapping("/failId") public void failId(String id) {
		 * System.out.println(id);
		 * System.out.println("open! user sign failId Id ajax!");
		 * memberService.failed(id); }
		 */
	}
