package com.risata181.sizai.controllers;

import com.risata181.sizai.Util.MakeResponseHeader;
import com.risata181.sizai.bean.EtcBean;
import com.risata181.sizai.services.EtcService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/etc")
public class EtcController {

  @Autowired
  EtcService etcService;

  /**
   * セレクトリストのオプション
   */
  @RequestMapping(value = "/api/select", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> selectListAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody EtcBean etcBean) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    List<EtcBean> selectList = new ArrayList<EtcBean>();

    try {
      selectList = etcService.getSelectList(etcBean);
    } catch (Exception e) {
      e.printStackTrace();
    }

    resultMap.put("selectList", selectList);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }
  
  /**
   * セレクトリストのオプション（条件を増やしたい場合用）
   */
  @RequestMapping(value = "/api/selectaddoption", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> selectListAddOptionAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody EtcBean etcBean) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    List<EtcBean> selectList = new ArrayList<EtcBean>();
    
    try {
      selectList = etcService.getSelectListAddOption(etcBean);
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    resultMap.put("selectList", selectList);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

}
