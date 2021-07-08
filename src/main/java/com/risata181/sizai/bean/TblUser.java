package com.risata181.sizai.bean;

/**
 * @brief 利用者マスタテーブルBeanクラス
 * @class TblUser
 * @author masashi.takada
 */

public class TblUser extends Combean {

  /** 利用者管理番号. */
  private String userSeq;

  /** 利用者ID. */
  private String userId;

  /** 利用者パスワード. */
  private String userPw;

  /** 利用者名. */
  private String userName;

  /** 利用者権限. */
  private String userAuth;

  /** 利用者登録者ID. */
  private String userRegId;

  /** 利用者登録日. */
  private String userRegDt;

  /** 利用者更新者ID. */
  private String userUpdId;

  /** 利用者更新日. */
  private String userUpdDt;

  /** 利用者パスワードエラー回数. */
  private String userPwdErr;

  /** 利用者ロックフラグ. */
  private String userIsLock;

  /** 利用者削除フラグ. */
  private String userIsDelete;

  /** 利用者登録者. */
  private TblUser register;

  /** 利用者更新者. */
  private TblUser updater;

  /**
   * @brief 利用者管理番号を取得する。
   * @return userSeq 利用者管理番号
   */
  public String getUserSeq() {
    return userSeq;
  }

  /**
   * @brief 利用者管理番号を設定する。
   * @param userSeq userSeq 利用者管理番号
   */
  public void setUserSeq(String userSeq) {
    this.userSeq = userSeq;
  }

  /**
   * @brief 利用者IDを取得する。
   * @return userId 利用者ID
   */
  public String getUserId() {
    return userId;
  }

  /**
   * @brief 利用者IDを設定する。
   * @param userId 利用者ID
   */
  public void setUserId(String userId) {
    this.userId = userId;
  }

  /**
   * @brief 利用者パスワードを取得する。
   * @return 利用者パスワード
   */
  public String getUserPw() {
    return userPw;
  }

  /**
   * @brief 利用者パスワードを設定する。
   * @param userPw 利用者パスワード
   */
  public void setUserPw(String userPw) {
    this.userPw = userPw;
  }

  /**
   * @brief 利用者名を取得する。
   * @return 利用者名
   */
  public String getUserName() {
    return userName;
  }

  /**
   * @brief 利用者名を設定する。
   * @param userName 利用者名
   */
  public void setUserName(String userName) {
    this.userName = userName;
  }

  /**
   * @brief 利用者権限を取得する。
   * @return userAuth 利用者権限
   */
  public String getUserAuth() {
    return userAuth;
  }

  /**
   * @brief 利用者権限を設定する。
   * @param userAuth 利用者権限
   */
  public void setUserAuth(String userAuth) {
    this.userAuth = userAuth;
  }

  /**
   * @brief 利用者登録者IDを取得する。
   * @return userRegId 利用者登録者ID
   */
  public String getUserRegId() {
    return userRegId;
  }

  /**
   * @brief 利用者登録者IDを設定する。
   * @param userRegId 利用者登録者ID
   */
  public void setUserRegId(String userRegId) {
    this.userRegId = userRegId;
  }

  /**
   * @brief 利用者登録日を取得する。
   * @return userRegDt 利用者登録日
   */
  public String getUserRegDt() {
    return userRegDt;
  }

  /**
   * @brief 利用者登録日を設定する。
   * @param userRegDt 利用者登録日
   */
  public void setUserRegDt(String userRegDt) {
    this.userRegDt = userRegDt;
  }

  /**
   * @brief 利用者更新IDを取得する。
   * @return userUpdId 利用者更新ID
   */
  public String getUserUpdId() {
    return userUpdId;
  }

  /**
   * @brief 利用者更新IDを設定する。
   * @param userUpdId 利用者更新ID
   */
  public void setUserUpdId(String userUpdId) {
    this.userUpdId = userUpdId;
  }

  /**
   * @brief 利用者更新日を取得する。
   * @return userUpdDt 利用者更新日
   */
  public String getUserUpdDt() {
    return userUpdDt;
  }

  /**
   * @brief 利用者更新日を設定する。
   * @param userUpdDt 利用者更新日
   */
  public void setUserUpdDt(String userUpdDt) {
    this.userUpdDt = userUpdDt;
  }

  /**
   * @brief 利用者パスワードエラー回数を取得する。
   * @return userPwdErr 利用者パスワードエラー回数
   */
  public String getUserPwdErr() {
    return userPwdErr;
  }

  /**
   * @brief 利用者パスワードエラー回数を設定する。
   * @param userPwdErr 利用者パスワードエラー回数
   */
  public void setUserPwdErr(String userPwdErr) {
    this.userPwdErr = userPwdErr;
  }

  /**
   * @brief 利用者ロックフラグを取得する。
   * @return userIsLock 利用者ロックフラグ
   */
  public String getUserIsLock() {
    return userIsLock;
  }

  /**
   * @brief 利用者ロックフラグを設定する。
   * @param userIsLock 利用者ロックフラグ
   */
  public void setUserIsLock(String userIsLock) {
    this.userIsLock = userIsLock;
  }

  /**
   * @brief 利用者削除フラグを取得する。
   * @return userIsDelete 利用者削除フラグ
   */
  public String getUserIsDelete() {
    return userIsDelete;
  }

  /**
   * @brief 利用者削除フラグを設定する。
   * @param userIsDelete 利用者削除フラグ
   */
  public void setUserIsDelete(String userIsDelete) {
    this.userIsDelete = userIsDelete;
  }

  /**
   * @brief 利用者登録者を取得する。
   * @return register 利用者登録者
   */
  public TblUser getRegister() {
    return register;
  }

  /**
   * @brief 利用者登録者を設定する。
   * @param register 利用者登録者
   */
  public void setRegister(TblUser register) {
    this.register = register;
  }

  /**
   * @brief 利用者更新者を取得する。
   * @return updater 利用者更新者
   */
  public TblUser getUpdater() {
    return updater;
  }

  /**
   * @brief 利用者更新者を設定する。
   * @param updater 利用者更新者
   */
  public void setUpdater(TblUser updater) {
    this.updater = updater;
  }

  @Override
  public String toString() {
    return "TblUser [userSeq=" + userSeq + ", userId=" + userId + ", userPw=" + userPw
        + ", userName=" + userName + ", userAuth=" + userAuth + ", userRegId=" + userRegId
        + ", userRegDt=" + userRegDt + ", userUpdId=" + userUpdId + ", userUpdDt=" + userUpdDt
        + ", userPwdErr=" + userPwdErr + ", userIsLock=" + userIsLock + ", userIsDelete="
        + userIsDelete + "]";
  }

}
