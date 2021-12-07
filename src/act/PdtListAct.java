package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class PdtListAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<ProductInfo> pdtList = new ArrayList<ProductInfo>();
		// ProductInfo�� �ν��Ͻ����� ���� ArrayList�� �����Ͽ� ��ǰ����� �������� ����

		request.setCharacterEncoding("utf-8");
		int cpage = 1, psize = 8, bsize = 10, spage, epage, rcnt, pcnt;
		if (request.getParameter("cpage") != null)	cpage = Integer.parseInt(request.getParameter("cpage"));
		if (request.getParameter("psize") != null)	psize = Integer.parseInt(request.getParameter("psize"));

		// �˻����� : �˻���, ��/�Һз�, ��
		String keyword, bcata, scata, snum, endnum;
		keyword	= request.getParameter("keyword");	// �˻���
		bcata	= request.getParameter("bcata");	// ��з� ���̵�
		scata	= request.getParameter("scata");	// �Һз� ���̵�
		snum	= request.getParameter("snum");		// �ο� �� ���� �ο�
		endnum	= request.getParameter("endnum");	// �ο� �� ���� �ο�

		// �˻� ���ǿ� ���� where�� ����
		String where = " where a.as_id = c.as_id and b.ab_id = c.ab_id ";
		if (!isEmpty(keyword))	where += " and lcase(a.ri_name) like '%" + keyword.trim().toLowerCase() + "%' ";
		else	keyword = "";
		if (!isEmpty(bcata))	where += " and b.ab_id = '" + bcata + "' ";
		else	bcata = "";
		if (!isEmpty(scata))	where += " and c.as_id = '" + scata + "' ";
		else	scata = "";
		if (!isEmpty(snum))		where += " and a.ri_min >= '" + snum.trim() + "' ";
		else	snum = "";
		if (!isEmpty(endnum))	where += " and a.ri_max <= '" + endnum.trim() + "' ";
		else	endnum = "";

		// ���ı��� : �Ǹŷ�-��, ����-����, ��ǰ��-��, ����-��, ��ȸ-��, ����-��, ���-��(�⺻)
		String sort = request.getParameter("sort");
		if (sort == null || sort.equals(""))	sort = "idd";	// ������ �⺻������ ��ǰ ��� �������� ����
		// ���ı��ؿ� ���� order by �� ����
		String order = " order by ri_" + sort.substring(0, sort.length() - 1) + 
			(sort.charAt(sort.length() - 1) == 'a' ? " asc" : " desc");

		PdtListSvc pdtListSvc = new PdtListSvc();
		rcnt = pdtListSvc.getPdtCount(where);
		// �˻��� ��ǰ�� �� ������ ����¡�� ���� �ʿ�
		pdtList = pdtListSvc.getPdtList(where, order, cpage, psize);
		// �� ������(cpage)���� ������ �˻��� ��ǰ����� �޾ƿ�

		pcnt = rcnt / psize;
		if (rcnt % psize > 0)	pcnt++;				// ��ü ������ ����
		spage = (cpage - 1) / bsize * bsize + 1;	// ����� ���� ������ ��ȣ
		epage = spage + bsize - 1;
		if (epage > pcnt)	epage = pcnt;			// ����� ���� ������ ��ȣ

		PdtPageInfo pdtPageInfo = new PdtPageInfo();// ����¡�� �ʿ��� �������� ������ �ν��Ͻ�
		pdtPageInfo.setCpage(cpage);	pdtPageInfo.setPsize(psize);		pdtPageInfo.setBsize(bsize);
		pdtPageInfo.setSpage(spage);	pdtPageInfo.setEpage(epage);		pdtPageInfo.setRcnt(rcnt);
		pdtPageInfo.setPcnt(pcnt);		pdtPageInfo.setKeyword(keyword);	pdtPageInfo.setBcata(bcata);
		pdtPageInfo.setScata(scata);	pdtPageInfo.setSnum(snum);			pdtPageInfo.setEndnum(endnum);
		pdtPageInfo.setSort(sort);

		ArrayList<PdtCataBig> cataBigList = pdtListSvc.getCataBigList();		// ��з� ���
		ArrayList<PdtCataSmall> cataSmallList = pdtListSvc.getCataSmallList();	// �Һз� ���

		request.setAttribute("pdtPageInfo", pdtPageInfo);
		request.setAttribute("pdtList", pdtList);
		request.setAttribute("cataBigList", cataBigList);
		request.setAttribute("cataSmallList", cataSmallList);
		// ������ �ν��Ͻ����� request��ü�� �Ӽ����� �����Ͽ� �̵��� �������� ������

		ActionForward forward = new ActionForward();
		forward.setPath("/product/pdt_list.jsp");

		return forward;
	}

	private boolean isEmpty(String str) {	// ���ڿ��� � ���̵� ��� �ִ��� ���θ� �˻��ϴ� �޼ҵ�
		boolean empty = true;
		if (str != null && !str.equals(""))	empty = false;
		return empty;
	}
}
