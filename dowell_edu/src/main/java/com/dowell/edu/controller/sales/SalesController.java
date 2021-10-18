package com.dowell.edu.controller.sales;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dowell.edu.service.sales.SalesService;
import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.customer.CustomerHistoryVO;
import com.dowell.edu.vo.sales.SalesDetailVO;
import com.dowell.edu.vo.sales.SalesIvcoMasterVO;
import com.dowell.edu.vo.sales.SalesMasterVO;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

@Slf4j
@Controller
@RequestMapping("/sales")
public class SalesController {

	@Autowired
	private SalesService salesService;
	

	
	//고객판매관리 view
		@RequestMapping(value="/customerSalesList")
		public ModelAndView customerSalesList(ModelAndView mv) throws Exception{
			
			mv.setViewName("/sales/customerSalesList");
			return mv;
		}
		
	//고객판매수금등록 팝업 view
	@RequestMapping(value="/customerSalesRegister")
	public ModelAndView customerSalesRegister(CodeDetailVO codeDetailVo, ModelAndView mv) throws Exception{
		
		//판매,반품 코드
		List<CodeDetailVO> list = salesService.selectSaltpCd(codeDetailVo);
		
		
		mv.addObject("CommonCd", list);
		mv.setViewName("/sales/customerSalesRegister");
		return mv;
	}
	
	//매장재고조회 팝업 view
	@RequestMapping(value="/partnerInventoryInquiry")
	public ModelAndView partnerInventoryInquiry(ModelAndView mv) throws Exception{
		
		mv.setViewName("/sales/partnerInventoryInquiry");
		return mv;
	}
	
	//매장실적조회팝업 view - History
	@ResponseBody
	@RequestMapping(value="/salesHistory", method = { RequestMethod.POST, RequestMethod.GET },
   			produces ="application/text; charset=utf8")
	public ModelAndView salesHistoryList(Model model
			, ModelAndView mv
			,@RequestParam(value="cust_no", required=false) String cust_no
			,@RequestParam(value="sal_dt", required=false) String sal_dt
			,@RequestParam(value="prt_cd", required=false) String prt_cd
			,@RequestParam(value="sal_no", required=false) String sal_no
			) throws Exception{
		


		String sal_dt1 = sal_dt.replaceAll("-", "");
		
		Map<String, Object> param= new HashMap<>();
		param.put("cust_no",cust_no);
		param.put("sal_dt",sal_dt1);
		param.put("prt_cd",prt_cd);
		param.put("sal_no",sal_no);
		
	
		//판매상세조회 리스트나열
		List<SalesMasterVO> salesHistorylist = salesService.salesDetailList(param);
		

	      mv.addObject("list", salesHistorylist);
	      mv.setViewName("/sales/salesHistory");
			return mv;
	}
		
	//고객판매전체조회
	//salesAllSearchList	
	@ResponseBody
	@RequestMapping(value="/salesAllSearchList", method = { RequestMethod.POST, RequestMethod.GET },
			produces ="application/text; charset=utf8")
	public String salesAllSearchList (@RequestParam String jn_prt_cd
								   ,@RequestParam String cust_no
								   ,@RequestParam String fromDate
								   ,@RequestParam String toDate
								   ,Model model			) throws Exception{
   
		
		Map<String, Object> param= new HashMap<>();

	      param.put("jn_prt_cd",jn_prt_cd);
		  param.put("cust_no",cust_no);
		  param.put("fromDate",fromDate);
		  param.put("toDate",toDate);
      
	      List<SalesMasterVO> list = salesService.selectslaesAllSearchList(param);

	      JSONObject obj = new JSONObject();
	      obj.put("list", list);
      
	      String resp = obj.toString();
	      
	     return resp;
	}

