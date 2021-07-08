package com.risata181.sizai.controllers;

import com.risata181.sizai.Util.MakeResponseHeader;
import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblStock;
import com.risata181.sizai.services.StampStockService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
 * @brief 切手・印紙在庫コントローラークラス
 * @class StampStockController
 * @author sae.hayashi
 */
@Controller
@RequestMapping(value = "/stamp")
public class StampStockController {

  @Autowired
  StampStockService stampStockService;

  /**
   * @brief 在庫画面のリスト表示
   * @return リスト画面のurl
   */
  @RequestMapping(value = "/stock", method = RequestMethod.GET)
  public String list(Model model) {

    model.addAttribute("pageTitle", "切手・印紙在庫");
    return "/stamp/stock";
  }

  /**
   * @brief 在庫のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  @RequestMapping(value = "/stock/api/list", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> stockAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody Combean comBean) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    List<TblStock> tblStock = new ArrayList<TblStock>();

    try {
      tblStock = stampStockService.getStockList(comBean);
    } catch (Exception e) {
      e.printStackTrace();
    }

    resultMap.put("tblStock", tblStock);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief 在庫(種別)の登録
   * @param tblStock 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/stock/api/insert", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> stockInsertAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblStock tblStock) throws Exception {
    String code = "";
    HttpSession session = req.getSession(true);
    String register = session.getAttribute("Seq").toString();
    tblStock.setStockUpdId(register);
    tblStock.setStockRegId(register);
    try {
      code = stampStockService.insertStock(tblStock);
    } catch (Exception e) {
      e.printStackTrace();
    }
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief 在庫(種別)の修正
   * @param tblStockList 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/stock/api/update", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> stockUpdateAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody List<TblStock> tblStockList) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String updater = session.getAttribute("Seq").toString();
    for (TblStock stock : tblStockList) {
      stock.setStockUpdId(updater);
    }

    try {
      code = stampStockService.updateStock(tblStockList);
    } catch (Exception e) {
      e.printStackTrace();
      code = "failure";
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief 在庫(種別)の削除
   * @param tblStockList 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/stock/api/delete", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> stockDeleteAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody List<TblStock> tblStockList) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String updater = session.getAttribute("Seq").toString();
    for (TblStock stock : tblStockList) {
      stock.setStockUpdId(updater);
    }

    try {
      code = stampStockService.deleteStock(tblStockList);
    } catch (Exception e) {
      e.printStackTrace();
      code = "failure";
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }
}
