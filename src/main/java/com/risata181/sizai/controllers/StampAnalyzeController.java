package com.risata181.sizai.controllers;

import com.risata181.sizai.Util.MakeResponseHeader;
import com.risata181.sizai.bean.TblOutgoing;
import com.risata181.sizai.services.StampAnalyzeService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @brief 切手・印紙集計コントローラークラス
 * @class StampAnalyzeController
 * @author kana.kinoshita
 */
@Controller
@RequestMapping(value = "/stamp")
public class StampAnalyzeController {

  @Autowired
  StampAnalyzeService stampAnalyzeService;

  /**
   * @brief 集計画面のリスト表示
   * @return リスト画面のurl
   */
  @RequestMapping(value = "/analyze", method = RequestMethod.GET)
  public String list(Model model) {

    model.addAttribute("pageTitle", "切手・印紙集計");
    return "/stamp/analyze";
  }

  /**
   * @brief 集計のリストデータ取得
   * @param tblOutgoing 画面の取得項目
   * @return resultMap 集計結果
   */
  @RequestMapping(value = "/analyze/api/list", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> stockAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblOutgoing tblOutgoing) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    List<TblOutgoing> tblOutgoingResult = new ArrayList<TblOutgoing>();

    try {
      tblOutgoingResult = stampAnalyzeService.getAnalyzeList(tblOutgoing);
    } catch (Exception e) {
      e.printStackTrace();
    }
    resultMap.put("tblOutgoing", tblOutgoingResult);
    
    int stampTotalCount = 0;
    int stampTotalPrice = 0;
    for (TblOutgoing cul:tblOutgoingResult) {
      stampTotalCount += Integer.parseInt(cul.getOutgoingCount());
      stampTotalPrice += Integer.parseInt(cul.getPriceTimesCount());
    }
    resultMap.put("stampTotalCount", stampTotalCount);
    resultMap.put("stampTotalPrice", stampTotalPrice);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }
}
