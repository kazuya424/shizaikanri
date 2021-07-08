package com.risata181.sizai.services.impl;

import com.risata181.sizai.Util.AES256Util;
import com.risata181.sizai.bean.TblUser;
import com.risata181.sizai.entity.LoginMapper;
import com.risata181.sizai.services.LoginService;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @brief ログインサービスクラス。
 * @class LoginServiceImpl
 * @author jeongsub.kim
 *
 */
@Service("LoginService")
public class LoginServiceImpl implements LoginService {

  /**
   * ログインマッパー
   */
  @Autowired
  LoginMapper loginMapper;

  /**
   * @brief ログイン処理。
   * @param tblUser ユーザ
   * @return リターンコード
   *         <ul>
   *         <li>noUser 該当ユーザー無し
   *         <li>success 成功
   *         <li>noPassword パスワード不一致
   *         </ul>
   * @throws NoSuchAlgorithmException アルゴリズム無し例外
   * @throws GeneralSecurityException セキュリティ例外
   */
  @Override
  public String login(TblUser tblUser) throws NoSuchAlgorithmException, GeneralSecurityException {
    String code = "";
    TblUser result = loginMapper.login(tblUser);
    if (result == null) {
      code = "noUser";
    } else {
      AES256Util dec;
      try {
        dec = new AES256Util();
        if (dec.decrypt(result.getUserPw()).equals(tblUser.getUserPw())) {
          code = "success";
        } else {
          code = "noPassword";
        }
      } catch (UnsupportedEncodingException e) {
        e.printStackTrace();
      }
    }

    return code;
  }

  /**
   * @brief 利用者権限取得。
   * @param string ユーザーID
   * @return 利用者権限
   *         <ul>
   *         <li>ADMIN 管理者
   *         <li>USER 一般
   *         </ul>
   */
  @Override
  public String getAuth(String string) {
    String auth = "";
    auth = loginMapper.getAuth(string);

    return auth;
  }

  /**
   * @brief 管理番号取得。
   * @param string ユーザーID
   * @return 管理番号
   */
  @Override
  public String getSeq(String string) {
    String seq = "";
    seq = loginMapper.getSeq(string);

    return seq;
  }

  /**
   * @brief 利用者名取得。
   * @param string ユーザーID
   * @return 利用者名
   */
  @Override
  public String getName(String string) {
    String name = "";
    name = loginMapper.getName(string);

    return name;
  }
}
