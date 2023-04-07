package com.naru.main;

	public class Pager {
		 //�������� �Խù� ��
		public static final int PAGE_SCALE = 10;
		
		//ȭ��� ������ ��
		public static final int BLOCK_SCALE = 5;
		
		public int curPage;  	//���� ������
		public int prevPage; 	//����������
		public int nextPage;	//����������
		public int totPage;  	//��ü ������ ����
		public int totBlock;	//��ü ������ ��� ����
		public int curBlock; 	//���� ���
		public int prevBlock;	//���� ���
		public int nextBlock;	//���� ���
		public int pageBegin;	//#{start}������ ���޵� ��
		public int pageEnd;  	//#{end}������ ���޵� ��
		public int blockBegin;	//����� ���� ������ ��ȣ
		public int blockEnd; 	//����� �� ������ ��ȣ
		
		
		//������
		//Pager(���ڵ� ����, ����� ������ ��ȣ)
		public Pager(int count, int curPage) {
			curBlock = 1; 				//���� ��Ϲ�ȣ
			this.curPage = curPage; 	//���� ������ ��ȣ
			setTotPage(count);			//��ü ������ ���� ���
			setPageRange(); 			//#{}, #{} �� ���
			setTotBlock(); 				//��ü ��� ���� ��� 
			setBlockRange(); 			//����� ����, �� ��ȣ ���
		}
		
		public void setBlockRange() {
			//���ϴ� �������� ���° ��Ͽ� ���ϴ��� ���
			curBlock = (int)Math.ceil((curPage - 1) / BLOCK_SCALE) + 1;
			//����� ����, �� ������ ��ȣ ���
			blockBegin = (curBlock - 1) * BLOCK_SCALE + 1;
			blockEnd = blockBegin + BLOCK_SCALE - 1;
			
			//������ ������ ��ȣ�� ������ �ʰ����� �ʵ��� ó��
			if(blockEnd > totPage) {
				blockEnd = totPage;
			}
			
			//[����], [����]�� ������ �� �̵��� ������ ��ȣ
			prevPage = (curBlock == 1) ? 1 : (curBlock - 1) * BLOCK_SCALE;
			nextPage = curBlock > totBlock ? (curBlock * BLOCK_SCALE) : (curBlock * BLOCK_SCALE) + 1;
			
			//������ �������� ������ �ʰ����� �ʵ��� ó��
			if(nextPage >= totPage) {
				nextPage = totPage;
			}

		}
		
		//����� ���� ���
		public void setTotBlock() {
			totBlock = (int)Math.ceil(totPage * 1.0 / BLOCK_SCALE);
		}
		
		//where rn getween #{start} and #{end}�� �Էµ� ��
		public void setPageRange() {
			//���۹�ȣ = (���� ������ - 1) X ������ �� �Խù� �� + 1
			pageBegin = (curPage -1) * PAGE_SCALE + 1;
			//����ȣ = ���۹�ȣ + ������ �� �Խù� �� -1
			pageEnd = pageBegin + PAGE_SCALE - 1;
		}
		
		@Override
		public String toString() {
			return "Pager [curPage=" + curPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", totPage="
					+ totPage + ", totBlock=" + totBlock + ", curBlock=" + curBlock + ", prevBlock=" + prevBlock
					+ ", nextBlock=" + nextBlock + ", pageBegin=" + pageBegin + ", pageEnd=" + pageEnd + ", blockBegin="
					+ blockBegin + ", blockEnd=" + blockEnd + "]";
		}
		
		public int getCurPage() {
			return curPage;
		}
	
		public void setCurPage(int curPage) {
			this.curPage = curPage;
		}
		
		public int getPrevPage() {
			return prevPage;
		}
		
		public void setPrevPage(int prevPage) {
			this.prevPage = prevPage;
		}
		
		public int getNextPage() {
			return nextPage;
		}
		
		public void setNextPage(int nextPage) {
			this.nextPage = nextPage;
		}
		
		public int getTotPage() {
			return totPage;
		}
		
		public void setTotPage(int totPage) {
			this.totPage = totPage;
		}
		
		public int getTotBlock() {
			return totBlock;
		}
		
		public void setTotBlock(int totBlock) {
			this.totBlock = totBlock;
		}
		
		public int getCurBlock() {
			return curBlock;
		}
		
		public void setCurBlock(int curBlock) {
			this.curBlock = curBlock;
		}
		
		public int getPrevBlock() {
			return prevBlock;
		}
		
		public void setPrevBlock(int prevBlock) {
			this.prevBlock = prevBlock;
		}
		
		public int getNextBlock() {
			return nextBlock;
		}
		
		public void setNextBlock(int nextBlock) {
			this.nextBlock = nextBlock;
		}
		
		public int getPageBegin() {
			return pageBegin;
		}
		
		public void setPageBegin(int pageBegin) {
			this.pageBegin = pageBegin;
		}
		
		public int getPageEnd() {
			return pageEnd;
		}
		
		public void setPageEnd(int pageEnd) {
			this.pageEnd = pageEnd;
		}
		
		public int getBlockBegin() {
			return blockBegin;
		}
		
		public void setBlockBegin(int blockBegin) {
			this.blockBegin = blockBegin;
		}
		
		public int getBlockEnd() {
			return blockEnd;
		}
		
		public void setBlockEnd(int blockEnd) {
			this.blockEnd = blockEnd;
		}
		
		public static int getPageScale() {
			return PAGE_SCALE;
		}
		
		public static int getBlockScale() {
			return BLOCK_SCALE;
		}
		
	}
