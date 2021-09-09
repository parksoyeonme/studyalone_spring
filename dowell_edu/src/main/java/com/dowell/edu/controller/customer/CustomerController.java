package com.dowell.edu.controller.customer;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dowell.edu.service.customer.CustomerService;
import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.customer.CustomerHistoryVO;
import com.dowell.edu.vo.customer.CustomerVO;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

@Slf4j
@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	
	//고객조회 view
	@RequestMapping(value="/customerList")
	public ModelAndView customerList(CodeDetailVO codeDetailVo, ModelAndView mv) throws Exception{
		
		//고객상태조회(cust_ss_cd)
		List<CodeDetailVO> custSsCd = customerService.selectcustSsCd(codeDetailVo);
		
		mv.addObject("custSsCd", custSsCd);
		mv.setViewName("/customer/customerList");
		
		return mv;
	}
	
	//고객정보조회 view
	@RequestMapping(value="/customerDetail")
	public ModelAndView CustomerDetail(ModelAndView mv) throws Exception{
		
		mv.setViewName("/customer/customerDetail");
		return mv;
	}
	
	//고객조회 팝업 view
	@RequestMapping(value="/customerInquiry")
	public ModelAndView customerInquiry(ModelAndView mv) throws Exception{
		

		mv.setViewName("/customer/customerInquiry");
		
		return mv;
	}


	//고객조회 팝업
	   @ResponseBody
	   @RequestMapping(value="/customerInquiryList", method = { RequestMethod.POST, RequestMethod.GET },
			   produces ="application/text; charset=utf8")
	   public String customerInquiryList(Model model,@RequestParam(value="cust_nm", required=false) String cust_nm,
			   										@RequestParam(value="mbl_no", required=false) String mbl_no) throws Exception{
		 
		   Map<String, Object> param= new HashMap<>();

		      param.put("cust_nm",cust_nm);
		      param.put("mbl_no",mbl_no);
	      
	      List<CustomerVO> list = customerService.selectcustSearchList(param);
	    
	      model.addAttribute("allList" , list);

	      JSONObject obj = new JSONObject();
	      obj.put("list", list);
	      
	      String resp = obj.toString();
	      
	      	return resp;
	      
	   }
	   
	   //고객리스트
	   @ResponseBody
	   @RequestMapping(value="/custAllSearchList", method = { RequestMethod.POST, RequestMethod.GET },
			   produces ="application/text; charset=utf8")
	   public String custAllSearchList(@RequestParam String jn_prt_cd,
									   @RequestParam String cust_ss_cd,
									   @RequestParam String cust_no,
									   @RequestParam String fromDate,
									   @RequestParam String toDate,
									   Model model			) throws Exception{
	      
		   
		   
		   Map<String, Object> param= new HashMap<>();
	
		      param.put("jn_prt_cd",jn_prt_cd);
		      param.put("cust_ss_cd",cust_ss_cd);
		      param.put("cust_no",cust_no);
		      param.put("fromDate",fromDate);
		      param.put("toDate",toDate);
		      
	      List<CustomerVO> list = customerService.selectcustAllSearchList(param);
	     
	      JSONObject obj = new JSONObject();
	      obj.put("list", list);
	      
	      String resp = obj.toString();
		      
		     return resp;
	      
	   }
	   

	   
	 //고객조회 히스토리팝업
	   @RequestMapping(value="/customerHistory", method = { RequestMethod.POST, RequestMethod.GET },
			   produces ="application/text; charset=utf8")
		public ModelAndView custHistory(@RequestParam(value="cust_no", required=false) String cust_no
										, ModelAndView mv) throws Exception{
			
		   //고객히스토리리스트(팝업)
			List<CodeDetailVO> custHistory = customerService.custHistoryList(cust_no);
			
			//고객히스토리(cust_no,cust_nm)
			List<CustomerVO> custinfoHistory = customerService.custInfoHistoryList(cust_no);
			
			mv.addObject("history", custHistory);
			mv.addObject("infohistory", custinfoHistory);
			mv.setViewName("/customer/customerHistory");
			
			return mv;
		}
	   	
	 //신규고객등록 view
		@RequestMapping(value="/customerRegister")
		public ModelAndView customerRegister(ModelAndView mv) throws Exception{
			
			mv.setViewName("/customer/customerRegister");
			
			return mv;
		}
	
}
