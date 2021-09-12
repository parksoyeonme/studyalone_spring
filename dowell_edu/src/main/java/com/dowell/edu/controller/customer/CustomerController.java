package com.dowell.edu.controller.customer;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dowell.edu.service.customer.CustomerService;
import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.customer.CustomerHistoryVO;
import com.dowell.edu.vo.customer.CustomerVO;
import com.dowell.edu.vo.member.MemberVO;

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
   	
//	 //신규고객등록 view
//		@RequestMapping(value="/customerRegister")
//		public ModelAndView customerRegister(ModelAndView mv) throws Exception{
//			
//			mv.setViewName("/customer/customerRegister");
//			
//			return mv;
//		}
		
	//신규고객등록 view
	   @RequestMapping(value="/customerRegister", method = { RequestMethod.POST, RequestMethod.GET },
			   produces ="application/text; charset=utf8")
		public ModelAndView customerRegister(ModelAndView mv,CodeDetailVO codeDetailVo) throws Exception{
			
		   //sec_cd,poc_cd
		   List<CodeDetailVO> codeCd = customerService.selectcodeCd(codeDetailVo);
		   
		  
		   	mv.addObject("codeCd", codeCd);
			mv.setViewName("/customer/customerRegister");
			
			return mv;
		}
	   
	   //신규등록 custRegister
	   @ResponseBody
	   @RequestMapping(value="/custRegister", method = { RequestMethod.POST, RequestMethod.GET },
			   produces ="application/text; charset=utf8")
	   public ModelAndView custRegister(@RequestParam("cust_nm") String cust_nm
								 ,@RequestParam("poc_cd") String poc_cd
								 ,@RequestParam("brdy_dt") String brdy_dt
								 ,@RequestParam("sex_cd") String sex_cd
								 ,@RequestParam("mbl_no_first") String mbl_no_first
								 ,@RequestParam("mbl_no_middle") String mbl_no_middle
								 ,@RequestParam("mbl_no_end") String mbl_no_end
								 ,@RequestParam("scal_yn") String scal_yn
								 ,@RequestParam("psmt_grc_cd") String psmt_grc_cd
								 ,@RequestParam("email_first") String email_first
								 ,@RequestParam("email_end") String email_end
								 ,@RequestParam("zip_cd") String zip_cd
								 ,@RequestParam("addr") String addr
								 ,@RequestParam("addr_dtl") String addr_dtl
								 ,@RequestParam("mrrg_dt") String mrrg_dt
								 ,@RequestParam("jn_prt_cd") String jn_prt_cd
								 ,@RequestParam("email_rcv_yn") String email_rcv_yn
								 ,@RequestParam("sms_rcv_yn") String sms_rcv_yn
								 ,@RequestParam("dm_rcv_yn") String dm_rcv_yn
								 ,@RequestParam("tm_rcv_yn") String tm_rcv_yn
								 ,@RequestParam("session_id") String session_id
								 ,ModelAndView mv
								 ,HttpSession session
								 ,HttpServletRequest request
								 ,RedirectAttributes redirectAttr) throws Exception{
	      
		   
		
		   String mbl_no = mbl_no_first + mbl_no_middle + mbl_no_end;
		 
		   
		   String email ="";
		   
		   if(!email_first.equals("") && !email_end.equals("")) {
			   email = email_first + '@' + email_end;
		   }else {
			  email ="";
		   }
		   
		   
		   Map<String, Object> param= new HashMap<>();
	
		      param.put("cust_nm",cust_nm);
		      param.put("poc_cd",poc_cd);
		      param.put("brdy_dt",brdy_dt);
		      param.put("sex_cd",sex_cd);
		      param.put("mbl_no",mbl_no);
		      param.put("scal_yn",scal_yn);
		      param.put("psmt_grc_cd",psmt_grc_cd);
		      param.put("addr",addr);
		      param.put("addr_dtl",addr_dtl);
		      param.put("email",email);
		      param.put("mrrg_dt",mrrg_dt);
		      param.put("email_rcv_yn",email_rcv_yn);
		      param.put("sms_rcv_yn",sms_rcv_yn);
		      param.put("dm_rcv_yn",dm_rcv_yn);
		      param.put("tm_rcv_yn",tm_rcv_yn);
		      param.put("session_id",session_id);
		      param.put("zip_cd",zip_cd);
		      param.put("jn_prt_cd",jn_prt_cd);
		      
		      log.info("############################################"+param);
		      try {
		    	  int result = customerService.insertcust(param);
		    	  String msg = result > 0 ? "신규고객 등록 성공" : "신규고객 등록 실패";
		    	  redirectAttr.addFlashAttribute("msg", msg);
		      }catch(Exception e) {
					//1.로깅작업
					log.error(e.getMessage(),e);
					//2.다시spring container에 던질것.
					throw e;
		    
		      }
	    
		      mv.setViewName("/customer/customerList");
				
			return mv;
	      
	   }
	   
	   
