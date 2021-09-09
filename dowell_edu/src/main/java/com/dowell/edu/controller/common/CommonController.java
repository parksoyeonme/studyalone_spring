package com.dowell.edu.controller.common;

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

import com.dowell.edu.service.common.PartnerService;
import com.dowell.edu.vo.common.PartnerVO;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;


@Slf4j
@Controller
@RequestMapping("/common")
public class CommonController {

	@Autowired
	private  PartnerService partnerService;
	

	   
	 //매장조회 팝업 view
	@RequestMapping(value="/partnerInquiry")
	public ModelAndView storeSearch(ModelAndView mv) throws Exception{

	
		mv.setViewName("/common/partnerInquiry");
		
		return mv;
	}
	
	//매장팝업조회
	@ResponseBody
	@RequestMapping(value="/partnerInquiryList", method = { RequestMethod.POST, RequestMethod.GET },
			   produces ="application/text; charset=utf8")
	public String partnerInquiryList(@RequestParam(value="prt_nm",required=false) String prt_nm) throws Exception{
		
		 Map<String, Object> param= new HashMap<>();
		 param.put("prt_nm",prt_nm);
	
		List<PartnerVO> list = partnerService.selectPartnerSearchList(param);

		 JSONObject obj = new JSONObject();
	     obj.put("list", list);
	     
	     String resp = obj.toString();
		
		return resp;
		
	}
	
}
