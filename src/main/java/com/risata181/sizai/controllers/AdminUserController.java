package com.risata181.sizai.controllers;

import com.risata181.sizai.Util.MakeResponseHeader;
import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblUser;
import com.risata181.sizai.exception.SizaiRuntimeException;
import com.risata181.sizai.services.AdminUserService;
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
 * @brief 利用者コントローラークラス
 * @class AdminUserControler。
 * @author masashi.takada
 */

@Controller
@RequestMapping(value = "/admin/user")
public class AdminUserController {

  @Autowired
  AdminUserService adminUserService;

  /**
   * @brief 利用者マスター画面表示
   * @return 利用者マスター画面のurl
   */
  @RequestMapping(value = "", method = RequestMethod.GET)
  public String user(Model model) {

    model.addAttribute("pageTitle", "利用者管理画面");

    return "/admin/user/list";

  }

  /**
   * @brief 利用者マスターのリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  @RequestMapping(value = "/api/list", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> userListAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody Combean comBean) throws Exception {

    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    List<TblUser> tblUser = new ArrayList<TblUser>();

    try {
      tblUser = adminUserService.getUserList(comBean);
    } catch (Exception e) {
      e.printStackTrace();
    }

    resultMap.put("tblUser", tblUser);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);

  }

  /**
   * @brief 利用者新規登録
   * @param tblUser 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/regist", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> userRegistAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblUser tblUser) throws Exception {

    String code = "";
    HttpSession session = req.getSession(true);
    String register = session.getAttribute("Seq").toString();
    tblUser.setUserRegId(register);
    tblUser.setUserUpdId(register);

    try {
      code = adminUserService.registUser(tblUser);
    } catch (SizaiRuntimeException e) {
      code = e.getCode();
      e.printStackTrace();
    } catch (Exception e) {
      code = "failure";
      e.printStackTrace();
    }

    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief 利用者情報更新
   * @param tblUser 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/update", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> userUpdateAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblUser tblUser) throws Exception {

    String code = "";
    HttpSession session = req.getSession(true);
    String register = session.getAttribute("Seq").toString();
    tblUser.setUserUpdId(register);
    try {
      code = adminUserService.updateUser(tblUser);
    } catch (SizaiRuntimeException e) {
      code = e.getCode();
      e.printStackTrace();
    } catch (Exception e) {
      code = "failure";
      e.printStackTrace();
    }
    session.setAttribute("loginId", tblUser.getUserId());

    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief 利用者情報削除
   * @param tblUser 画面の取得項目
   * @return code 処理結果
   */
  @RequestMapping(value = "/api/delete", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> userDeleteAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblUser tblUser) throws Exception {

    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";
    HttpSession session = req.getSession(true);
    String register = session.getAttribute("Seq").toString();
    tblUser.setUserUpdId(register);
    try {
      code = adminUserService.deleteUser(tblUser);
    }  catch (SizaiRuntimeException e) {
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
   * @brief 利用者情報1件取得
   * @param seq 画面の取得項目
   * @return tblData テーブルデータ
   */
  @RequestMapping(value = "/api/{seq}", method = RequestMethod.GET)
  @ResponseBody
  public ResponseEntity<Object> userBySeqAjax(Model model, @PathVariable String seq)
      throws Exception {
    TblUser tblUserSeq = new TblUser();
    try {
      tblUserSeq = adminUserService.getUserBySeq(seq);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return MakeResponseHeader.makeJsonResponseHeader(tblUserSeq);
  }
}

