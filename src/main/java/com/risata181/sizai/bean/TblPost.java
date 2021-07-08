package com.risata181.sizai.bean;

/**
 * @brief 郵便beanクラス
 * @class TblPost
 * @author kana.kinoshita
 */

public class TblPost extends Combean {

  /** 管理番号. */
  private String postSeq;

  /** 郵便入力日. */
  private String postInput;

  /** 郵便入力者. */
  private int postInputUser;

  /** 郵便送付先. */
  private String postSender;

  /** 郵便コメント. */
  private String postComment;

  /** 郵便会社. */
  private int postCompany;

  /** 郵便担当者. */
  private int postManager;

  /** 郵便備考. */
  private String postRemark;

  /** 郵便登録者. */
  private String postRegId;

  /** 郵便更新者. */
  private String postUpdId;

  /** 郵便更新日. */
  private String postUpdDt;

  /** 郵便入力者情報. */
  private TblUser inputUserInfo;

  /** 郵便会社情報. */
  private TblManager companyInfo;

  /** 郵便担当者情報. */
  private TblManager managerInfo;

  /**
   * @brief 郵便管理番号を取得する。
   * @return postSeq 郵便管理番号
   */
  public String getPostSeq() {
    return postSeq;
  }

  /**
   * @brief 郵便管理番号を設定する。
   * @param postSeq 郵便管理番号
   */
  public void setPostSeq(String postSeq) {
    this.postSeq = postSeq;
  }

  /**
   * @brief 郵便入力日を取得する。
   * @return postInput 郵便入力日
   */
  public String getPostInput() {
    return postInput;
  }

  /**
   * @brief 郵便入力日を設定する。
   * @param postInput 郵便入力日
   */
  public void setPostInput(String postInput) {
    this.postInput = postInput;
  }

  /**
   * @brief 郵便入力者を取得する。
   * @return postInputUser 郵便入力者
   */
  public int getPostInputUser() {
    return postInputUser;
  }

  /**
   * @brief 郵便入力者を設定する。
   * @param postInputUser 郵便入力者
   */
  public void setPostInputUser(int postInputUser) {
    this.postInputUser = postInputUser;
  }

  /**
   * @brief 郵便送付先を取得する。
   * @return postSender 郵便送付先
   */
  public String getPostSender() {
    return postSender;
  }

  /**
   * @brief 郵便配布先を設定する。
   * @param postSender 郵便配布先
   */
  public void setPostSender(String postSender) {
    this.postSender = postSender;
  }

  /**
   * @brief 郵便内容を取得する。
   * @return postComment 郵便内容
   */
  public String getPostComment() {
    return postComment;
  }

  /**
   * @brief 郵便内容を設定する。
   * @param postComment 郵便内容
   */
  public void setPostComment(String postComment) {
    this.postComment = postComment;
  }

  /**
   * @brief 郵便担当者を取得する。
   * @return postManager 郵便担当者
   */
  public int getPostManager() {
    return postManager;
  }

  /**
   * @brief 郵便担当者を設定する。
   * @param postManager 郵便担当者
   */
  public void setPostManager(int postManager) {
    this.postManager = postManager;
  }

  /**
   * @brief 郵便備考を取得する。
   * @return postRemark 郵便備考
   */
  public String getPostRemark() {
    return postRemark;
  }

  /**
   * @brief 郵便備考を設定する。
   * @param postRemark 郵便備考
   */
  public void setPostRemark(String postRemark) {
    this.postRemark = postRemark;
  }

  /**
   * @brief 郵便登録者を取得する。
   * @return postRegId 郵便登録者
   */
  public String getPostRegId() {
    return postRegId;
  }

  /**
   * @brief 郵便登録者を設定する。
   * @param postRegId 郵便登録者
   */
  public void setPostRegId(String postRegId) {
    this.postRegId = postRegId;
  }

  /**
   * @brief 郵便更新者を取得する。
   * @return postUpdId 郵便更新者
   */
  public String getPostUpdId() {
    return postUpdId;
  }

  /**
   * @brief 郵便更新者を設定する。
   * @param postUpdId 郵便更新者
   */
  public void setPostUpdId(String postUpdId) {
    this.postUpdId = postUpdId;
  }

  /**
   * @brief 郵便更新日を取得する。
   * @return postUpdDt 郵便更新日
   */
  public String getPostUpdDt() {
    return postUpdDt;
  }

  /**
   * @brief 郵便更新日を設定する。
   * @param postUpdDt 郵便更新日
   */
  public void setPostUpdDt(String postUpdDt) {
    this.postUpdDt = postUpdDt;
  }

  /**
   * @brief 郵便入力者情報を取得する。
   * @return inputUserInfo 郵便入力者情報
   */
  public TblUser getInputUserInfo() {
    return inputUserInfo;
  }

  /**
   * @brief 郵便入力者情報を設定する。
   * @param inputUserInfo 郵便入力者情報
   */
  public void setInputUserInfo(TblUser inputUserInfo) {
    this.inputUserInfo = inputUserInfo;
  }

  /**
   * @brief 郵便担当者情報を取得する。
   * @return managerInfo 郵便担当者情報
   */
  public TblManager getManagerInfo() {
    return managerInfo;
  }

  /**
   * @brief 郵便担当者情報を設定する。
   * @param managerInfo 郵便担当者情報
   */
  public void setManagerInfo(TblManager managerInfo) {
    this.managerInfo = managerInfo;
  }

  @Override
  public String toString() {
    return "TblPost [postSeq=" + postSeq + ", postInput=" + postInput + ", postSender=" + postSender
        + ", postComment=" + postComment + ", postRemark=" + postRemark + ", postUpdDt=" + postUpdDt
        + ", inputUserInfo =" + inputUserInfo + ", managerInfo =" + managerInfo + "]";
  }

  /**
   * @brief 会社名を取得。
   * @return
   */
  public int getPostCompany() {
    return postCompany;
  }

  /**
   * @brief 会社名を設定。
   * @param postCompany
   */
  public void setPostCompany(int postCompany) {
    this.postCompany = postCompany;
  }

  /**
   * @brief 会社情報を取得。
   * @return
   */
  public TblManager getCompanyInfo() {
    return companyInfo;
  }

  /**
   * @brief 会社情報を設定。
   * @param companyInfo
   */
  public void setCompanyInfo(TblManager companyInfo) {
    this.companyInfo = companyInfo;
  }

}