	//매장재고조회(팝업)
	 @ResponseBody
	 @RequestMapping(value="/partnerInvenInqList", method = {RequestMethod.POST, RequestMethod.GET }, 
	 				produces ="application/text; charset=utf8")
	 public String partnerInvenInqList(@RequestParam(value="prt_cd",required=false) String prt_cd 
			 						  ,@RequestParam(value="prd_cd",required=false) String prd_cd) throws Exception{

	
		 Map<String, Object> param= new HashMap<>();
			 param.put("prd_cd",prd_cd);
			 param.put("prt_cd",prt_cd);
		 
		 List<SalesIvcoMasterVO> list = salesService.selectpartnerInvenInqList(param);
		
		 JSONObject obj = new JSONObject();
	     obj.put("list", list);
	     
	     String resp = obj.toString();
		
		return resp;
		 
		 
	 }
	 
	//sales/prdInventorySearch - 고객판매수금등록(팝업)안의 grid에서 조회
	 @ResponseBody
	 @RequestMapping(value="/prdInventorySearch", method = {RequestMethod.POST, RequestMethod.GET }, 
	 				produces ="application/text; charset=utf8")
	 public String prdInventorySearch(@RequestParam(value="prt_cd",required=false) String prt_cd 
			  						,@RequestParam(value="prd_cd",required=false) String prd_cd) throws Exception{

			Map<String, Object> param= new HashMap<>();
				param.put("prd_cd",prd_cd);
				param.put("prt_cd",prt_cd);
			

				List<SalesIvcoMasterVO> list = salesService.selectpartnerInvenInqList(param);
			 JSONObject obj = new JSONObject();
			 obj.put("list", list);

			
			 String resp = obj.toString();
		
		return resp;
		 
		 
	 } 
	 
	 //salesReturn 판매상세조회 반품
	 @ResponseBody
	 @RequestMapping(value="/salesReturn", method = { RequestMethod.POST, RequestMethod.GET },
			 produces = "application/text; charset=utf8")
		public String custRegister(ModelAndView mv
								,@RequestParam(value="sal_no",required=false) String sal_no 
		  						,@RequestParam(value="sal_dt",required=false) String sal_dt
		  						,@RequestParam(value="prt_cd",required=false) String prt_cd
		  						,@RequestParam(value="cust_no",required=false) String cust_no
		  						,@RequestParam(value="user_id",required=false) String user_id
								) throws Exception{
	
		 int result;

		 String sal_dt1 = sal_dt.replaceAll("-", "");
				 
		 	System.out.println("sal_no = " + sal_no);
		 	System.out.println("sal_dt1 = " + sal_dt1);
		 	System.out.println("prt_cd = " + prt_cd);
		 	System.out.println("cust_no = " + cust_no);
		 	System.out.println("user_id = " + user_id);
		 	
		 Map<String, Object> param= new HashMap<>();
			param.put("cust_no",cust_no);
			param.put("sal_dt",sal_dt1);
			param.put("prt_cd",prt_cd);
			param.put("sal_no",sal_no);
			
		  //원본데이터-mt(고객판매)
		  List<SalesMasterVO> customerRtnlist = salesService.selectCustomerRtnList(param);
	      customerRtnlist.get(0).setUser_id(user_id);

	      //mt
	      Map<String, Object> rtnParam= new HashMap<>();
	      	rtnParam.put("listr",customerRtnlist);
	      
	      result = salesService.insertRtn(rtnParam);	
	      if(result <= 0) {
	    	  log.info("고객판매 테이블 insert 오류입니다.");
	      }
	  
	      //원본데이터-dt(고객판매상세)
	      List<SalesDetailVO> detailRtnlist = salesService.selectDetailRtnList(param);
	      
	      //최신의 sal_no구하기
		  int salNo = salesService.selectSalNo(prt_cd);
	      
		  for(int i = 0; i < detailRtnlist.size(); i++) {
	    	  detailRtnlist.get(i).setUser_id(user_id);	
	    	  detailRtnlist.get(i).setSal_no(salNo);
	      }
	     
	     
	      //dt
	      Map<String, Object> detailParam= new HashMap<>();
	      	detailParam.put("listd",detailRtnlist);
	      
	      // 전체 매장 재고
	      List<SalesIvcoMasterVO> selectIvcoMtList = salesService.selectDetailIvcoList(prt_cd);
	    
	      //원본데이터-dt(고객판매상세): 반품insert
	      int resultdetail = salesService.insertdetailRtn(detailParam);
	     
	      if(resultdetail <= 0) {
	    	  log.info("고객판매상세 테이블 insert 오류입니다.");
	      }
	      
	      List<SalesIvcoMasterVO> salesIvcoMasterList = new ArrayList<>();
	      SalesIvcoMasterVO salesIvcoMaster;
	      
	      //원본데이터와 새로바뀐데이터를 비교하여서 List에 담은 뒤 매장재고 테이블 insert
	      for(int i = 0; i < detailRtnlist.size(); i++) {
	    	  for(int j = 0; j < selectIvcoMtList.size(); j++) {
	    		  if(detailRtnlist.get(i).getPrd_cd().equals(selectIvcoMtList.get(j).getPrd_cd()) 
	    			&& detailRtnlist.get(i).getPrt_cd().equals(selectIvcoMtList.get(j).getPrt_cd())) {
	    			  salesIvcoMaster = new SalesIvcoMasterVO(
	    					prt_cd
	    				  , detailRtnlist.get(i).getPrd_cd()
	    				  , selectIvcoMtList.get(j).getIvco_qty() + detailRtnlist.get(i).getSal_qty()
	    				  ,detailRtnlist.get(i).getSal_qty()
	    				  , user_id
	    		      );
	    			  salesIvcoMasterList.add(salesIvcoMaster);
	    		  }
	    	  }
	    	  //반품시 매장재고 + 
	    	  salesService.updateSalesIvcoQty(salesIvcoMasterList.get(i));
	      }
	      
	    		  
		      JSONObject obj = new JSONObject();
			  
		      String resp = obj.toString();
				
				return resp;
		 }

	 
	
