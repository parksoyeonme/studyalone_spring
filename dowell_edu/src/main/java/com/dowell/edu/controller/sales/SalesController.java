package com.dowell.edu.controller.sales;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		
		mv.addObject("SaltpCd", list);
		mv.setViewName("/sales/customerSalesRegister");
		return mv;
	}
	//매장재고조회 팝업 view
		@RequestMapping(value="/partnerInventoryInquiry")
		public ModelAndView partnerInventoryInquiry(ModelAndView mv) throws Exception{
			
			mv.setViewName("/sales/partnerInventoryInquiry");
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

}
