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
	public ModelAndView customerList(CodeDetailVO codeDetailVo, ModelAndView mv) throws Exception{
		
		//고객상태조회(cust_ss_cd)
		List<CodeDetailVO> list = customerService.selectcustSsCd(codeDetailVo);
		
		mv.addObject("custSsCd", list);
		mv.setViewName("/customer/customerList");
		
		return mv;
	}
	@RequestMapping(value="/customerDetails")
	public ModelAndView CustomerDetailView(CodeDetailVO codeDetailVo,ModelAndView mv) throws Exception{
		List<CodeDetailVO> listcd = customerService.selectcommCd(codeDetailVo);
		
		mv.addObject("commCd", listcd);

		mv.setViewName("/customer/customerDetail");
		return mv;
	}
	
//	@RequestMapping(value={"/customerDetail","/customerDetailBtn"}, method = { RequestMethod.POST, RequestMethod.GET })
//	public ModelAndView CustomerDetailView(CodeDetailVO codeDetailVo,ModelAndView mv,
//			@RequestParam(value="cust_no", required=false) String cust_no) throws Exception{
//		List<CodeDetailVO> listcd = customerService.selectcommCd(codeDetailVo);
//		
//		Map<String, Object> param= new HashMap<>();
//		
//		param.put("cust_no",cust_no);
//		
//		List<CustomerVO> list = customerService.selectDetailOne(param);
//		
//		log.info("####나와줘뿅########" + list);
//		mv.addObject("commCd", listcd);
//
//		mv.addObject("listBtn", list);
//		mv.setViewName("/customer/customerDetail");
//		return mv;
//	}
	//고객정보조회 view
