package com.risata181.sizai.controllers;

import com.risata181.sizai.Util.MakeResponseHeader;
import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblManager;
import com.risata181.sizai.exception.SizaiRuntimeException;
import com.risata181.sizai.services.AdminManagerService;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @brief 担当者コントローラークラス
 * @class AdminManagerControler。
 * @author masashi.takada
 */

@Controller
@RequestMapping(value = "/admin/manager")
public class AdminManagerControler {

  @Autowired
  AdminManagerService adminManagerService;

  /**
   * @brief 担当者マスター画面表示
   * @return 担当者マスター画面のurl
   */
  @RequestMapping(value = "", method = RequestMethod.GET)
  public String manager(Model model) {

    model.addAttribute("pageTitle", "担当者管理画面");

    return "/admin/manager/list";

  }

  /**
   * @brief 担当者マスターのリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  @RequestMapping(value = "/api/list", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> managerListAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody Combean comBean) throws Exception {

    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    List<TblManager> tblManager = new ArrayList<TblManager>();

    try {
      tblManager = adminManagerService.getManagerList(comBean);
    } catch (Exception e) {
      e.printStackTrace();
    }

    resultMap.put("tblManager", tblManager);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);

  }

  /**
   * @brief 担当者新規登録
   * @param tblManager 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/regist", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> managerRegistAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblManager tblManager) throws Exception{

    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String register = session.getAttribute("Seq").toString();
    tblManager.setManagerRegId(register);
    tblManager.setManagerUpdId(register);

    try {
      code = adminManagerService.registManager(tblManager);
    } catch (SizaiRuntimeException e) {
      code = e.getCode();
      e.printStackTrace();
    } catch (Exception e) {
      code = "failure";
      e.printStackTrace();
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief 担当者情報更新
   * @param tblManager 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/update", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> managerUpdateAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblManager tblManager) throws Exception{

    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String register = session.getAttribute("Seq").toString();
    tblManager.setManagerUpdId(register);
    try {
      code = adminManagerService.updateManager(tblManager);
    } catch (SizaiRuntimeException e) {
      code = e.getCode();
      e.printStackTrace();
    } catch (Exception e) {
      code = "failure";
      e.printStackTrace();
    }
    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief 担当者情報削除
   * @param tblManager 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/delete", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> managerDeleteAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblManager tblManager) throws Exception{

    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String register = session.getAttribute("Seq").toString();
    tblManager.setManagerUpdId(register);
    try {
      code = adminManagerService.deleteManager(tblManager);
    } catch (SizaiRuntimeException e) {
      code = e.getCode();
      e.printStackTrace();
    } catch (Exception e) {
      code = "failure";
      e.printStackTrace();
    }
    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief 担当者情報1件取得
   * @param tblManager 画面の取得項目
   * @return tblData テーブルデータ
   */
  @RequestMapping(value = "/api/{seq}", method = RequestMethod.GET)
  @ResponseBody
  public ResponseEntity<Object> managerBySeqAjax(Model model,@PathVariable String seq) throws Exception{
    TblManager tblManagerSeq = new TblManager();
    try {
      tblManagerSeq = adminManagerService.getManagerBySeq(seq);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return MakeResponseHeader.makeJsonResponseHeader(tblManagerSeq);
  }
}
