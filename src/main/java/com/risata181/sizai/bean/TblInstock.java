package com.risata181.sizai.bean;

/**
 * @brief 切手・印紙入庫beanクラス
 * @class TblInstock
 * @author sae.hayashi
 */
public class TblInstock extends Combean {

  /** 管理番号. */
  private String instockSeq;

  /** 入庫日付. */
  private String instockDate;

  /** 入庫取扱者.(入力者) */
  private String instockHandler;

  /** 入庫取扱者. */
  private String instockInputUser;

  /** 入庫種別. */
  private String instockType;

  /** 入庫枚数. */
  private String instockCount;

  /** 入庫備考. */
  private String instockComment;

  /** 入庫登録者. */
  private String instockRegId;

  /** 入庫登録日. */
  private String instockRegDt;

  /** 入庫修正者. */
  private String instockUpdId;

  /** 入庫修正日. */
  private String instockUpdDt;

  /** 入庫登録者情報. */
  private TblUser register;
  /** 入庫修正者情報. */
  private TblUser updater;
  /** 入庫種別情報. */
  private TblStock type;
  /** 出庫担当者情報. */
  private TblManager manager;
  private TblUser handler;

  /** 入庫取扱者情報. */
  private TblUser inputUser;

  /**
   * @brief managerを取得する。
   * @return manager
   */
  public TblManager getManager() {
    return manager;
  }

  /**
   * @brief managerを設定する。
   * @param manager manager
   */
  public void setManager(TblManager manager) {
    this.manager = manager;
  }

  /**
   * @brief handlerを取得する。
   * @return handler
   */
  public TblUser getHandler() {
    return handler;
  }

  /**
   * @brief handlerを設定する。
   * @param handler handler
   */
  public void setHandler(TblUser handler) {
    this.handler = handler;
  }

  /**
   * @brief typeを取得する。
   * @return type
   */
  public TblStock getType() {
    return type;
  }

  /**
   * @brief typeを設定する。
   * @param type type
   */
  public void setType(TblStock type) {
    this.type = type;
  }

  /**
   * @brief 入庫管理番号を取得する。
   * @return instockSeq 入庫管理番号
   */
  public String getInstockSeq() {
    return instockSeq;
  }

  /**
   * @brief 入庫管理番号を設定する。
   * @param instockSeq 入庫管理番号
   */
  public void setInstockSeq(String instockSeq) {
    this.instockSeq = instockSeq;
  }

  /**
   * @brief 入庫日付を取得する。
   * @return instockDate 入庫日付
   */
  public String getInstockDate() {
    return instockDate;
  }

  /**
   * @brief 入庫日付を設定する。
   * @param instockDate 入庫日付
   */
  public void setInstockDate(String instockDate) {
    this.instockDate = instockDate;
  }

  /**
   * @brief 入庫取扱者を取得する。
   * @return instockHandler 入庫取扱者
   */
  public String getInstockHandler() {
    return instockHandler;
  }

  /**
   * @brief 入庫取扱者を設定する。
   * @param instockHandler 入庫取扱者
   */
  public void setInstockHandler(String instockHandler) {
    this.instockHandler = instockHandler;
  }

  /**
   * @brief 入庫種別を取得する。
   * @return instockType 入庫種別
   */
  public String getInstockType() {
    return instockType;
  }

  /**
   * @brief 入庫種別を設定する。
   * @param instockType 入庫種別
   */
  public void setInstockType(String instockType) {
    this.instockType = instockType;
  }

  /**
   * @brief 入庫枚数を取得する。
   * @return instockCount 入庫枚数
   */
  public String getInstockCount() {
    return instockCount;
  }

  /**
   * @brief 入庫枚数を設定する。
   * @param instockCount 入庫枚数
   */
  public void setInstockCount(String instockCount) {
    this.instockCount = instockCount;
  }

  /**
   * @brief 入庫参考を取得する。
   * @return instockComment 入庫参考
   */
  public String getInstockComment() {
    return instockComment;
  }

  /**
   * @brief 入庫参考を設定する。
   * @param instockComment 入庫参考
   */
  public void setInstockComment(String instockComment) {
    this.instockComment = instockComment;
  }

  /**
   * @brief 入庫登録者を取得する。
   * @return instockRegId 入庫登録者
   */
  public String getInstockRegId() {
    return instockRegId;
  }

  /**
   * @brief 入庫登録者を設定する。
   * @param instockRegId 入庫登録者
   */
  public void setInstockRegId(String instockRegId) {
    this.instockRegId = instockRegId;
  }

  /**
   * @brief 入庫登録日を取得する。
   * @return instockRegDt 入庫登録日
   */
  public String getInstockRegDt() {
    return instockRegDt;
  }

  /**
   * @brief 入庫登録日を設定する。
   * @param instockRegDt 入庫登録日
   */
  public void setInstockRegDt(String instockRegDt) {
    this.instockRegDt = instockRegDt;
  }

  /**
   * @brief 入庫修正者を取得する。
   * @return instockUpdId 入庫修正者
   */
  public String getInstockUpdId() {
    return instockUpdId;
  }

  /**
   * @brief 入庫修正者を設定する。
   * @param instockUpdId 入庫修正者
   */
  public void setInstockUpdId(String instockUpdId) {
    this.instockUpdId = instockUpdId;
  }

  /**
   * @brief 入庫修正日を取得する。
   * @return instockUpdDt 入庫修正日
   */
  public String getInstockUpdDt() {
    return instockUpdDt;
  }

  /**
   * @brief 入庫修正日を設定する。
   * @param instockUpdDt 入庫修正日
   */
  public void setInstockUpdDt(String instockUpdDt) {
    this.instockUpdDt = instockUpdDt;
  }

  /**
   * @brief 入庫登録者情報を取得する。
   * @return register 入庫登録者情報
   */
  public TblUser getRegister() {
    return register;
  }

  /**
   * @brief 入庫登録者情報を設定する。
   * @param register 入庫登録者情報
   */
  public void setRegister(TblUser register) {
    this.register = register;
  }

  /**
   * @brief 入庫修正者情報を取得する。
   * @return updater 入庫修正者情報
   */
  public TblUser getUpdater() {
    return updater;
  }

  /**
   * @brief 入庫修正者情報を設定する。
   * @param updater 入庫修正者情報
   */
  public void setUpdater(TblUser updater) {
    this.updater = updater;
  }

  /**
   * @brief 入庫取扱者を取得
   * @return
   */
  public String getInstockInputUser() {
    return instockInputUser;
  }

  /**
   * @brief 入庫取扱者を設定
   * @param instockInputUser
   */
  public void setInstockInputUser(String instockInputUser) {
    this.instockInputUser = instockInputUser;
  }

  /**
   * @brief 入庫取扱者を取得
   * @return
   */
  public TblUser getInputUser() {
    return inputUser;
  }

  /**
   * @brief 入庫取扱者を設定
   * @param inputUser
   */
  public void setInputUser(TblUser inputUser) {
    this.inputUser = inputUser;
  }
}
