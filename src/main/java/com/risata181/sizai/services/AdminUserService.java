package com.risata181.sizai.services;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblUser;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 * @brief 利用者サービスインターフェース。
 * @class AdminUserService
 * @author masashi.takada
 */

public interface AdminUserService {

  /**
   * @brief 利用者一覧のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  public List<TblUser> getUserList(Combean comBean);

  /**
   * @brief 利用者新規登録
   * @param tblUser 画面の取得項目
   * @return code 処理結果
   */
  public String registUser(TblUser tblUser) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException;

  /**
   * @brief 利用者一覧更新
   * @param tblUser 画面の取得項目
   * @return code 処理結果
   */
  @Transactional
  public String updateUser(TblUser tblUser) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException;

  /**
   * @brief 利用者一覧削除
   * @param tblUser 画面の取得項目
   * @return code 処理結果
   */
  @Transactional
  public String deleteUser(TblUser tblUser);

  /**
   * @brief 利用者情報1件取得
   * @param seq 画面の取得項目
   */
  public TblUser getUserBySeq(String seq) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException;
}
