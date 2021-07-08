package com.risata181.sizai.controllers;

import com.risata181.sizai.Util.MakeResponseHeader;
import com.risata181.sizai.bean.TblUser;
import com.risata181.sizai.services.LoginService;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
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
 * @brief ログインコントローラクラス。
 * @class LoginController
 * @details "/login"のリクエストに対する処理を行う。
 * @author jeongsub.kim
 *
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {

  /** ログインサービス */
  @Autowired
  LoginService loginService;


  /**
   * @brief ログイン画面表示。
   * @details GET : "/login"のリクエストに対する処理を行う。
   * @param model モデル
   * @return ログイン画面パス
   * @throws NoSuchAlgorithmException アルゴリズムなし例外
   * @throws GeneralSecurityException セキュリティ例外
   */
  @RequestMapping(value = "", method = RequestMethod.GET)
  public String login(Model model) throws NoSuchAlgorithmException, GeneralSecurityException {

    return "/login";

  }

  /**
   * @brief ログインAPI。
   * @details POST : "/api/login"のリクエストに対する処理を行う。
   * @param req リクエスト
   * @param res レスポンス
   * @param tblUser ユーザー
   * @return Jsonデータ { "code": "success" }
   * @throws Exception 例外
   */
  @RequestMapping(value = "/api/login", method = RequestMethod.POST,
      consumes = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  public ResponseEntity<Object> loginAjax(HttpServletRequest req, HttpServletResponse res,
      @RequestBody TblUser tblUser) throws Exception {
    HashMap<String, Object> resultMap = new HashMap<String, Object>();
    String code = "";

    try {
      code = loginService.login(tblUser);
    } catch (Exception e) {
      code = "failure";
      e.printStackTrace();
    }

    if (code == "success") {
      HttpSession loginSession = req.getSession(true);
      loginSession.setAttribute("loginId", tblUser.getUserId());
    }

    resultMap.put("code", code);
    return MakeResponseHeader.makeJsonResponseHeader(resultMap);
  }

  /**
   * @brief ログアウトAPI。
   * @details GET : "/api/logout"のリクエストに対する処理を行う。
   * @param req リクエスト
   * @param res レスポンス
   * @param model モデル
   * @return ログイン画面パス
   */
  @RequestMapping(value = "/api/logout", method = RequestMethod.GET)
  public String logout(HttpServletRequest req, HttpServletResponse res, Model model) {

    HttpSession session = req.getSession(true);
    session.setAttribute("loginId", "");

    return "/login";
  }
}
