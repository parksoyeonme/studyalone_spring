package com.dowell.edu.controller.sales;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dowell.edu.service.sales.SalesService;

import lombok.extern.slf4j.Slf4j;

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
	public ModelAndView customerSalesRegister(ModelAndView mv) throws Exception{
		
		mv.setViewName("/sales/customerSalesRegister");
		return mv;
	}
	//매장재고조회 팝업 view
		@RequestMapping(value="/partnerInventoryInquiry")
		public ModelAndView partnerInventoryInquiry(ModelAndView mv) throws Exception{
			
			mv.setViewName("/sales/partnerInventoryInquiry");
			return mv;
		}
}
