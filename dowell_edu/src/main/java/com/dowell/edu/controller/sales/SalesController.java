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
		
		
		System.out.println("1 = " + cust_no);
		System.out.println("2 = " + sal_dt);
		System.out.println("3 = " + prt_cd);
		System.out.println("4 = " + sal_no);
		
		String sal_dt1 = sal_dt.replaceAll("-", "");
		
		   //brdy_dt.replaceAll("-", ""); 
		   System.out.println("dddddddddddddddddddddd = " + sal_dt1);
		   
		   
		   
		Map<String, Object> param= new HashMap<>();
		param.put("cust_no",cust_no);
		param.put("sal_dt",sal_dt1);
		param.put("prt_cd",prt_cd);
		param.put("sal_no",sal_no);
		
		//히스토리 타이틀 찾아오기salesHistoryHead
		 List<SalesMasterVO> salesHistoryHead = salesService.selectSalesDetailHead(param);
	      System.out.println(salesHistoryHead);
		
		//리스트나열
		 List<SalesMasterVO> salesHistorylist = salesService.salesDetailList(param);
	      System.out.println(salesHistorylist);
	      
	     // model.addAttribute("list", salesHistorylist);
		
	      mv.addObject("listHead", salesHistoryHead);
	      mv.addObject("list", salesHistorylist);
	      mv.setViewName("/sales/salesHistory");
			return mv;
	}
		
		
	//salesAllSearchList	
	@ResponseBody
	@RequestMapping(value="/salesAllSearchList", method = { RequestMethod.POST, RequestMethod.GET },
			produces ="application/text; charset=utf8")
	public String salesAllSearchList (@RequestParam String jn_prt_cd
								   ,@RequestParam String cust_no
								   ,@RequestParam String fromDate
								   ,@RequestParam String toDate
								   ,Model model			) throws Exception{
      
	   
		System.out.println(jn_prt_cd);
		System.out.println(cust_no);
		System.out.println(fromDate);
		System.out.println(toDate);
		
		
		Map<String, Object> param= new HashMap<>();

	      param.put("jn_prt_cd",jn_prt_cd);
		  param.put("cust_no",cust_no);
		  param.put("fromDate",fromDate);
		  param.put("toDate",toDate);
      
	      List<SalesMasterVO> list = salesService.selectslaesAllSearchList(param);
	      System.out.println(list);
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

		 System.out.println(prd_cd);
		System.out.println(prt_cd);
			
		 Map<String, Object> param= new HashMap<>();
		 param.put("prd_cd",prd_cd);
		 param.put("prt_cd",prt_cd);
		 
		 List<SalesIvcoMasterVO> list = salesService.selectpartnerInvenInqList(param);
		
		 JSONObject obj = new JSONObject();
	     obj.put("list", list);
	     
	     String resp = obj.toString();
		
		return resp;
		 
		 
	 }
	 
	//sales/prdInventorySearch
	 @ResponseBody
	 @RequestMapping(value="/prdInventorySearch", method = {RequestMethod.POST, RequestMethod.GET }, 
	 				produces ="application/text; charset=utf8")
	 public String prdInventorySearch(@RequestParam(value="prt_cd",required=false) String prt_cd 
			  						,@RequestParam(value="prd_cd",required=false) String prd_cd) throws Exception{
		 System.out.println(prd_cd);
			System.out.println(prt_cd);
				
//			 for(int i=0 ; i<prd_cd.length() ; i++) {
//                 char a = prd_cd.charAt(i); // 숫자가 아닌 다른 수를 입력했을 경우 찾기
//                 int asc = (int)a; // 아스키코드로 변경
//                 if(asc<48 || asc>57) {
//                     System.out.println("숫자만 입력해주세요.");
//                     b=true;
//                     break;
//             }
			Map<String, Object> param= new HashMap<>();
			 param.put("prd_cd",prd_cd);
			 param.put("prt_cd",prt_cd);
			
			
			 
			 boolean isNumber = true; //숫자맞다
			 
			 for(int i=0 ; i < prd_cd.length() ; i++) {
				char a = prd_cd.charAt(i);
				System.out.println("느아아ㅏ앙아아아 =" + a );
				int asc = (int)a;
				if(asc<48 || asc>57) {
					
					isNumber = false;
					break;
				}
				
			}
			 
			 
			 JSONObject obj = new JSONObject();
			 
			if(isNumber) {
				List<SalesIvcoMasterVO> list = salesService.selectprdInventorySearch(param);
				obj.put("list", list);
				
			}else {
				List<SalesIvcoMasterVO> listNM = salesService.selectprdInventoryNm(param);
				obj.put("listnm", listNM);
			}
			
			 
				
				
			     
			     
		 
		 //List<SalesIvcoMasterVO> list = salesService.selectprdInventorySearch(param);
			 String resp = obj.toString();
			 System.out.println("나와랏 뿅 =" + resp );
		
		return resp;
		 
		 
	 } 
	// /sales/salesReturn
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
		 
		 System.out.println(cust_no);
		 System.out.println(sal_dt);
		 System.out.println(prt_cd);
		 System.out.println(sal_no);
		 System.out.println(user_id);
		 
		 
			Map<String, Object> param= new HashMap<>();
			param.put("cust_no",cust_no);
			param.put("sal_dt",sal_dt);
			param.put("prt_cd",prt_cd);
			param.put("sal_no",sal_no);
			
		//원본데이터-mt
		  List<SalesMasterVO> customerRtnlist = salesService.selectCustomerRtnList(param);
	      System.out.println("완전한 리스트mt =" + customerRtnlist);
	      System.out.println("사이즈mt =" + customerRtnlist.size());
	      customerRtnlist.get(0).setUser_id(user_id);
	      System.out.println("1");
	      //mt
	      Map<String, Object> rtnParam= new HashMap<>();
	      rtnParam.put("listr",customerRtnlist);
	      
	      System.out.println("2");
	      result = salesService.insertRtn(rtnParam);	
	      System.out.println("3");
	      if(result <= 0) {
	    	  log.info("고객판매 테이블 insert 오류입니다.");
	      }
	      
	      
	      
	      //원본데이터-dt
	      List<SalesDetailVO> detailRtnlist = salesService.selectDetailRtnList(param);
	      System.out.println("완전한 리스트dt =" + detailRtnlist);
	      System.out.println("사이즈dt =" + detailRtnlist.size());
	      
	      //sal_no구하기
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
	      int resultdetail = salesService.insertdetailRtn(detailParam);
	      if(resultdetail <= 0) {
	    	  log.info("고객판매상세 테이블 insert 오류입니다.");
	      }
	      
	      List<SalesIvcoMasterVO> salesIvcoMasterList = new ArrayList<>();
	      SalesIvcoMasterVO salesIvcoMaster;
	      
	      for(int i = 0; i < detailRtnlist.size(); i++) {
	    	  for(int j = 0; j < selectIvcoMtList.size(); j++) {
	    		  if(detailRtnlist.get(i).getPrd_cd().equals(
	    		     selectIvcoMtList.get(j).getPrd_cd()) &&
	    				 detailRtnlist.get(i).getPrt_cd().equals(
	    			     selectIvcoMtList.get(j).getPrt_cd())) {
	    			  salesIvcoMaster = new SalesIvcoMasterVO(
	    					prt_cd
	    				  , detailRtnlist.get(i).getPrd_cd()
	    				  , selectIvcoMtList.get(j).getIvco_qty()
	    				     + detailRtnlist.get(i).getSal_qty()
	    				  , user_id
	    		      );
	    			  salesIvcoMasterList.add(salesIvcoMaster);
	    		  }
	    	  }
	    	  salesService.updateSalesIvcoQty(salesIvcoMasterList.get(i));
	      }
	      
	      System.out.println("salesIvcoMasterList : " + salesIvcoMasterList);
	      
	      