//		@RequestMapping(value="/CustomerDetail")
//		public ModelAndView CustomerDetailView(CodeDetailVO codeDetailVo,ModelAndView mv) throws Exception{
//			List<CodeDetailVO> listcd = customerService.selectcommCd(codeDetailVo);
//			
//			mv.addObject("commCd", listcd);
//
//			mv.setViewName("/customer/customerDetail");
//			return mv;
//		}
	//고객정보조회 
	@RequestMapping(value={"/customerDetail"},  method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView CustomerDetail(CodeDetailVO codeDetailVo,ModelAndView mv
			,@RequestParam(value="cust_no", required=false) String cust_no) throws Exception{
		
		List<CodeDetailVO> listcd = customerService.selectcommCd(codeDetailVo);
	

	  List<CustomerVO> list = customerService.selectDetailOne(cust_no);
	  log.info("####list출력하나요?########" + list);
	  
	  
	 mv.addObject("commCd", listcd);
		mv.addObject("listBtn", list);
		mv.setViewName("/customer/customerDetail");
		return mv;
	}
//	
//	  @RequestMapping(value="/customerDetail", method = { RequestMethod.POST, RequestMethod.GET },
//			   produces ="application/text; charset=utf8")
//		public ModelAndView customerDetail(@RequestParam(value="cust_no", required=false) String cust_no
//				,CodeDetailVO codeDetailVo, ModelAndView mv) throws Exception{
//			
//		   //고객히스토리리스트(팝업)
//			List<CodeDetailVO> listcd = customerService.custHistoryList(cust_no);
//		   log.info("#####상세버튼 클릭시#" + cust_no);
//			Map<String, Object> param= new HashMap<>();
//
//		      param.put("cust_no",cust_no);
//
//		  List<CustomerVO> list = customerService.selectDetailOne(param);
//		  log.info("####list출력하나요?########" + list);
//		  mv.addObject("commCd", listcd);
//			mv.addObject("listBtn", list);
//			mv.setViewName("/customer/customerDetail");
//			
//			return mv;
//		}
	  
	  
	
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
	   public String custAllSearchList(@RequestParam String jn_prt_cd
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
	      
		   
		
		   String mbl_no = mbl_no_first + mbl_no_middle + mbl_no_end;
		 
		   
		   String email ="";
		   
		   if(!email_first.equals("") && !email_end.equals("")) {
			   email = email_first + '@' + email_end;
		   }else {
			  email ="";
		   }
		   
		   System.out.println(brdy_dt);
		   System.out.println(sex_cd);
		   System.out.println(mrrg_dt);
		   
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
					//1.로깅작업
					log.error(e.getMessage(),e);
					//2.다시spring container에 던질것.
					throw e;
		    
		      }
	    
		      mv.setViewName("/customer/customerRegister");
				
			return mv;
	      
	   }

	   
	 //이메일보류
	   @ResponseBody
	   @RequestMapping(value="/emailCheck", method= RequestMethod.POST)
	   public String emailCheck(@RequestParam("email_first") String email_first
			   					,@RequestParam("email_end") String email_end
			   						) throws Exception{
	       //이 member 객체에는 id만 값이 들어있고, 다른 것은 다 null 값이다.

		   String email = email_first + '@' + email_end;
		   
		   Map<String, Object> param= new HashMap<>();
		   
				param.put("email",email);
		
		   
		   int emailChk = customerService.emailCheck(param);
	       String message="";
	       if(emailChk < 1) {//사용할 수 있다. db에서 찾았는데없으니까
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
	   
	  //고객정보조회 : 메인에서 들어갔을 때
//	   @ResponseBody
//	   @RequestMapping(value={"/customerDetailList"}, method = { RequestMethod.POST, RequestMethod.GET },
//			   produces ="application/text; charset=utf8")
//	   public String customerDetailList(@RequestParam String cust_no
//									   ,Model model	) throws Exception{
//	      
//		   log.info("###갑자기왜안나와####" + cust_no);
//		   Map<String, Object> param= new HashMap<>();
//
//		      param.put("cust_no",cust_no);
//
//		      
//		  List<CustomerVO> list = customerService.selectDetailOne(param);    
//	   
//		  model.addAttribute("listBtn", list);
//		  
//	      JSONObject obj = new JSONObject();
//	      obj.put("list", list);
//	      
//	      String resp = obj.toString();
//	      
//		      
//		     return resp;
//		
//	   }
	   
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
	       
		   //공통코드사용
		   List<CodeDetailVO> listcd = customerService.selectcommCd(codeDetailVo);
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
		   
		   
		   String pattern = "yyyyMMdd";
		   SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		   String date = simpleDateFormat.format(new Date());
		   System.out.println("워렐레레레레" + date);
		   
		   
		   System.out.println("park 원본@ " + CustomerList.get(0).getCust_ss_cd());
		   System.out.println("park 변경@ " + cust_ss_cd);
		   System.out.println(CustomerList.get(0).getCust_ss_cd().equals(cust_ss_cd));
		   System.out.println(CustomerList.get(0).getCust_ss_cd().equals("90"));
		   
		   // 정지 또는 해지에서 정상으로 가는 경우, 가입 날짜를 현재 날짜로 표시
		   if((CustomerList.get(0).getCust_ss_cd().equals("80") && cust_ss_cd.equals("10")) 
			||(CustomerList.get(0).getCust_ss_cd().equals("90") && cust_ss_cd.equals("10"))) {
			   //여기다가 현재 날짜 넣기
			   js_dt = date;
			   
		   // 정지에서 해지로 가는 경우, 핸드폰번호와 이메일 삭제
		   }else if(CustomerList.get(0).getCust_ss_cd().equals("80") && cust_ss_cd.equals("90")){
			   log.info("고객상태가 해지되었습니다. 핸드폰번호와 이메일 정보를 삭제합니다.");
			   
			   mbl_no = " ";
			   email = " ";
			   cncl_dt = date;
		   // 정상에서 정지로 가는 경우, 정지 일자 등록
		   }else if(CustomerList.get(0).getCust_ss_cd().equals("10") && cust_ss_cd.equals("80")) {
			   stp_dt = date;
			   js_dt = " ";
		   }
			   
		   int chg_seq = customerService.selectSeqCount(cust_no);
		   System.out.println("나와라사아아앙ㅇamx" + chg_seq);

		   CustomerHistoryVO copyHistoryVO = new CustomerHistoryVO();
		   copyHistoryVO.setCust_no(cust_no);
		   copyHistoryVO.setUser_id(user_id);
		   copyHistoryVO.setChg_seq(chg_seq);
		   
//		   if(cust_ss_cd)
		   //고객명, 생년월일, 휴대폰번호, 성별, 직업코드, 고객상태, 가입매장
		   if(!CustomerList.get(0).getCust_nm().equals(cust_nm)) {
			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getCust_nm());
			   customerHistoryVO.setChg_aft_cnt(cust_nm);
			   //변경항목 : 고객명
			   customerHistoryVO.setChg_cd("CUST_NM");
			   CustomerHistoryList.add(customerHistoryVO);
		   }
		   if(!CustomerList.get(0).getBrdy_dt().equals(brdy_dt)) {
			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getBrdy_dt());
			   customerHistoryVO.setChg_aft_cnt(brdy_dt);
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
		   
		   System.out.println("######까르르륽" + CustomerHistoryList);
		   
		 //고객정보조회 update Map
		   Map<String, Object> updateParam= new HashMap<>();
		      updateParam.put("cust_nm",cust_nm);
		      updateParam.put("cust_no",cust_no);
		      updateParam.put("brdy_dt",brdy_dt);
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
		    	  insertResult = customerService.insertCustHistory(insertParam);
		      }catch(Exception e) {
					//1.로깅작업
					log.error(e.getMessage(),e);
					//2.다시spring container에 던질것.
					throw e;
		      }

			      
	    
		      mv.setViewName("/customer/customerDetail");
				
			return mv;
	      
	   }
	   
	   
	 //고객정보수정
