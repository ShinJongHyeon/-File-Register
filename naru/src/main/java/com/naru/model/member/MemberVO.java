package com.naru.model.member;


	public class MemberVO {
		private int member_seq;
		private String member_id; //ȸ�� ���̵�
		private String member_name; //ȸ�� �̸�
		private String member_pwd; //ȸ�� ��й�ȣ
		private String member_email; //ȸ�� �̸���
		private String member_pass;
		/* private boolean approved; //ȸ�� ���� */
	
		
		public int getMember_seq() {
			return member_seq;
		}
		

		public void setMember_seq(int member_seq) {
			this.member_seq = member_seq;
		}

		
		public String getMember_id() {
			return member_id;
		}
	
		
		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}
	
	
		public String getMember_name() {
			return member_name;
		}	
	
	
		public void setMember_name(String member_name) {
			this.member_name = member_name;
		}	
	
	
		public String getMember_pwd() {
			return member_pwd;
		}	
	
	
		public void setMember_pwd(String member_pwd) {
			this.member_pwd = member_pwd;
		}
	
	
		public String getMember_email() {
			return member_email;
		}
	
	
		public void setMember_email(String member_email) {
			this.member_email = member_email;
		}
		
		public String getMember_pass() {
			return member_pass;
		}


		public void setMember_pass(String member_pass) {
			this.member_pass = member_pass;
		}


		@Override
		public String toString() {
			return "MemberVO [member_seq=" + member_seq + ", member_id=" + member_id + ", member_name=" + member_name
					+ ", member_pwd=" + member_pwd + ", member_email=" + member_email + ", member_pass=" + member_pass
					+ "]";
		}

		
		
		/*
		 * public boolean isApproved() { return approved; }
		 * 
		 * 
		 * public void setApproved(boolean approved) { this.approved = approved; }
		 */


		


		
	
	
	}