//	      detailRtnlist.get(1).   .getSal_qty();

	      
	      //매장재고 총 + .sal_qty = update
	    		  
//	      selectIvcoMtList.get(1).get		  
	    		  
		      JSONObject obj = new JSONObject();
			    // obj.put("list", list);
			     
			     String resp = obj.toString();
				
				return resp;
		 }

	 
	 
	 
//	 @RequestMapping(value="/partnerInvenInqList", method = {RequestMethod.POST, RequestMethod.GET }, 
//	 				produces ="application/text; charset=utf8")
//	 public ModelAndView partnerInvenInqList(@RequestParam(value="prt_cd",required=false) String prt_cd 
//			 						  ,@RequestParam(value="prd_cd",required=false) String prd_cd
//			 						  ,ModelAndView mv) throws Exception{
//
//		 System.out.println(prd_cd);
//		System.out.println(prt_cd);
//			
//		 Map<String, Object> param= new HashMap<>();
//		 param.put("prd_cd",prd_cd);
//		 param.put("prt_cd",prt_cd);
//		 
//		 List<SalesIvcoMasterVO> list = salesService.selectpartnerInvenInqList(param);
//		
//		 mv.addObject("list", list);
//		mv.setViewName("/sales/partnerInventoryInquiry");
//		
//		return mv;
//		 
//		 
//	 }
	 
	 // /sales/salesRegisterEnroll
	 @ResponseBody
	 @RequestMapping(value="/salesRegisterEnroll", method = {RequestMethod.POST, RequestMethod.GET }, 
	 				produces ="application/text; charset=utf8")
	 public void salesRegisterEnroll(HttpServletRequest request
									 ,@RequestParam(value="prt_cd",required=false) String prt_cd
									 ,@RequestParam(value="sal_dt",required=false) String sal_dt
									 ,@RequestParam(value="sal_no",required=false) List<String> sal_no
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
									 
									 ) throws Exception{
		 
		 
		 System.out.println("여기는 prt_cd =" + prt_cd);
		 System.out.println("여기는 sal_dt =" + sal_dt);
		 System.out.println("여기는 sal_no =" + sal_no);
		 System.out.println("여기는 sal_tp_cd =" + sal_tp_cd);
		 System.out.println("여기는 tot_sal_qty =" + tot_sal_qty);
		 System.out.println("여기는 tot_sal_amt =" + tot_sal_amt);
		 System.out.println("여기는 csh_stlm_amt =" + csh_stlm_amt);
		 System.out.println("여기는 crd_stlm_amt =" + crd_stlm_amt);
		 System.out.println("여기는 cust_no =" + cust_no);
		 System.out.println("여기는 crd_no1 =" + crd_no1);
		 System.out.println("여기는 crd_no2 =" + crd_no2);
		 System.out.println("여기는 crd_no3 =" + crd_no3);
		 System.out.println("여기는 crd_no4 =" + crd_no4);
		 System.out.println("여기는 vld_ym =" + vld_ym);
		 System.out.println("여기는 crd_co_cd =" + crd_co_cd);
		 System.out.println("여기는 user_id =" + user_id);
		 
		 System.out.println("여기는 crd_no =" + crd_no);
		 System.out.println("여기는 prd_csmr_upr =" + prd_csmr_upr);
		 System.out.println("여기는 sal_qty =" + sal_qty);
		 System.out.println("여기는 sal_amt =" + sal_amt);
		 System.out.println("여기는 prd_cd =" + prd_cd);
		 System.out.println("여기는 prd_nm =" + prd_nm);
		 System.out.println("여기는 ivco_qty =" + ivco_qty);
		
		 double totVosAmt = 0.0;  // 총공급가액
		 double totVatAmt = 0.0;  // 총부가세액
		 double salVosAmt[] = new double[prd_csmr_upr.size()];		  // 공급가액	
		 double salVatAmt[] = new double[prd_csmr_upr.size()];		  // 판매부가세액
		 int step = prd_csmr_upr.size();   							  // 넘어온 판매 수금 갯수
		 List<String> sal_amt_list = new ArrayList<>();

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
		 System.out.println("여기! : " + vld_ym);
		 String vld_ym2 = "";
		 if(vld_ym != "") {
			 vld_ym2 = vld_ym.replaceAll("/", "").substring(0,6);			 
		 }
		 System.out.println("vld_ym2 = " + vld_ym2);
		 //String crd_no = "";
		
		 if(crd_no1 != "" && crd_no2 != "" && crd_no3 != "" && crd_no4 != "") {
			 System.out.println("합쳤습니다.");
			 crd_no= crd_no1 +  crd_no2 + crd_no3 + crd_no4;			 
		 }
		 
		 System.out.println("crd_no = " + crd_no);
		 
		 tot_sal_amt = tot_sal_amt.replace(",", "");

		 

		 SalesMasterVO salesMasterVO = null;
		 // 현금만 왔을 때
		 if(csh_stlm_amt != 0 && crd_stlm_amt == 0) {
			 System.out.println("현금만 왔음!");
			 salesMasterVO = new SalesMasterVO(
					  prt_cd
					 ,sal_dt1
					 ,0         // sal_no는 쿼리단에서 max로 찾아서 쓰기 떄문에 객체에는 0으로 넣어줌.
					 ,sal_tp_cd
					 ,Integer.parseInt(tot_sal_qty)
					 ,Integer.parseInt(tot_sal_amt)
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
			 System.out.println("카드만 왔음!");
			 salesMasterVO = new SalesMasterVO(
					  prt_cd
					 ,sal_dt1
					 ,0
					 ,sal_tp_cd
					 ,Integer.parseInt(tot_sal_qty)
					 ,Integer.parseInt(tot_sal_amt)
					 ,totVosAmt
					 ,totVatAmt
					 ,crd_stlm_amt
					 ,0
					 ,cust_no
					 ,crd_no
					 ,vld_ym2
					 ,crd_co_cd
					 ,user_id
					 );	
		 }
		 //카드 현금 둘 다 왔을 때
		 else if(csh_stlm_amt != 0 && crd_stlm_amt != 0 ) {
			 // 고객판매 객체
			 System.out.println("카드랑 현금 왔음!");
			 salesMasterVO = new SalesMasterVO(
					  prt_cd
					 ,sal_dt1
					 ,0
					 ,sal_tp_cd
					 ,Integer.parseInt(tot_sal_qty)
					 ,Integer.parseInt(tot_sal_amt)
					 ,totVosAmt
					 ,totVatAmt
					 ,csh_stlm_amt
					 ,crd_stlm_amt
					 ,0
					 ,cust_no
					 ,crd_no
					 ,vld_ym2
					 ,crd_co_cd
					 ,user_id
					 );			 			 
		 }
		 
		//salesMasterVO를 고객판매 db에 insert
		int resultsalesRegistermt = salesService.insertsalesRegisterMt(salesMasterVO);
			System.out.println("salesMasterVO = " + salesMasterVO);
		//sal_no구하기
		int salNo = salesService.selectSalNo(prt_cd);
			
		/*
		 * prd_csmr_upr    sal_qty   sal_amt   prd_cd   prd_nm    ivco_qty
		 * 
		 */
		
		//상품판매상세
		SalesDetailVO salesDetailVO;
		List<SalesDetailVO> detailVOList = new ArrayList<SalesDetailVO>();
		for(int i = 0; i < step; i++) {
			salesDetailVO = new SalesDetailVO(
				  prt_cd
				 ,sal_dt1
				 ,salNo		// sal_no는 위에서 최신 sal_no를 찾아서 넣어줌.
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
		
		System.out.println("고객판매 : " + salesMasterVO);
		for(int i = 0; i < step; i++) {
			System.out.println("고객판매상세 : " + detailVOList.get(i));			
		}

		
		
		Map<String, Object> dtParam= new HashMap<>();
		dtParam.put("list",detailVOList);
		
		
		//detailVOList를 고객판매상세 db에 insert
		int salesRegisterdtList = salesService.insertsalesRegisterDtList(dtParam);
		
		 
		 System.out.println("여기는 crd_no =" + crd_no);
		 
		 
		 //매장재고SD_IVCO01_MT
		 //여기서 판매했으니 매장수량 - 각 상품의 수량
		 //위 rtn에서는 매장수량 + 각 상품의 수량
		 //매장코드prt_cd 상품코드 prd_cd ivco_qty, sys4개
		 
//		 SalesIvcoMasterVO copySalesIvcoMasterVo = new SalesIvcoMasterVO();
//		 copySalesIvcoMasterVo.setUser_id(user_id);
//		 //매장재고 원본
		 List<SalesIvcoMasterVO> selectIvcoMtList = salesService.selectDetailIvcoList(prt_cd);
//		 if(copySalesIvcoMasterVo.getPrd_cd().equals(prd_cd)) {
//			 
//		 }
//		 List<String> prd_cdt_list = new ArrayList<>();
//		 for(int i = 0; i < step; i++) {
//			 sal_amt_list.add(sal_amt.get(i).replace(",", ""));
//		 }
//		 SalesIvcoMasterVO salesIvcoMasterVO;
//		 List<SalesIvcoMasterVO> IvcoMtList = new ArrayList<SalesIvcoMasterVO>();
//		 
//		 int updateIvcoQty= 0;
//		 int OriginIvcoQty = selectIvcoMtList.get(0).getIvco_qty();
//		 
//		 for(int i = 0; i < step; i++) {
//			 //prt_cd랑 prd_cd가 같을떄
//			 if((selectIvcoMtList.get(0).getPrt_cd().equals(prt_cd)) &&
//				(selectIvcoMtList.get(0).getPrd_cd().equals(prd_cd.get(i)))){
//				 updateIvcoQty = OriginIvcoQty - ivco_qty.get(i);
//				 System.out.println("updateIvcoQty = " + updateIvcoQty);
//			 }
//		 
//			 IvcoMtList.add(updateIvcoQty);
//		 }
		 									//(String, List<String>, List<Integer>, String
		 List<SalesIvcoMasterVO> salesIvcoMasterList = new ArrayList<>();
		 SalesIvcoMasterVO salesIvcoMaster;
		 for(int i = 0; i < step; i++) {
			 salesIvcoMaster = new SalesIvcoMasterVO(prt_cd, prd_cd.get(i), Integer.parseInt(sal_qty.get(i)), user_id);			 			 
			 salesIvcoMasterList.add(salesIvcoMaster);
		 }
		 
		 //selectIvcoMtList      // 원본
		 //salesIvcoMasterList   // 업데이트 할거
		 for(int i = 0; i < step; i++) {
			for(int j = 0; j < selectIvcoMtList.size(); j++) {
				//원본 리스트와 업데이트할 리스트를 비교하는 부분 
				if(salesIvcoMasterList.get(i).getPrt_cd().equals(
						selectIvcoMtList.get(j).getPrt_cd()) &&
				   salesIvcoMasterList.get(i).getPrd_cd().equals(
						selectIvcoMtList.get(j).getPrd_cd())) 
				{
					//Ivco_qty에 처음에 sal_qty를 넣어줌
					//원래 가지고있던 전체 수량에서 판매 수량을 빼주고 다시 세팅하는 부분
					salesIvcoMasterList.get(i).setIvco_qty(
						selectIvcoMtList.get(j).getIvco_qty() - 
						salesIvcoMasterList.get(i).getIvco_qty()
					);
				}
			}
			salesService.updateSalesIvcoQty(salesIvcoMasterList.get(i));
		 }
		 System.out.println("salesIvcoMasterList : " + salesIvcoMasterList);		 
		 
		 //이 리스트를 가지고 update 해주기
		 //salesIvcoMasterList
		 
		 //원본은 vo 에 ivco_qty -> String 이었고 parameter도 List<String>이었음
		 //현재 int랑 integer로 변환 후 수정중
		 Map<String, Object> ivcoParam= new HashMap<>();
		 ivcoParam.put("prt_cd",prt_cd);
		 ivcoParam.put("prd_cd",prd_cd);
//		 ivcoParam.put("sal_qty",sal_qty);
		 ivcoParam.put("ivco_qty",ivco_qty);
		 ivcoParam.put("user_id",user_id);
		 //ivcoParam.put("updateIvcoQty",updateIvcoQty);
		 
		 //salesService.updateIvcoMt(ivcoParam);
		 
		 
	
		 
		 
	 } 
	 
	 
}