//	   @ResponseBody
//	   @RequestMapping(value="/updatecustomerDetail", method = { RequestMethod.POST, RequestMethod.GET },
//			   produces ="application/text; charset=utf8")
//	   public ModelAndView updatecustomerDetail(@RequestParam(value="cust_nm", required = false) String cust_nm
//			   								   ,@RequestParam(value="cust_no", required = false) String cust_no
//											   ,@RequestParam(value="brdy_dt", required = false) String brdy_dt
//											   ,@RequestParam(value="sex_cd", required = false) String sex_cd
//											   ,@RequestParam(value="scal_yn", required = false) String scal_yn
//											   ,@RequestParam(value="mrrg_dt", required = false) String mrrg_dt
//											   ,@RequestParam(value="poc_cd", required = false) String poc_cd
//											   ,@RequestParam(value="mbl_no_first", required = false) String mbl_no_first
//											   ,@RequestParam(value="mbl_no_middle", required = false) String mbl_no_middle
//											   ,@RequestParam(value="mbl_no_end", required = false) String mbl_no_end
//											   ,@RequestParam(value="psmt_grc_cd", required = false) String psmt_grc_cd
//											   ,@RequestParam(value="email_first", required = false) String email_first
//											   ,@RequestParam(value="email_end", required = false) String email_end
//											   ,@RequestParam(value="zip_cd", required = false) String zip_cd
//											   ,@RequestParam(value="addr", required = false) String addr
//											   ,@RequestParam(value="addr_dtl", required = false) String addr_dtl
//											   ,@RequestParam(value="cust_ss_cd", required = false) String cust_ss_cd
//											   ,@RequestParam(value="jn_prt_cd", required = false) String jn_prt_cd
//											   ,@RequestParam(value="email_rcv_yn", required = false) String email_rcv_yn
//											   ,@RequestParam(value="sms_rcv_yn", required = false) String sms_rcv_yn
//											   ,@RequestParam(value="dm_rcv_yn", required = false) String dm_rcv_yn
//											   ,@RequestParam(value="user_id", required = false) String user_id
//											   //origin
//											   ,@RequestParam(value="cust_nm_org", required = false) String cust_nm_org
//											   ,@RequestParam(value="brdy_dt_org", required = false) String brdy_dt_org
//											   ,@RequestParam(value="sex_cd_org", required = false) String sex_cd_org
//											   ,@RequestParam(value="scal_yn_org", required = false) String scal_yn_org
//											   ,@RequestParam(value="mrrg_dt_org", required = false) String mrrg_dt_org
//											   ,@RequestParam(value="poc_cd_org", required = false) String poc_cd_org
//											   ,@RequestParam(value="mbl_no_org", required = false) String mbl_no_org
//											   ,@RequestParam(value="psmt_grc_cd_org", required = false) String psmt_grc_cd_org
//											   ,@RequestParam(value="email_org", required = false) String email_org
//											   ,@RequestParam(value="zip_cd_org", required = false) String zip_cd_org
//											   ,@RequestParam(value="addr_org", required = false) String addr_org
//											   ,@RequestParam(value="addr_dtl_org", required = false) String addr_dtl_org
//											   ,@RequestParam(value="cust_ss_cd_org", required = false) String cust_ss_cd_org
//											   ,@RequestParam(value="jn_prt_cd_org", required = false) String jn_prt_cd_org
//
//											   ,ModelAndView mv
//											   ,HttpSession session
//											   ,HttpServletRequest request
//											   ,RedirectAttributes redirectAttr) throws Exception{
//	       
//		   
//		   List<CustomerVO> CustomerList = customerService.selectDetailOne(cust_no);
//		   List<CustomerHistoryVO> CustomerHistoryList = new ArrayList<CustomerHistoryVO>();
//		   CustomerHistoryVO customerHistoryVO = null;
//
//		   //다시 정상 상태로 돌아왔을 때 추가할 가입날짜
//		   String js_dt = CustomerList.get(0).getJs_dt();
//		   String mbl_no = mbl_no_first + mbl_no_middle + mbl_no_end;
//		   String email ="";
//		   String stp_dt = "";
//		   String cncl_dt = "";
//		   
//		   if(!email_first.equals("") && !email_end.equals("")) {
//			   email = email_first + '@' + email_end;
//		   }else {
//			  email ="";
//		   }
//		   
//		   
//		   String pattern = "yyyyMMdd";
//		   SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//
//		   String date = simpleDateFormat.format(new Date());
//		   System.out.println("워렐레레레레" + date);
//		   
//		   
//		   System.out.println("park 원본@ " + CustomerList.get(0).getCust_ss_cd());
//		   System.out.println("park 변경@ " + cust_ss_cd);
//		   System.out.println(CustomerList.get(0).getCust_ss_cd().equals(cust_ss_cd));
//		   System.out.println(CustomerList.get(0).getCust_ss_cd().equals("90"));
//		   
//		   // 정지 또는 해지에서 정상으로 가는 경우, 가입 날짜를 현재 날짜로 표시
//		   if((CustomerList.get(0).getCust_ss_cd().equals("80") && cust_ss_cd.equals("10")) 
//			||(CustomerList.get(0).getCust_ss_cd().equals("90") && cust_ss_cd.equals("10"))) {
//			   //여기다가 현재 날짜 넣기
//			   js_dt = date;
//			   
//		   // 정지에서 해지로 가는 경우, 핸드폰번호와 이메일 삭제
//		   }else if(CustomerList.get(0).getCust_ss_cd().equals("80") && cust_ss_cd.equals("90")){
//			   log.info("고객상태가 해지되었습니다. 핸드폰번호와 이메일 정보를 삭제합니다.");
//			   
//			   mbl_no = " ";
//			   email = " ";
//			   cncl_dt = date;
//		   // 정상에서 정지로 가는 경우, 정지 일자 등록
//		   }else if(CustomerList.get(0).getCust_ss_cd().equals("10") && cust_ss_cd.equals("80")) {
//			   stp_dt = date;
//			   js_dt = " ";
//		   }
//			   
//		   int chg_seq = customerService.selectSeqCount(cust_no);
//		   System.out.println("나와라사아아앙ㅇamx" + chg_seq);
//
//		   CustomerHistoryVO copyHistoryVO = new CustomerHistoryVO();
//		   copyHistoryVO.setCust_no(cust_no);
//		   copyHistoryVO.setUser_id(user_id);
//		   copyHistoryVO.setChg_seq(chg_seq);
//		   
////		   if(cust_ss_cd)
//		   //고객명, 생년월일, 휴대폰번호, 성별, 직업코드, 고객상태, 가입매장
//		   if(!CustomerList.get(0).getCust_nm().equals(cust_nm)) {
//			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
//			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getCust_nm());
//			   customerHistoryVO.setChg_aft_cnt(cust_nm);
//			   //변경항목 : 고객명
//			  // customerHistoryVO.setChg_cd('cust_nm');
//			   CustomerHistoryList.add(customerHistoryVO);
//		   }
//		   if(!CustomerList.get(0).getBrdy_dt().equals(brdy_dt)) {
//			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
//			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getBrdy_dt());
//			   customerHistoryVO.setChg_aft_cnt(brdy_dt);
//			   //변경항목 : 생년월일
//			   CustomerHistoryList.add(customerHistoryVO);
//		   }
//		   if(!CustomerList.get(0).getMbl_no().equals(mbl_no)) {
//			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
//			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getMbl_no());
//			   customerHistoryVO.setChg_aft_cnt(mbl_no);
//			   CustomerHistoryList.add(customerHistoryVO);
//		   }
//		   if(!CustomerList.get(0).getSex_cd().equals(sex_cd)) {
//			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
//			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getSex_cd());
//			   customerHistoryVO.setChg_aft_cnt(sex_cd);
//			   CustomerHistoryList.add(customerHistoryVO);
//		   }
//		   if(!CustomerList.get(0).getPoc_cd().equals(poc_cd)) {
//			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
//			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getPoc_cd());
//			   customerHistoryVO.setChg_aft_cnt(poc_cd);
//			   CustomerHistoryList.add(customerHistoryVO);
//		   }
//		   if(!CustomerList.get(0).getCust_ss_cd().equals(cust_ss_cd)) {
//			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
//			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getCust_ss_cd());
//			   customerHistoryVO.setChg_aft_cnt(cust_ss_cd);
//			   CustomerHistoryList.add(customerHistoryVO);
//		   }
//		   if(!CustomerList.get(0).getJn_prt_cd().equals(jn_prt_cd)) {
//			   customerHistoryVO = (CustomerHistoryVO) copyHistoryVO.clone();
//			   customerHistoryVO.setChg_bf_cnt(CustomerList.get(0).getJn_prt_cd());
//			   customerHistoryVO.setChg_aft_cnt(jn_prt_cd);
//			   CustomerHistoryList.add(customerHistoryVO);
//		   }
//		   
//		   System.out.println("######까르르륽" + CustomerHistoryList);
//		   
//			   /*
//		   
//		   System.out.println(cust_nm);
//		   System.out.println(cust_no);
//		   System.out.println(brdy_dt);
//		   System.out.println(sex_cd);
//		   System.out.println(mrrg_dt);
//		   System.out.println(poc_cd);
//		   System.out.println(mbl_no);
//		   System.out.println(psmt_grc_cd);
//		   System.out.println(email);
//		   System.out.println(zip_cd);
//		   System.out.println(addr);
//		   System.out.println(addr_dtl);
//		   System.out.println(cust_ss_cd);
//		   System.out.println(jn_prt_cd);
//		   System.out.println(email_rcv_yn);
//		   System.out.println(sms_rcv_yn);
//		   System.out.println(dm_rcv_yn);
//		   System.out.println(user_id);
//		   System.out.println("----original data-----");
//		   System.out.println(cust_nm_org);
//		   System.out.println(brdy_dt_org);
//		   System.out.println(sex_cd_org);
//		   System.out.println(scal_yn_org);
//		   System.out.println(mrrg_dt_org);
//		   System.out.println(poc_cd_org);
//		   System.out.println(mbl_no_org);
//		   System.out.println(psmt_grc_cd_org);
//		   System.out.println(email_org);
//		   System.out.println(zip_cd_org);
//		   System.out.println(addr_org);
//		   
//		   System.out.println(addr_dtl_org);
//		   System.out.println(cust_ss_cd_org);
//		   System.out.println(jn_prt_cd_org);
//			*/
//		   
//		   Map<String, Object> updateParam= new HashMap<>();
//		      updateParam.put("cust_nm",cust_nm);
//		      updateParam.put("cust_no",cust_no);
//		      updateParam.put("brdy_dt",brdy_dt);
//		      updateParam.put("sex_cd",sex_cd);
//		      updateParam.put("scal_yn",scal_yn);
//		      updateParam.put("mrrg_dt",mrrg_dt);
//		      updateParam.put("poc_cd",poc_cd);
//		      updateParam.put("mbl_no",mbl_no);
//		      updateParam.put("psmt_grc_cd",psmt_grc_cd);
//		      updateParam.put("email",email);
//		      updateParam.put("zip_cd",zip_cd);
//		      updateParam.put("addr",addr);
//		      updateParam.put("addr_dtl",addr_dtl);
//		      updateParam.put("cust_ss_cd",cust_ss_cd);
//		      updateParam.put("jn_prt_cd",jn_prt_cd);
//		      updateParam.put("email_rcv_yn",email_rcv_yn);
//		      updateParam.put("sms_rcv_yn",sms_rcv_yn);
//		      updateParam.put("dm_rcv_yn",dm_rcv_yn);
//		      updateParam.put("user_id",user_id);
//		      updateParam.put("js_dt", js_dt);
//		      updateParam.put("stp_dt", stp_dt);
//		      updateParam.put("cncl_dt", cncl_dt);
//		      
//		      
//				/*
//				 * Map<String, Object> insertParam= new HashMap<>(); 
//				 * insertParam.put("cust_no",cust_no);
//				 * insertParam.put("insertList", CustomerHistoryList);
//				 * insertParam.put("user_id", user_id);
//				 */
//		      
//		      Map<String, Object> insertParam= new HashMap<>();
//		      insertParam.put("insertList", CustomerHistoryList);
//  		      //정보불러오는 거
//		      //List<CustomerVO> list = customerService.selectDetailOne(param);
//		      int updateResult;
//		      int insertResult;
//		      try {
//		    	  //업데이트정보넘기는거
//		    	  updateResult = customerService.updatecustDetail(updateParam);
////		    	  if(updateResult != 0) {
//		    	  	  System.out.println("이 부분 찍히나여?");
//		    	  //	  countResult = customerService.updatecustDetail(updateParam);
//		    		  insertResult = customerService.insertCustHistory(insertParam);
////		    	  }
//		      }catch(Exception e) {
//					//1.로깅작업
//					log.error(e.getMessage(),e);
//					//2.다시spring container에 던질것.
//					throw e;
//		      }
//		      
//		      
////		      String cust_nm_chg;
//		      //변경
//			  /* if(cust_nm != cust_nm_org) {
//				   
//				   cust_nm_chg = cust_nm_org;
//			   }else {
//				   cust_nm = cust_nm;
//			   }
//			   
//			   if(brdy_dt != brdy_dt_org) {
//				   String brdy_dt_chg = brdy_dt_org;
//			   }
//			   if(sex_cd != sex_cd_org) {
//				   String sex_cd_chg = sex_cd_org;
//			   }
//			   if(poc_cd != poc_cd_org) {
//				   String poc_cd_chg = poc_cd_org;
//			   }
//			   if(mbl_no!= mbl_no_org) {
//				   String mbl_no_chg = mbl_no_org;
//			   }
//			   if(cust_ss_cd != cust_ss_cd_org) {
//				   String cust_ss_cd_chg = cust_ss_cd_org;
//			   }
//			   if(jn_prt_cd != jn_prt_cd_org) {
//				   String jn_prt_cd_chg = jn_prt_cd_org;
//			   }*/
//			   
//			   
////			   Map<String, Object> param2= new HashMap<>();
////				
////			   	  param2.put("cust_nm",cust_nm);
////			      param2.put("brdy_dt",brdy_dt);
////			      param2.put("sex_cd",poc_cd);
////			      param2.put("poc_cd",poc_cd);
////			      param2.put("mbl_no",mbl_no);
////			      param2.put("cust_ss_cd",cust_ss_cd);
////			      param2.put("jn_prt_cd",jn_prt_cd);
////			      
////			      param2.put("cust_nm_chg",cust_nm_org);
////			      param2.put("brdy_dt_chg",brdy_dt_org);
////			      param2.put("sex_cd_chg",poc_cd_org);
////			      param2.put("poc_cd_chg",poc_cd_org);
////			      param2.put("mbl_no_chg",mbl_no_org);
////			      param2.put("cust_ss_cd_chg",cust_ss_cd_org);
////			      param2.put("jn_prt_cd_chg",jn_prt_cd_org);
//////			   
//			      //int result = customerService.insertCustHistory(param2);
//			      
//	    
//		      mv.setViewName("/customer/customerDetail");
//				
//			return mv;
//	      
//	   }
	   
}