//	   @RequestMapping(value="/custRegister", method = { RequestMethod.POST, RequestMethod.GET },
//			   produces ="application/text; charset=utf8")
//	   public ModelAndView custRegister(
//									 HttpServletRequest request
//									 ,ModelAndView mv
//									 ) throws Exception{
//	      
//		   
//		   String cust_nm = request.getParameter("cust_nm");
//		   String poc_cd = request.getParameter("poc_cd");
//		   String brdy_dt = request.getParameter("brdy_dt");
//		   String sex_cd = request.getParameter("sex_cd");
//		   String mbl_no = request.getParameter("mbl_no");
//		   String scal_yn = request.getParameter("scal_yn");
//		   String post_grc_cd = request.getParameter("post_grc_cd");
//		   String email = request.getParameter("email");
//		   String addr = request.getParameter("addr");
//		   String mrrg_dt = request.getParameter("mrrg_dt");
//		   String jn_prt_no = request.getParameter("jn_prt_no");
//		   String email_rcv_yn = request.getParameter("email_rcv_yn");
//		   String sms_rcv_yn = request.getParameter("sms_rcv_yn");
//		   String dm_rcv_yn = request.getParameter("dm_rcv_yn");
//		
//		   System.out.println(cust_nm);
//		   System.out.println(poc_cd);
//		   System.out.println(brdy_dt);
//		   System.out.println(sex_cd);
//		   System.out.println(mbl_no);
//		   System.out.println(scal_yn);
//		   System.out.println(post_grc_cd);
//		   System.out.println(email);
//		   System.out.println(addr);
//		   System.out.println(mrrg_dt);
//		   System.out.println(jn_prt_no);
//		   System.out.println(email_rcv_yn);
//		   System.out.println(sms_rcv_yn);
//		   System.out.println(dm_rcv_yn);
//
//		   Map<String, Object> param= new HashMap<>();
//	
//		   param.put("cust_nm",request.getParameter("cust_nm"));
//           param.put("poc_cd",request.getParameter("poc_cd"));
//           param.put("brdy_dt",request.getParameter("brdy_dt"));
//           param.put("sex_cd",request.getParameter("sex_cd"));
//           param.put("mbl_no",request.getParameter("mbl_no"));
//           param.put("scal_yn",request.getParameter("scal_yn"));
//           param.put("post_grc_cd",request.getParameter("post_grc_cd"));
//           param.put("email",request.getParameter("email"));
//           param.put("addr",request.getParameter("addr"));
//           param.put("mrrg_dt",request.getParameter("mrrg_dt"));
//           param.put("jn_prt_no",request.getParameter("jn_prt_no"));
//           param.put("email_rcv_yn",request.getParameter("email_rcv_yn"));
//           param.put("sms_rcv_yn",request.getParameter("sms_rcv_yn"));
//           param.put("dm_rcv_yn",request.getParameter("dm_rcv_yn"));
//
//		      
//		      log.info("##########나와주세요############# =" + param);
//		      try {
//					
//					//1. 업무로직	
////					int result = customerService.insertcust();
////					String msg = result > 0 ? "신규고객 등록 성공" : "신규고객 등록 실패";
//					//2.사용자피드백 준비 및 리다이렉트
//					
//				} catch(Exception e) {
//					//1.로깅작업
//					log.error(e.getMessage(),e);
//					//2.다시spring container에 던질것.
//					throw e;
//				}
//		   		
//		      
//		      mv.setViewName("/customer/customerRegister");
//				
//			return mv;
//	      
//	   }
	   
