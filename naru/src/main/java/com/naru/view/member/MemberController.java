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
		
		//ȸ�� ���� ��
		@RequestMapping(value = "/signup", method = RequestMethod.GET)
		public String signUpView(MemberVO vo) {
			return "member/signup";
		}
		
		//���������� - ��й�ȣ view
		@RequestMapping(value = "/mypage2", method = RequestMethod.GET)
		public String mypageView2(MemberVO vo) {
			return "member/mypage2";
		}
		
		//���������� - ��й�ȣ Ȯ�� ó��
		@RequestMapping(value = "/mypage2", method = RequestMethod.POST)
		public String mypage2(MemberVO vo) {
			memberService.login(vo);
			return "member/mypage3";
		}
		
		//���������� - ȸ������ ���� view
		@RequestMapping(value = "/mypage3", method = RequestMethod.GET)
		public String mypageView3(MemberVO vo) {
			return "member/mypage3";
		}
		
		//���������� - ȸ������ ���� ó��
		@RequestMapping(value = "/mypage3", method = RequestMethod.POST)
		public String mypage3(MemberVO vo) {
			memberService.updateMember(vo);
			return "member/mypage";
		}
		
		//���������� - �Ϸ� view
		@RequestMapping(value = "/mypage4")
		public String mypage4(MemberVO vo) {
			return "member/mypage4";
		}
		
		//�α׾ƿ�
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			session.invalidate();
			return "member/login";
		}
		
		//ȸ������ ����
		@RequestMapping(value = "/delMember", method = RequestMethod.GET)
		public String deleteMember(MemberVO vo, HttpSession session) {
			memberService.deleteMember(vo);
			session.invalidate();
			return "home";
		}
		
		//ȸ������
		@RequestMapping(value = "/join")
		public String signUp(MemberVO vo) {
			System.out.println("���� ����!");
			memberService.insertMember(vo);
			return "home";
		}
		
		// ȸ�� üũ
		@ResponseBody
		@RequestMapping(value = "/checkMember")
		public int checkMember(MemberVO vo) {
			int checkMember = memberService.checkMember(vo);
			
			return checkMember;
		}
		
		//�α��� view
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String loginView(MemberVO vo) {
			return "member/login";
		}
		
		//�α���
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
		
		/* //ȸ������ ��Ʈ�ѷ�(�����ʿ�)
		 * if(member != null) { if(member.isApproved()) {
		 * session.setAttribute("member", member); return "home"; } else { return
		 * "member/not-approved"; } } else { return "member/login"; }
		 */
		
		//���̵� ã�� ������ view
		@RequestMapping(value = "/findId")
		public String findIdView() {
			return "member/findId";
		}
		
		
		//���̵� ã�� ����
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
		
		//��й�ȣ ã��
		//��й�ȣ ã�� �������� �̵�
		@RequestMapping(value = "/findPassword")
		public String findPassword() {
			return "member/findPassword";
		}
		
		//��й�ȣ ã�� ����
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
		
		//��й�ȣ �ٲٱ� �޼���
		@RequestMapping(value = "/update_password", method = RequestMethod.POST)
		public String updatePasswordAction
			(@RequestParam(value = "updateid", required = false)
			String id, MemberVO vo) {
			vo.setMember_id(id);
			System.out.println(vo);
			memberService.updatePassword(vo);
			return "member/findPasswordConfirm";
		}
		
		//��й�ȣ ���� �� ���� �������� �̵�
		@RequestMapping(value = "/check_password_view")
		public String checkPasswordForModify(HttpSession session, Model model) {
			MemberVO loginUser = (MemberVO) session.getAttribute("login");
			
			if(loginUser == null) {
				return "member/login";
			} else {
			return "member/findPasswordConfirm";
			}
		}
		
		//�����ڿ� ȸ�� ���
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
		
		//������ - ȸ������ ���� view
		@RequestMapping(value = "/updateMember", method = RequestMethod.GET)
		public String adminUpdateView(MemberVO vo, Model model) {
			model.addAttribute("member2", memberService.memberDetail(vo));
			return "admin/updateMember";
		}
		
		//������ - ȸ������ ���� ó��
		@RequestMapping(value = "/updateMember2", method = RequestMethod.POST)
		public String adminUpdate(MemberVO vo) {
			System.out.println("��");
			memberService.updateMember2(vo);
			System.out.println("��");
			return "admin/memberList";
		}
		
		//������ - ȸ������ ���� ó��
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