	 //salesRegisterEnroll 고객판매수금등록
	 @ResponseBody
	 @RequestMapping(value="/salesRegisterEnroll", method = {RequestMethod.POST, RequestMethod.GET }, 
	 				produces ="application/text; charset=utf8")
	 public ModelAndView salesRegisterEnroll(HttpServletRequest request
									 ,@RequestParam(value="prt_cd",required=false) String prt_cd
									 ,@RequestParam(value="sal_dt",required=false) String sal_dt
									
									 ,@RequestParam(value="sal_tp_cd",required=false) String sal_tp_cd
									 ,@RequestParam(value="tot_sal_qty",required=false) String tot_sal_qty
									 ,@RequestParam(value="tot_sal_amt",required=false) String tot_sal_amt
									 ,@RequestParam(value="csh_stlm_amt", defaultValue="0", required=false) int csh_stlm_amt
									 ,@RequestParam(value="crd_stlm_amt", defaultValue="0", required=false) int crd_stlm_amt
									 ,@RequestParam(value="cust_no",required=false) String cust_no
									 ,@RequestParam(value="crd_no",required=false) String crd_no
									 ,@RequestParam(value="crd_no1",required=false) String crd_no1
									 ,@RequestParam(value="crd_no2",required=false) String crd_no2
									 ,@RequestParam(value="crd_no3",required=false) String crd_no3
									 ,@RequestParam(value="crd_no4",required=false) String crd_no4
									 ,@RequestParam(value="vld_ym",required=false) String vld_ym
									 ,@RequestParam(value="crd_co_cd",required=false) String crd_co_cd
									 ,@RequestParam(value="user_id",required=false) String user_id
									 
									 ,@RequestParam(value="prd_csmr_upr",required=false) List<String> prd_csmr_upr
									 ,@RequestParam(value="sal_qty",required=false) List<String> sal_qty
									 ,@RequestParam(value="sal_amt",required=false) List<String> sal_amt
									 ,@RequestParam(value="prd_cd",required=false) List<String> prd_cd
									 ,@RequestParam(value="prd_nm",required=false) List<String> prd_nm
									 ,@RequestParam(value="ivco_qty",required=false) List<Integer> ivco_qty
									 ,RedirectAttributes redirectAttr
									 ,ModelAndView mv
									 ,Model model
									 ) throws Exception{
		 

		 
		
		 double totVosAmt = 0.0;  // 총공급가액
		 double totVatAmt = 0.0;  // 총부가세액
		 double salVosAmt[] = new double[prd_csmr_upr.size()];		  // 공급가액	
		 double salVatAmt[] = new double[prd_csmr_upr.size()];		  // 판매부가세액
		 int step = prd_csmr_upr.size();   							  // 넘어온 판매 수금 갯수

		 
		 /*
		  * 부가세액, 공급가액, 총부가세액, 총공급가액 계산
		    부가세액 = 소비자판매가 * 10%
			공급가액 = 소비자판매가 – (소비자판매가 * 10%)
		  */
		 
		 for(int i =0; i< step; i++) {
			 salVatAmt[i] = Double.parseDouble(prd_csmr_upr.get(i)) * 0.1;
			 salVosAmt[i] = Double.parseDouble(prd_csmr_upr.get(i)) - salVatAmt[i];
			 totVatAmt += salVatAmt[i];
			 totVosAmt += salVosAmt[i];
		 }
		 
		 String sal_dt1 = sal_dt.replaceAll("-", "");

		
		 if(crd_no1 != "" && crd_no2 != "" && crd_no3 != "" && crd_no4 != "") {
			 crd_no= crd_no1 +  crd_no2 + crd_no3 + crd_no4;			 
		 }
		 
		 int tot_sal_amt_re = 0;
		 
		 for(int i = 0; i < step; i++) {
			 tot_sal_amt_re += Integer.parseInt(sal_amt.get(i));
		 }
		 System.out.println("1부터 10까지의 합은 " + tot_sal_amt_re + "입니다.");


		 //현매장재고
		 //받아온 상품 판매수량 -> 현매장재고보다 판매수량이 많으면 return
		 
		 //매장재고 원본
		 List<SalesIvcoMasterVO> selectIvcoMtList = salesService.selectDetailIvcoList(prt_cd);

		 List<SalesIvcoMasterVO> salesIvcoMasterList = new ArrayList<>();
		 SalesIvcoMasterVO salesIvcoMaster;
		 for(int i = 0; i < step; i++) {
			 salesIvcoMaster = new SalesIvcoMasterVO(
													  prt_cd
													 ,prd_cd.get(i)
													 ,ivco_qty.get(i)
													 ,Integer.parseInt(sal_qty.get(i))
													 ,user_id
													 );			 			 
			 salesIvcoMasterList.add(salesIvcoMaster);
		 }
		 boolean flag = true;
		 //selectIvcoMtList      // 원본
		 //salesIvcoMasterList   // 업데이트 할정보
		 for(int i = 0; i < step; i++) {
			for(int j = 0; j < selectIvcoMtList.size(); j++) {
				if(salesIvcoMasterList.get(i).getPrt_cd().equals(selectIvcoMtList.get(j).getPrt_cd()) &&
				salesIvcoMasterList.get(i).getPrd_cd().equals(selectIvcoMtList.get(j).getPrd_cd()))
				{
					//원본이랑 받아온 재고수량이랑 다르면
					if(selectIvcoMtList.get(j).getIvco_qty() != salesIvcoMasterList.get(i).getIvco_qty()) {
						flag = false;
						System.out.println("여기서 실패");
						return mv;
					}
				}
			}
		 }
			if(flag = true) {
				for(int i = 0; i < step; i++) {
					for(int j = 0; j < selectIvcoMtList.size(); j++) {
						if(salesIvcoMasterList.get(i).getPrt_cd().equals(selectIvcoMtList.get(j).getPrt_cd()) &&
								   salesIvcoMasterList.get(i).getPrd_cd().equals(selectIvcoMtList.get(j).getPrd_cd())) {
							System.out.println("밖 원본 =" + selectIvcoMtList.get(j).getIvco_qty());
							System.out.println("밖 업뎃정보 =" + salesIvcoMasterList.get(i).getIvco_qty());
							salesIvcoMasterList.get(i).setIvco_qty(
									selectIvcoMtList.get(j).getIvco_qty() - salesIvcoMasterList.get(i).getSal_qty()
									);
						}
					}
				salesService.updateSalesIvcoQty(salesIvcoMasterList.get(i));
				}
			}
			
		
		 
		 SalesMasterVO salesMasterVO = null;
		 // 현금만 왔을 때
		 if(csh_stlm_amt != 0 && crd_stlm_amt == 0) {
			 salesMasterVO = new SalesMasterVO(
												  prt_cd
												 ,sal_dt1
												 ,0         // sal_no는 쿼리단에서 max로 찾아서 쓰기 떄문에 객체에는 0으로 넣어줌.
												 ,sal_tp_cd
												 ,Integer.parseInt(tot_sal_qty)
												 ,tot_sal_amt_re
												 ,totVosAmt
												 ,totVatAmt
												 ,csh_stlm_amt
												 ,0
												 ,cust_no
												 ,user_id
												);	
			 
		 }
		 // 카드만 왔을 때
		 else if(csh_stlm_amt == 0 && crd_stlm_amt != 0){
			 salesMasterVO = new SalesMasterVO(
												  prt_cd
												 ,sal_dt1
												 ,0
												 ,sal_tp_cd
												 ,Integer.parseInt(tot_sal_qty)
												 ,tot_sal_amt_re
												 ,totVosAmt
												 ,totVatAmt
												 ,crd_stlm_amt
												 ,0
												 ,cust_no
												 ,crd_no
												 ,vld_ym
												 ,crd_co_cd
												 ,user_id
												);	
		 }
		 //카드 현금 둘 다 왔을 때
		 else if(csh_stlm_amt != 0 && crd_stlm_amt != 0 ) {
			 // 고객판매 객체
			 salesMasterVO = new SalesMasterVO(
												  prt_cd
												 ,sal_dt1
												 ,0
												 ,sal_tp_cd
												 ,Integer.parseInt(tot_sal_qty)
												 ,tot_sal_amt_re
												 ,totVosAmt
												 ,totVatAmt
												 ,csh_stlm_amt
												 ,crd_stlm_amt
												 ,0
												 ,cust_no
												 ,crd_no
												 ,vld_ym
												 ,crd_co_cd
												 ,user_id
												);			 			 
		 }
		 
		//고객판매수금등록 고객판매
		int resultsalesRegistermt = salesService.insertsalesRegisterMt(salesMasterVO);

		 if(resultsalesRegistermt <= 0) {
	    	  log.info("고객판매수금등록 insert 오류입니다.");
	      }
		 
		//최신의 sal_no구하기
		int salNo = salesService.selectSalNo(prt_cd);
			
		//상품판매상세
		SalesDetailVO salesDetailVO;
		List<SalesDetailVO> detailVOList = new ArrayList<SalesDetailVO>();
		for(int i = 0; i < step; i++) {
			salesDetailVO = new SalesDetailVO(
												  prt_cd
												 ,sal_dt1
												 ,salNo		
												 ,i
												 ,prd_cd.get(i)
												 ,Integer.parseInt(prd_csmr_upr.get(i))
												 ,Integer.parseInt(sal_qty.get(i))
												 ,Integer.parseInt(sal_amt.get(i))
												 ,salVosAmt[i]
												 ,salVatAmt[i]
												 ,user_id
											);
			detailVOList.add(i, salesDetailVO);
		}
		
		
		Map<String, Object> dtParam= new HashMap<>();
			dtParam.put("list",detailVOList);

		//detailVOList를 고객판매상세 db에 insert
		int salesRegisterdtList = salesService.insertsalesRegisterDtList(dtParam);
		
		if(salesRegisterdtList <= 0) {
	    	  log.info("고객판매수금등록 insert 오류입니다.");
	      }
		
		mv.setViewName("/sales/customerSalesRegister");
		return mv;

	 } 
	 
}