package com.dowell.edu.controller.customer;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	public ModelAndView customerListView(CodeDetailVO codeDetailVo, ModelAndView mv) throws Exception{
		
		//고객상태조회(cust_ss_cd)
		List<CodeDetailVO> list = customerService.selectcustSsCd(codeDetailVo);
		
		mv.addObject("custSsCd", list);
		mv.setViewName("/customer/customerList");
		
		return mv;
	}
	
	//고객정보조회 -nav바
	@RequestMapping(value="/CustomerDetail")
	public ModelAndView CustomerDetailView(CodeDetailVO codeDetailVo,ModelAndView mv) throws Exception{
		List<CodeDetailVO> listcd = customerService.selectcommCd(codeDetailVo);
		
		mv.addObject("commCd", listcd);

		mv.setViewName("/customer/customerDetail");
		return mv;
	}

	//고객정보조회-상세버튼
	@RequestMapping(value={"/customerDetail"},  method = { RequestMethod.POST, RequestMethod.GET },
					produces ="application/text; charset=utf8")
	public ModelAndView CustomerDetail( CodeDetailVO codeDetailVo
										,ModelAndView mv
										,@RequestParam(value="cust_no", required=false) String cust_no) throws Exception{
		
		//공통코드
		List<CodeDetailVO> listcd = customerService.selectcommCd(codeDetailVo);
	
		
		List<CustomerVO> list = customerService.selectDetailOne(cust_no);
		
		mv.addObject("commCd", listcd);
		mv.addObject("list", list);
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
	public String customerInquiryList(Model model
									 ,@RequestParam(value="cust_nm", required=false) String cust_nm
									 ,@RequestParam(value="mbl_no", required=false) String mbl_no) throws Exception{
 
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
	public String custAllSearchList( @RequestParam String jn_prt_cd
								   ,@RequestParam String cust_ss_cd
								   ,@RequestParam String cust_no
								   ,@RequestParam String fromDate
								   ,@RequestParam String toDate
								   ,Model model			) throws Exception{
      
	   
	   
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
									,ModelAndView mv) throws Exception{
			
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
	@RequestMapping(value="/customerRegister", method = { RequestMethod.POST, RequestMethod.GET },
					produces ="application/text; charset=utf8")
	public ModelAndView customerRegister(ModelAndView mv,CodeDetailVO codeDetailVo) throws Exception{
		
	   //공통코드sec_cd,poc_cd
	   List<CodeDetailVO> codeCd = customerService.selectcodeCd(codeDetailVo);
	   
	  
	   	mv.addObject("codeCd", codeCd);
		mv.setViewName("/customer/customerRegister");
		
		return mv;
	}
	   
	//신규등록 custRegister
	@ResponseBody
	@RequestMapping(value="/custRegister", method = { RequestMethod.POST, RequestMethod.GET },
					produces ="application/text; charset=utf8")
	public ModelAndView custRegister( @RequestParam("cust_nm") String cust_nm
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
									 ,@RequestParam(value="mrrg_dt", required = false) String mrrg_dt
									 ,@RequestParam("jn_prt_cd") String jn_prt_cd
									 ,@RequestParam("email_rcv_yn") String email_rcv_yn
									 ,@RequestParam("sms_rcv_yn") String sms_rcv_yn
									 ,@RequestParam("dm_rcv_yn") String dm_rcv_yn
									 ,@RequestParam("user_id") String user_id
									 ,ModelAndView mv
									 ,HttpSession session
									 ,HttpServletRequest request
									 ,RedirectAttributes redirectAttr) throws Exception{
		      
		   
			//핸드폰번호 합치기
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
			      param.put("user_id",user_id);
			      param.put("zip_cd",zip_cd);
			      param.put("jn_prt_cd",jn_prt_cd);
			      
		      
		      try {
		    	  int result = customerService.insertcust(param);
		    	
		      }catch(Exception e) {
					log.error(e.getMessage(),e);
					throw e;
		    
		      }
	    
		      mv.setViewName("/customer/customerRegister");
				
			return mv;
	      
	   }

	   
	//이메일 중복체크 -신규고객등록
	@ResponseBody
	@RequestMapping(value="/emailCheck", method= RequestMethod.POST)
	public String emailCheck(@RequestParam("email_first") String email_first
		   					,@RequestParam("email_end") String email_end ) throws Exception{

		String email = email_first + '@' + email_end;
	   
		Map<String, Object> param= new HashMap<>();
	   
			param.put("email",email);
	
	   
			int emailChk = customerService.emailCheck(param);
			
			String message="";
			
			if(emailChk < 1) {
				message = "success";
				
			}else {
				message ="fail";
			}	
			
       return message;
	}
	   
	 //휴대폰번호 중복체크
	 @ResponseBody
	 @RequestMapping(value="/mblCheck", method= RequestMethod.POST)
	 public String mblCheck( @RequestParam("mbl_no_first") String mbl_no_first
		   					,@RequestParam("mbl_no_middle") String mbl_no_middle
		   					,@RequestParam("mbl_no_end") String mbl_no_end ) throws Exception{

	
		String mbl_no = mbl_no_first + mbl_no_middle + mbl_no_end;
		   
		Map<String, Object> param= new HashMap<>();
		   
			param.put("mbl_no",mbl_no);
		
		   
			int emailChk = customerService.mblCheck(param);
	      
			String message="";
				if(emailChk < 1) {
					message = "success";
		           
				}else {
					message ="fail";
				}	
	   return message;
	 }
	   
	   //휴대폰번호 중복체크디테일
	   @ResponseBody
	   @RequestMapping(value="/mblCheckDetail", method= RequestMethod.POST)
	   public String mblCheckDetail(@RequestParam("mbl_no_first") String mbl_no_first
			   					,@RequestParam("mbl_no_middle") String mbl_no_middle
			   					,@RequestParam("mbl_no_end") String mbl_no_end
			   					,@RequestParam("cust_no") String cust_no
			   					) throws Exception{

	
		   String mbl_no = mbl_no_first + mbl_no_middle + mbl_no_end;
		   
		   Map<String, Object> param= new HashMap<>();
		   
				param.put("mbl_no",mbl_no);
				param.put("cust_no",cust_no);
		   
		   int emailChk = customerService.mblCheckDetail(param);
	      
		   String message="";
		       if(emailChk < 1) {
		           message = "success";
		       }else {
		           message ="fail";
		       }	
	       return message;
	   }
	   
	   
	 //이메일보류
	 @ResponseBody
	 @RequestMapping(value="/emailCheckDetail", method= RequestMethod.POST)
	 public String emailCheckDetail( @RequestParam("email_first") String email_first
			   						,@RequestParam("email_end") String email_end
			   						,@RequestParam("cust_no") String cust_no ) throws Exception{
	      

		   String email = email_first + '@' + email_end;
		   
		   Map<String, Object> param= new HashMap<>();
		   
				param.put("email",email);
				param.put("cust_no",cust_no);
		   
		   int emailChk = customerService.emailCheckDetail(param);
	       
		   String message="";
	       
			   if(emailChk < 1) {
		           message = "success";
		       }else {
		           message ="fail";
		       }	
	       return message;
	  }
	 
	   //고객정보수정
	   @ResponseBody
	   @RequestMapping(value="/updatecustomerDetail", method = { RequestMethod.POST, RequestMethod.GET },
			   produces ="application/text; charset=utf8")
	   public ModelAndView updatecustomerDetail(@RequestParam(value="cust_nm", required = false) String cust_nm
			   								   ,@RequestParam(value="cust_no", required = false) String cust_no
											   ,@RequestParam(value="brdy_dt", required = false) String brdy_dt
											   ,@RequestParam(value="sex_cd", required = false) String sex_cd
											   ,@RequestParam(value="scal_yn", required = false) String scal_yn
											   ,@RequestParam(value="mrrg_dt", required = false) String mrrg_dt
											   ,@RequestParam(value="poc_cd", required = false) String poc_cd
											   ,@RequestParam(value="mbl_no_first", required = false) String mbl_no_first
											   ,@RequestParam(value="mbl_no_middle", required = false) String mbl_no_middle
											   ,@RequestParam(value="mbl_no_end", required = false) String mbl_no_end
											   ,@RequestParam(value="psmt_grc_cd", required = false) String psmt_grc_cd
											   ,@RequestParam(value="email_first", required = false) String email_first
											   ,@RequestParam(value="email_end", required = false) String email_end
											   ,@RequestParam(value="zip_cd", required = false) String zip_cd
											   ,@RequestParam(value="addr", required = false) String addr
											   ,@RequestParam(value="addr_dtl", required = false) String addr_dtl
											   ,@RequestParam(value="cust_ss_cd", required = false) String cust_ss_cd
											   ,@RequestParam(value="jn_prt_cd", required = false) String jn_prt_cd
											   ,@RequestParam(value="email_rcv_yn", required = false) String email_rcv_yn
											   ,@RequestParam(value="sms_rcv_yn", required = false) String sms_rcv_yn
											   ,@RequestParam(value="dm_rcv_yn", required = false) String dm_rcv_yn
											   ,@RequestParam(value="user_id", required = false) String user_id
											   ,CodeDetailVO codeDetailVo
											   ,ModelAndView mv
											   ,HttpSession session
											   ,HttpServletRequest request
											   ,RedirectAttributes redirectAttr) throws Exception{
	       
		 
		   System.out.println(brdy_dt);
		   //고객정보 update 전 원본데이터
		   List<CustomerVO> CustomerList = customerService.selectDetailOne(cust_no);
		   
		   List<CustomerHistoryVO> CustomerHistoryList = new ArrayList<CustomerHistoryVO>();
		   CustomerHistoryVO customerHistoryVO = null;
		   
		   
		   		   
		   String js_dt = CustomerList.get(0).getJs_dt();
		   
		   String stp_dt = "";
		   String cncl_dt = "";
		   
		   String mbl_no = mbl_no_first + mbl_no_middle + mbl_no_end;
		   String email ="";
		  
		   
		   if(!email_first.equals("") && !email_end.equals("")) {
			   email = email_first + '@' + email_end;
		   }else {
			  email ="";
		   }
		   
		   String brdy_dt2 = brdy_dt.replaceAll("-", "");
		
		   //brdy_dt.replaceAll("-", ""); 
		   System.out.println("dddddddddddddddddddddd" + brdy_dt2);
		   
		   String pattern = "yyyyMMdd";
		   SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		   String date = simpleDateFormat.format(new Date());
		   
		   // 중지 또는 해지에서 정상으로 가는 경우, 가입 날짜를 현재 날짜로 표시
		   if((CustomerList.get(0).getCust_ss_cd().equals("80") && cust_ss_cd.equals("10")) 
			||(CustomerList.get(0).getCust_ss_cd().equals("90") && cust_ss_cd.equals("10"))) {
			   
			   js_dt = date;
			 
		   // 정상에서 중지로 가는 경우, 중지일자 등록
		   }else if(CustomerList.get(0).getCust_ss_cd().equals("10") && cust_ss_cd.equals("80")) {
			   stp_dt = date;
			  // js_dt = " ";
			   
			// 중지에서 중지
		   }else if(CustomerList.get(0).getCust_ss_cd().equals("80") && cust_ss_cd.equals("80")) {
			   stp_dt = CustomerList.get(0).getStp_dt();
			  
			   
			// 중지에서 해지로 가는 경우, 핸드폰번호와 이메일 삭제
		   }else if(CustomerList.get(0).getCust_ss_cd().equals("80") && cust_ss_cd.equals("90")){
			   log.info("고객상태가 해지되었습니다. 핸드폰번호와 이메일 정보를 삭제합니다.");
			   
			   mbl_no = "00000000000";
			   email = "";
			   cncl_dt = date;
			   stp_dt = CustomerList.get(0).getStp_dt();
			// 해지->해지
		   }else if(CustomerList.get(0).getCust_ss_cd().equals("80") && cust_ss_cd.equals("80")) {
			   cncl_dt = CustomerList.get(0).getCncl_dt();
			   stp_dt = CustomerList.get(0).getStp_dt();
			   
			   
			
		   }

		   CustomerHistoryVO copyHistoryVO = new CustomerHistoryVO();
		   copyHistoryVO.setCust_no(cust_no);
		   copyHistoryVO.setUser_id(user_id);
		   
		   //고객명, 생년월일, 휴대폰번호, 성별, 직업코드, 고객상태, 가입매장
		   if(!CustomerList.get(0).getCust_nm().equals(cust_nm)) {
			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getCust_nm());
			   customerHistoryVO.setChg_aft_cnt(cust_nm);
			   //변경항목 : 고객명
			   customerHistoryVO.setChg_cd("CUST_NM");
			   CustomerHistoryList.add(customerHistoryVO);
		   }
		   if(!CustomerList.get(0).getBrdy_dt().equals(brdy_dt2)) {
			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getBrdy_dt().replaceAll("-", ""));
			   customerHistoryVO.setChg_aft_cnt(brdy_dt2);
			   //변경항목 : 생년월일
			   customerHistoryVO.setChg_cd("BRDY_DT");
			   CustomerHistoryList.add(customerHistoryVO);
		   }
		   if(!CustomerList.get(0).getMbl_no().equals(mbl_no)) {
			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getMbl_no());
			   customerHistoryVO.setChg_aft_cnt(mbl_no);
			   //변경항목 : 휴대폰번호
			   customerHistoryVO.setChg_cd("MBL_NO");
			   CustomerHistoryList.add(customerHistoryVO);
		   }
		   if(!CustomerList.get(0).getSex_cd().equals(sex_cd)) {
			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getSex_cd());
			   customerHistoryVO.setChg_aft_cnt(sex_cd);
			   //변경항목 : 성별
			   customerHistoryVO.setChg_cd("SEX_CD");
			   CustomerHistoryList.add(customerHistoryVO);
		   }
		   if(!CustomerList.get(0).getPoc_cd().equals(poc_cd)) {
			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getPoc_cd());
			   customerHistoryVO.setChg_aft_cnt(poc_cd);
			   //변경항목 : 직업코드
			   customerHistoryVO.setChg_cd("POC_CD");
			   CustomerHistoryList.add(customerHistoryVO);
		   }
		   if(!CustomerList.get(0).getCust_ss_cd().equals(cust_ss_cd)) {
			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getCust_ss_cd());
			   customerHistoryVO.setChg_aft_cnt(cust_ss_cd);
			   //변경항목 : 고객상태
			   customerHistoryVO.setChg_cd("CUST_SS_CD");
			   CustomerHistoryList.add(customerHistoryVO);
		   }
		   if(!CustomerList.get(0).getJn_prt_cd().equals(jn_prt_cd)) {
			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getJn_prt_cd());
			   customerHistoryVO.setChg_aft_cnt(jn_prt_cd);
			   //변경항목 : 매장
			   customerHistoryVO.setChg_cd("JN_PRT_CD");
			   CustomerHistoryList.add(customerHistoryVO);
		   }
		   
		   
		 //고객정보조회 update Map
		   Map<String, Object> updateParam= new HashMap<>();
		      updateParam.put("cust_nm",cust_nm);
		      updateParam.put("cust_no",cust_no);
		      updateParam.put("brdy_dt",brdy_dt2);
		      updateParam.put("sex_cd",sex_cd);
		      updateParam.put("scal_yn",scal_yn);
		      updateParam.put("mrrg_dt",mrrg_dt);
		      updateParam.put("poc_cd",poc_cd);
		      updateParam.put("mbl_no",mbl_no);
		      updateParam.put("psmt_grc_cd",psmt_grc_cd);
		      updateParam.put("email",email);
		      updateParam.put("zip_cd",zip_cd);
		      updateParam.put("addr",addr);
		      updateParam.put("addr_dtl",addr_dtl);
		      updateParam.put("cust_ss_cd",cust_ss_cd);
		      updateParam.put("jn_prt_cd",jn_prt_cd);
		      updateParam.put("email_rcv_yn",email_rcv_yn);
		      updateParam.put("sms_rcv_yn",sms_rcv_yn);
		      updateParam.put("dm_rcv_yn",dm_rcv_yn);
		      updateParam.put("user_id",user_id);
		      updateParam.put("js_dt", js_dt);
		      updateParam.put("stp_dt", stp_dt);
		      updateParam.put("cncl_dt", cncl_dt);
		      
		    //고객정보조회 insert -> 고객이력테이블 Map
		      Map<String, Object> insertParam= new HashMap<>();
		      insertParam.put("insertList", CustomerHistoryList);

		      
		      int updateResult;
		      int insertResult;
		      try {
		    	  //고객정보조회 update
		    	  updateResult = customerService.updatecustDetail(updateParam);
		    	  
		    	  //고객정보조회 insert -> 고객이력테이블
		    	  if((CustomerHistoryList != null) && (!CustomerHistoryList.isEmpty())) {
		    		  insertResult = customerService.insertCustHistory(insertParam);
		    	  }
		      }catch(Exception e) {
					
					log.error(e.getMessage(),e);
					throw e;
		      }


		      mv.setViewName("/customer/customerDetail");
				
			return mv;
	      
	   }

}
