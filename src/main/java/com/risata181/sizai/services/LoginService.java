package com.risata181.sizai.services;

import com.risata181.sizai.bean.TblUser;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

/**
 * @brief ログインサービスインターフェース。
 * @interface LoginService
 * @author jeongsub.kim
 *
 */
public interface LoginService {

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
  public String login(TblUser tblUser) throws NoSuchAlgorithmException, GeneralSecurityException;

  /**
   * @brief 利用者権限取得。
   * @param string ユーザーID
   * @return 利用者権限
   *         <ul>
   *         <li>ADMIN 管理者
   *         <li>USER 一般
   *         </ul>
   */
  public String getAuth(String string);

  /**
   * @brief 管理番号取得。
   * @param string ユーザーID
   * @return 管理番号
   */
  public String getSeq(String string);

  /**
   * @brief 利用者名取得。
   * @param string ユーザーID
   * @return 利用者名
   */
  public String getName(String string);

}
