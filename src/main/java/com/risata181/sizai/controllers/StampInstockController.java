package com.risata181.sizai.controllers;

import com.risata181.sizai.Util.MakeResponseHeader;
import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblInstock;
import com.risata181.sizai.services.StampInstockService;
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
 * @brief 切手・印紙入庫登録コントローラークラス
 * @class StampInstockController
 * @author sae.hayashi
 */

@Controller
@RequestMapping(value = "/stamp/instock")
public class StampInstockController {

  @Autowired
  StampInstockService stampInstockService;

  /**
   * .
   *
   * @brief 入庫修正画面の表示
   * @param model 画面の取得項目
   * @return 入庫修正画面のurl
   */

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String instock(Model model) {

    model.addAttribute("pageTitle", "切手・印紙入庫修正");

    return "/stamp/instock/list";
  }

  /**
   * .
   *
   * @brief 入庫登録情報のリストデータ取得
   * @param comBean 画面の取得項目
   * @throws Exception 例外
   * @return 処理結果
   */
  @RequestMapping(value = "/api/list", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> instockListAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody Combean comBean) throws Exception {
    List<TblInstock> tblInstockList = new ArrayList<TblInstock>();

    try {
      tblInstockList = stampInstockService.getInstockList(comBean);
    } catch (Exception e) {
      e.printStackTrace();
    }

    return MakeResponseHeader.makeJsonResponseHeader(tblInstockList);
  }


  /**
   * .
   * @brief 入庫登録画面の表示
   * @param model 画面の取得項目
   * @return 登録画面のurl
   */
  @RequestMapping(value = "/regist", method = RequestMethod.GET)
  public String stampinstock(Model model) {

    model.addAttribute("pageTitle", "切手・印紙入庫登録");
    return "/stamp/instock/regist";
  }

  /**
   * .
   * @brief 入庫登録情報のリストデータ取得
   * @param tblInstockList 画面の取得項目
   * @throws Exception 例外
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/insert", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> instockInsertAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody List<TblInstock> tblInstockList) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String register = session.getAttribute("Seq").toString();
    for (TblInstock instock : tblInstockList) {
      instock.setInstockRegId(register);
      instock.setInstockUpdId(register);
    }

    try {
      code = stampInstockService.insertInstock(tblInstockList);
    } catch (Exception e) {
      e.printStackTrace();
      code = "failure";
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * .
   *
   * @brief 出庫登録情報のリストデータ修正
   * @param tblInstockList 画面の取得項目
   * @throws Exception 例外
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/update", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> updateInstockAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblInstock[] tblInstockList) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String updater = session.getAttribute("Seq").toString();

    for (TblInstock instock : tblInstockList) {
      instock.setInstockUpdId(updater);
    }

    try {
      code = stampInstockService.updateInstock(tblInstockList);
    } catch (Exception e) {
      e.printStackTrace();
      code = "failure";
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * .
   *
   * @brief 入庫登録情報のリストデータ削除
   * @param tblInstockList 画面の取得項目
   * @throws Exception 例外
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/delete", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> deleteInstockAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblInstock[] tblInstockList) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String updater = session.getAttribute("Seq").toString();
    for (TblInstock instock : tblInstockList) {
      instock.setInstockUpdId(updater);
    }

    try {
      code = stampInstockService.deleteInstock(tblInstockList);
    } catch (Exception e) {
      e.printStackTrace();
      code = "failure";
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }
}
