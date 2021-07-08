package com.risata181.sizai.controllers;

import com.risata181.sizai.Util.MakeResponseHeader;
import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblOutgoing;
import com.risata181.sizai.exception.SizaiRuntimeException;
import com.risata181.sizai.services.StampOutgoingService;
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
 * .
 *
 * @brief 切手・印紙出庫修正画面コントローラークラス
 * @class StampOutgoingController
 * @author shuto.senda
 */

@Controller
@RequestMapping(value = "/stamp/outgoing")
public class StampOutgoingController {

  @Autowired
  StampOutgoingService stampOutgoingService;

  /**
   * .
   *
   * @brief 出庫修正画面の表示
   * @param model 画面の取得項目
   * @return 出庫修正画面のurl
   */

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String outgoing(Model model) {

    model.addAttribute("pageTitle", "切手・印紙出庫修正");

    return "/stamp/outgoing/list";
  }

  /**
   * .
   *
   * @brief 出庫登録情報のリストデータ取得
   * @param comBean 画面の取得項目
   * @throws Exception 例外
   * @return 処理結果
   */
  @RequestMapping(value = "/api/list", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> outgoingAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody Combean comBean) throws Exception {
    List<TblOutgoing> tblOutgoing = new ArrayList<TblOutgoing>();

    try {
      tblOutgoing = stampOutgoingService.getOutgoingList(comBean);
    } catch (Exception e) {
      e.printStackTrace();
    }

    return MakeResponseHeader.makeJsonResponseHeader(tblOutgoing);
  }

  /**
   * .
   *
   * @brief 出庫登録情報のリストデータ修正
   * @param tblOutgoingList 画面の取得項目
   * @throws Exception 例外
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/update", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> updateOutgoingAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblOutgoing[] tblOutgoingList) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String updater = session.getAttribute("Seq").toString();

    for (TblOutgoing outgoing : tblOutgoingList) {
      outgoing.setOutgoingUpdId(updater);
    }

    try {
      code = stampOutgoingService.updateOutgoing(tblOutgoingList);
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
   * @brief 出庫登録情報のリストデータ削除
   * @param tblOutgoingList 画面の取得項目
   * @throws Exception 例外
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/delete", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> deleteOutgoingAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblOutgoing[] tblOutgoingList) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String updater = session.getAttribute("Seq").toString();
    for (TblOutgoing outgoing : tblOutgoingList) {
      outgoing.setOutgoingUpdId(updater);
    }

    try {
      code = stampOutgoingService.deleteOutgoing(tblOutgoingList);
    } catch (Exception e) {
      e.printStackTrace();
      code = "failure";
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief 出庫登録画面の表示
   * @return 登録画面のurl
   */
  @RequestMapping(value = "/regist", method = RequestMethod.GET)
  public String stampoutgoing(Model model) {

    model.addAttribute("pageTitle", "切手・印紙出庫登録");
    return "/stamp/outgoing/regist";
  }

  /**
   * @brief 出庫管理画面データ登録
   * @param tblOutgoinglist 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/insert", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> outgoingInsertAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody List<TblOutgoing> tblOutgoinglist) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String register = session.getAttribute("Seq").toString();
    for (TblOutgoing outgoing : tblOutgoinglist) {
      outgoing.setOutgoingRegId(register);
      outgoing.setOutgoingUpdId(register);
    }

    try {
      code = stampOutgoingService.insertOutgoing(tblOutgoinglist);
    } catch (SizaiRuntimeException re) {
      re.printStackTrace();
      code = re.getCode();
    } catch (Exception e) {
      e.printStackTrace();
      code = "failure";
    }


    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

}
