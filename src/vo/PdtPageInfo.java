package vo;

public class PdtPageInfo {
// ��ǰ ���� ��Ͽ��� ����¡�� ���� �ʿ��� �����͵�� �˻� �� ���Ŀ� �ʿ��� �����͵��� ������ Ŭ����
	private int cpage, psize, bsize, spage, epage, rcnt, pcnt;
	// ���� ������ ��ȣ, ������ũ��, ����ũ��, ����������, ����������, �Խù���, ��������
	private String keyword, bcata, scata, brand, snum, endnum, sort;
	// �˻���, ��з�, �Һз�, �귣��, ���۰���, ���ᰡ�� ���� �˻� ���ǰ� ���� ����

	public int getCpage() {
		return cpage;
	}

	public void setCpage(int cpage) {
		this.cpage = cpage;
	}

	public int getPsize() {
		return psize;
	}

	public void setPsize(int psize) {
		this.psize = psize;
	}

	public int getBsize() {
		return bsize;
	}

	public void setBsize(int bsize) {
		this.bsize = bsize;
	}

	public int getSpage() {
		return spage;
	}

	public void setSpage(int spage) {
		this.spage = spage;
	}

	public int getEpage() {
		return epage;
	}

	public void setEpage(int epage) {
		this.epage = epage;
	}

	public int getRcnt() {
		return rcnt;
	}

	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}

	public int getPcnt() {
		return pcnt;
	}

	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getBcata() {
		return bcata;
	}

	public void setBcata(String bcata) {
		this.bcata = bcata;
	}

	public String getScata() {
		return scata;
	}

	public void setScata(String scata) {
		this.scata = scata;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}


	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getSnum() {
		return snum;
	}

	public void setSnum(String snum) {
		this.snum = snum;
	}

	public String getEndnum() {
		return endnum;
	}

	public void setEndnum(String endnum) {
		this.endnum = endnum;
	}

}