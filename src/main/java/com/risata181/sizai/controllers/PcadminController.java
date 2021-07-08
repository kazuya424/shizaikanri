package com.risata181.sizai.controllers;

import com.risata181.sizai.Util.MakeResponseHeader;
import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblPcadmin;
import com.risata181.sizai.exception.SizaiRuntimeException;
import com.risata181.sizai.services.PcadminService;
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
 * @brief PC管理コントローラークラス
 * @class PcadminController
 * @author shuto.senda
 */
@Controller
@RequestMapping(value = "/pcadmin")
public class PcadminController {

  @Autowired
  PcadminService pcadminService;

  /**
   * @brief PC管理のリスト表示
   * @return リストのurl
   */

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String list(Model model) {

    model.addAttribute("pageTitle", "PC管理");

    return "/pcadmin/list";
  }

  /**
   * @brief PC管理のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  @RequestMapping(value = "/api/list", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> pcadminListAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody Combean comBean) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    List<TblPcadmin> tblPcadmin = new ArrayList<TblPcadmin>();

    try {
      tblPcadmin = pcadminService.getPcadminList(comBean);
    } catch (Exception e) {
      e.printStackTrace();
    }

    resultMap.put("tblPcadmin", tblPcadmin);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief PC管理更新
   * @param tblPcadminList 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/list/update", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> pcadminUpdateAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblPcadmin[] tblPcadminList) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String updater = session.getAttribute("Seq").toString();
    for (TblPcadmin pcadmin : tblPcadminList) {
      pcadmin.setPcadminUpdId(updater);
    }

    try {
      code = pcadminService.updatePcadmin(tblPcadminList);
    } catch (SizaiRuntimeException e) {
      code = e.getCode();
      e.printStackTrace();
    } catch (Exception e) {
      e.printStackTrace();
      code = "failure";
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }


  /**
   * @brief PC管理一覧削除
   * @param tblPcadminList 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/list/delete", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> postDeleteAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblPcadmin[] tblPcadminList) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String updater = session.getAttribute("Seq").toString();
    for (TblPcadmin pcadmin : tblPcadminList) {
      pcadmin.setPcadminUpdId(updater);
    }

    try {
      code = pcadminService.deletePcadmin(tblPcadminList);
    } catch (SizaiRuntimeException e) {
      code = e.getCode();
      e.printStackTrace();
    } catch (Exception e) {
      e.printStackTrace();
      code = "failure";
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief PC登録画面表示
   * @return PC登録画面のurl
   */

  @RequestMapping(value = "/regist", method = RequestMethod.GET)
  public String regist(Model model) {

    model.addAttribute("pageTitle", "PC登録画面");

    return "/pcadmin/regist";
  }

  /**
   * @brief PC登録
   * @param tblPcadminList 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/insert", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> InsertPcadminAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblPcadmin[] tblPcadminList) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String register = session.getAttribute("Seq").toString();
    for (TblPcadmin pcadmin : tblPcadminList) {
      pcadmin.setPcadminRegId(register);
    }

    try {
      code = pcadminService.insertPcadmin(tblPcadminList);
    } catch (SizaiRuntimeException e) {
      code = e.getCode();
      e.printStackTrace();
    } catch (Exception e) {
      e.printStackTrace();
      code = "failure";
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }
}