//	   @RequestMapping(value="/custRegister", method = { RequestMethod.POST, RequestMethod.GET },
//			   produces ="application/text; charset=utf8")
//	   		public ModelAndView custRegister(ModelAndView mv
//	   										,CustomerVO customerVo
//	   										,RedirectAttributes redirectAttr) throws Exception{
//				log.info("######나와주세요 =" + customerVo);
//				try {
//				
//					//1. 업무로직	
//					int result = customerService.insertcust(customerVo);
//					String msg = result > 0 ? "신규고객 등록 성공" : "신규고객 등록 실패";
//					//2.사용자피드백 준비 및 리다이렉트
//					redirectAttr.addFlashAttribute("msg", msg);
//				} catch(Exception e) {
//					//1.로깅작업
//					log.error(e.getMessage(),e);
//					//2.다시spring container에 던질것.
//					throw e;
//				}
//		   		
//		   	
//		   		mv.setViewName("/customer/customerRegister");
//				
//				return mv;
//		}
	   
	   
//	   @RequestMapping(value="/custRegister", method = { RequestMethod.POST, RequestMethod.GET },
//			   produces ="application/text; charset=utf8")
//	   public ModelAndView custRegister(CustomerVO customerVo
//									 ,ModelAndView mv
//									 ,RedirectAttributes redirectAttr) throws Exception{
//	      
//		   
//		   
//
//		      
//		      log.info("##########나와주세요############# =" + customerVo);
//		      try {
//					
//					//1. 업무로직	
//					int result = customerService.insertcust(customerVo);
//					String msg = result > 0 ? "신규고객 등록 성공" : "신규고객 등록 실패";
//					//2.사용자피드백 준비 및 리다이렉트
//					redirectAttr.addFlashAttribute("msg", msg);
//				} catch(Exception e) {
//					//1.로깅작업
//					log.error(e.getMessage(),e);
//					//2.다시spring container에 던질것.
//					throw e;
//				}
//		   		
//		      
//		      mv.setViewName("/customer/customerRegister");
//				
//			return mv;
//	      
//	   }
	   
	   //이메일보류
//	   @ResponseBody
//	   @RequestMapping(value="/emailCheck", method= RequestMethod.POST)
//	   public String emailCheck(CustomerVO customerVo) throws Exception{
//	       //select * from member where userid = #{};
//	       //이 member 객체에는 id만 값이 들어있고, 다른 것은 다 null 값이다.
//		   CustomerVO email = customerService.emailCheck(customerVo);
//	       String message=null;
//	       if(email==null) {//사용할 수 있다. db에서 찾았는데없으니까
//	           message = "success";
//	       }else {//사용할 수 없다.
//	           message ="fail";
//	       }	
//	       return message;
//	   }
	   
	 //이메일보류
	   @ResponseBody
	   @RequestMapping(value="/emailCheck", method= RequestMethod.POST)
	   public String emailCheck(@RequestParam("email_first") String email_first,
			   					@RequestParam("email_end") String email_end
			   					) throws Exception{
	       //select * from member where userid = #{};
	       //이 member 객체에는 id만 값이 들어있고, 다른 것은 다 null 값이다.
		   
		   System.out.println("########1#####" + email_first);
		   System.out.println("########1#####" + email_end);
		   
		   String email = email_first + '@' + email_end;
		   
		   Map<String, Object> param= new HashMap<>();
		   
				param.put("email",email);
		
		   
		   CustomerVO emailChk = customerService.emailCheck(param);
	       String message=null;
	       if(emailChk==null) {//사용할 수 있다. db에서 찾았는데없으니까
	           message = "success";
	       }else {//사용할 수 없다.
	           message ="fail";
	       }	
	       return message;
	   }
	   
	 //휴대폰번호 중복체크
	   @ResponseBody
	   @RequestMapping(value="/mblCheck", method= RequestMethod.POST)
	   public String mblCheck(@RequestParam("mbl_no_first") String mbl_no_first
			   					,@RequestParam("mbl_no_middle") String mbl_no_middle
			   					,@RequestParam("mbl_no_end") String mbl_no_end
			   					) throws Exception{
	       //select * from member where userid = #{};
	       //이 member 객체에는 id만 값이 들어있고, 다른 것은 다 null 값이다.
		   
		   System.out.println("########1#####" + mbl_no_first);
		   System.out.println("########1#####" + mbl_no_middle);
		   System.out.println("########1#####" + mbl_no_end);
		   
		   String mbl_no = mbl_no_first + mbl_no_middle + mbl_no_end;
		   
		   Map<String, Object> param= new HashMap<>();
		   
				param.put("mbl_no",mbl_no);
		
		   
		   CustomerVO emailChk = customerService.mblCheck(param);
	      
		   String message=null;
	       if(emailChk==null) {//사용할 수 있다. db에서 찾았는데없으니까
	           message = "success";
	       }else {//사용할 수 없다.
	           message ="fail";
	       }	
	       return message;
	   }
	   
}
