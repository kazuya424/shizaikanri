package com.risata181.sizai.entity;

import com.risata181.sizai.bean.TblUser;
import com.risata181.sizai.config.Mapper;

/**
 * @brief ログインマッパーインターフェース。
 * @interface LoginMapper
 * @author jeongsub.kim
 *
 */
@Mapper
public interface LoginMapper {

  /**
   * @brief ログイン。
   * @details ユーザーIDに一致するユーザーデータを取得する
   * @param tblUser ユーザー
   * @return ユーザー
   * @throws Exception 例外
   */
  TblUser login(TblUser tblUser);

  /**
   * @brief 利用者権限取得。
   * @details ユーザーIDに一致する利用者権限を取得する
   * @param string ユーザーID
   * @return 利用者権限
   * @throws Exception 例外
   */
  String getAuth(String string);

  /**
   * @brief 管理番号取得。
   * @details ユーザーIDに一致する管理番号を取得する
   * @param string ユーザーID
   * @return 管理番号
   * @throws Exception 例外
   */
  String getSeq(String string);

  /**
   * @brief 利用者名取得。
   * @details ユーザーIDに一致する利用者名を取得する
   * @param string ユーザーID
   * @return 利用者名
   * @throws Exception 例外
   */
  String getName(String string);

}
