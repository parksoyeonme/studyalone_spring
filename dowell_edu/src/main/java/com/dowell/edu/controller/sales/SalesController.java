package com.dowell.edu.controller.sales;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
//	 @ResponseBody
//	 @RequestMapping(value="/salesReturn", method = { RequestMethod.POST, RequestMethod.GET },
//			 produces = "application/text; charset=utf8")
//		public String custRegister(ModelAndView mv
//									,SalesMasterVO salesMasterVo) throws Exception{
//			      
//		 
//		 System.out.println("뭐라 나오나요..? =" + salesMasterVo);
//		 JSONObject json = new JSONObject();
//		 return json.toString(); 
//		 }

//	 
	 
	 
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
//	 @ResponseBody
//	 @RequestMapping(value="/salesRegisterEnroll", method = {RequestMethod.POST, RequestMethod.GET }, 
//	 				produces ="application/text; charset=utf8")
//	 public String salesRegisterEnroll(HttpServletRequest request,
//			 					@RequestParam SalesMasterVO salesMasteVo
//			 			) throws Exception{
//		
//		 String [] prdCdArray = request.getParameter(salesMasteVo.setPrt_cd("prt_cd"));
//		 
//		
//
//			Map<String, Object> param= new HashMap<>();
//			 param.put("prd_cd",prd_cd);
//			 param.put("prt_cd",prt_cd);
//			
//			
//		return null;
//		 
//		 
//	 } 
	 
	 
	 /*  	"prt_cd" : prt_cd,
            	"tot_sal_amt" : tot_sal_amt,
            	"tot_sal_qty" : tot_sal_qty,
            	"tot_vos_amt" : tot_vos_amt,
            	"tot_vat_amt" : tot_vat_amt,
            	"csh_stlm_amt" : csh_stlm_amt,
            	"crd_stlm_amt" : crd_stlm_amt,
            	"crd_no1" : crd_no1,
            	"crd_no2" : crd_no2,
            	"crd_no3" : crd_no3,
            	"crd_no4" : crd_no4,
            	"vld_ym" : vld_ym,
            	"crd_co_cd" : crd_co_cd

	  * */
	 
//	 @ResponseBody
//	 @RequestMapping(value="/salesRegisterEnroll", method = {RequestMethod.POST, RequestMethod.GET }, 
//	 				produces ="application/text; charset=utf8")
//	 public String salesRegisterEnroll(@RequestParam SalesMasterVO salesMasteVo
//			 			) throws Exception{
//		
//		
//			Map<String, Object> param= new HashMap<>();
//			 param.put("prd_cd",prd_cd);
//			 param.put("prt_cd",prt_cd);
//			
//			
//		return null;
//		 
//		 
//	 } 
}