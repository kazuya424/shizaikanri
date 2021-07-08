package com.risata181.sizai.bean;

/**
 * .
 *
 * @brief 切手・印紙出庫beanクラス
 * @class TblOutgoing
 * @author shuto.senda
 */


public class TblOutgoing extends Combean {

  /** 管理番号. */
  private String outgoingSeq;
  /** 出庫日付. */
  private String outgoingDate;
  /** 出庫入力者. */
  private String outgoingHandler;
  /** 出庫取扱者. */
  private String outgoingInputUser;
  /** 出庫種別. */
  private String outgoingType;
  /** 出庫枚数. */
  private String outgoingCount;
  /** 出庫参考. */
  private String outgoingComment;
  /** 出庫内容. */
  private String outgoingContent;
  /** 出庫登録者. */
  private String outgoingRegId;
  /** 出庫登録日. */
  private String outgoingRegDt;
  /** 出庫修正者. */
  private String outgoingUpdId;
  /** 出庫修正日. */
  private String outgoingUpdDt;
  /** 出庫使用会社. */
  private String outgoingDestination;
  /** 出庫送付先会社. */
  private String outgoingCompany;
  /** 出庫送付担当者. */
  private String outgoingManager;
  /** 出庫削除フラグ. */
  private String outgoingIsDelete;
  /** 種別情報. */
  private TblStock stockInfo;
  /** 価格*枚数. */
  private String priceTimesCount;

  /** 出庫種別情報. */
  private TblStock type;
  /** 出庫登録者情報. */
  private TblUser register;
  /** 出庫修正者情報. */
  private TblUser updater;
  /** 出庫担当者情報. */
  private TblManager manager;
  private TblUser handler;

  /** 出庫取扱者情報. */
  private TblUser inputUser;


  /**
   * 管理番号.
   *
   * @brief 管理番号を取得する.
   * @return outgoingSeq 管理番号
   */
  public String getOutgoingSeq() {
    return outgoingSeq;
  }

  /**
   * 管理番号.
   *
   * @brief 管理番号を設定する.
   * @param outgoingSeq 管理番号
   */
  public void setOutgoingSeq(String outgoingSeq) {
    this.outgoingSeq = outgoingSeq;
  }

  /**
   * 出庫日付.
   *
   * @brief 出庫日付を取得する.
   * @return outgoingDate 出庫日付
   */
  public String getOutgoingDate() {
    return outgoingDate;
  }

  /**
   * 出庫日付.
   *
   * @brief 出庫日付を設定する.
   * @param outgoingDate 出庫日付
   */
  public void setOutgoingDate(String outgoingDate) {
    this.outgoingDate = outgoingDate;
  }

  /**
   * 出庫入力者.
   *
   * @brief 出庫入力者を取得する.
   * @return outgoingManager 出庫入力者
   */
  public String getOutgoingHandler() {
    return outgoingHandler;
  }

  /**
   * 出庫入力者.
   *
   * @brief 出庫入力者を設定する.
   * @param outgoingHandler 出庫入力者
   */
  public void setOutgoingHandler(String outgoingHandler) {
    this.outgoingHandler = outgoingHandler;
  }

  /**
   * 出庫種別.
   *
   * @brief 出庫種別を取得する.
   * @return outgoingType 出庫種別
   */
  public String getOutgoingType() {
    return outgoingType;
  }

  /**
   * 出庫種別.
   *
   * @brief 出庫種別を設定する.
   * @param outgoingType 出庫種別
   */
  public void setOutgoingType(String outgoingType) {
    this.outgoingType = outgoingType;
  }

  /**
   * 出庫枚数.
   *
   * @brief 出庫枚数を取得する.
   * @return outgoingCount 出庫枚数
   */
  public String getOutgoingCount() {
    return outgoingCount;
  }

  /**
   * 出庫枚数.
   *
   * @brief 出庫枚数を設定する.
   * @param outgoingCount 出庫枚数
   */
  public void setOutgoingCount(String outgoingCount) {
    this.outgoingCount = outgoingCount;
  }

  /**
   * 出庫参考.
   *
   * @brief 出庫参考を取得する.
   * @return outgoingComment 出庫参考
   */
  public String getOutgoingComment() {
    return outgoingComment;
  }

  /**
   * 出庫参考.
   *
   * @brief 出庫参考を設定する.
   * @param outgoingComment 出庫参考
   */
  public void setOutgoingComment(String outgoingComment) {
    this.outgoingComment = outgoingComment;
  }

  /**
   * 出庫内容.
   *
   * @brief 出庫内容を取得する.
   * @return outgoingContent 出庫内容
   */
  public String getOutgoingContent() {
    return outgoingContent;
  }

  /**
   * 出庫内容.
   *
   * @brief 出庫内容を設定する.
   * @param outgoingContent 出庫内容
   */
  public void setOutgoingContent(String outgoingContent) {
    this.outgoingContent = outgoingContent;
  }

  /**
   * 出庫登録者.
   *
   * @brief 出庫登録者を取得する.
   * @return outgoingRegId 出庫登録者
   */
  public String getOutgoingRegId() {
    return outgoingRegId;
  }

  /**
   * 出庫登録者.
   *
   * @brief 出庫登録者を設定する.
   * @param outgoingRegId 出庫登録者
   */
  public void setOutgoingRegId(String outgoingRegId) {
    this.outgoingRegId = outgoingRegId;
  }

  /**
   * 出庫登録日.
   *
   * @brief 出庫登録日を取得する.
   * @return outgoingRegDt 出庫登録日
   */
  public String getOutgoingRegDt() {
    return outgoingRegDt;
  }

  /**
   * 出庫登録日.
   *
   * @brief 出庫登録日を設定する.
   * @param outgoingRegDt 出庫登録日
   */
  public void setOutgoingRegDt(String outgoingRegDt) {
    this.outgoingRegDt = outgoingRegDt;
  }

  /**
   * 出庫修正者.
   *
   * @brief 出庫修正者を取得する.
   * @return outgoingUpdId 出庫修正者
   */
  public String getOutgoingUpdId() {
    return outgoingUpdId;
  }

  /**
   * 出庫修正者.
   *
   * @brief 出庫修正者を設定する.
   * @param outgoingUpdId 出庫修正者
   */
  public void setOutgoingUpdId(String outgoingUpdId) {
    this.outgoingUpdId = outgoingUpdId;
  }

  /**
   * 出庫修正日.
   *
   * @brief 出庫修正日を取得する.
   * @return outgoingUpdDt 出庫修正日
   */
  public String getOutgoingUpdDt() {
    return outgoingUpdDt;
  }

  /**
   * 出庫修正日.
   *
   * @brief 出庫修正日を設定する.
   * @param outgoingUpdDt 出庫修正日
   */
  public void setOutgoingUpdDt(String outgoingUpdDt) {
    this.outgoingUpdDt = outgoingUpdDt;
  }

  /**
   * 出庫削除フラグ.
   *
   * @brief 出庫削除フラグを取得する.
   * @return outgoingIsDelete 出庫削除フラグ
   */
  public String getOutgoingIsDelete() {
    return outgoingIsDelete;
  }

  /**
   * 出庫削除フラグ.
   *
   * @brief 出庫削除フラグを設定する.
   * @param outgoingIsDelete 出庫削除フラグ
   */
  public void setOutgoingIsDelete(String outgoingIsDelete) {
    this.outgoingIsDelete = outgoingIsDelete;
  }

  /**
   * 出庫種別情報.
   *
   * @brief 出庫種別情報を取得する.
   * @return type 出庫種別情報
   */
  public TblStock getType() {
    return type;
  }

  /**
   * 出庫種別情報.
   *
   * @brief 出庫種別情報を設定する.
   * @param type 出庫種別情報
   */
  public void setType(TblStock type) {
    this.type = type;
  }

  /**
   * 出庫登録者情報.
   *
   * @brief 出庫登録者情報を取得する.
   * @return register 出庫登録者情報
   */
  public TblUser getRegister() {
    return register;
  }

  /**
   * 出庫登録者情報.
   *
   * @brief 出庫登録者情報を設定する.
   * @param register 出庫登録者情報
   */
  public void setRegister(TblUser register) {
    this.register = register;
  }

  /**
   * 出庫修正者情報.
   *
   * @brief 出庫修正者情報を取得する.
   * @return updater 出庫修正者情報
   */
  public TblUser getUpdater() {
    return updater;
  }

  /**
   * 出庫修正者情報.
   *
   * @brief 出庫修正者情報を設定する.
   * @param updater 出庫修正者情報
   */
  public void setUpdater(TblUser updater) {
    this.updater = updater;
  }

  /**
   * 出庫担当者情報.
   *
   * @brief 出庫担当者情報を取得する.
   * @return manager 出庫担当者情報
   */
  public TblManager getManager() {
    return manager;
  }

  /**
   * 出庫担当者情報.
   *
   * @brief 出庫担当者情報を設定する.
   * @param manager 出庫担当者情報
   */
  public void setManager(TblManager manager) {
    this.manager = manager;
  }

  /**
   * 出庫入力者情報.
   *
   * @brief 出庫入力者情報を取得する。
   * @return handler 出庫入力者情報
   */
  public TblUser getHandler() {
    return handler;
  }

  /**
   * 出庫入力者情報.
   *
   * @brief 出庫入力者情報を設定する。
   * @param handler 出庫入力者情報
   */
  public void setHandler(TblUser handler) {
    this.handler = handler;
  }

  /**
   * 出庫使用会社情報.
   *
   * @brief 出庫使用会社情報を取得する。
   * @return outgoingDestination 出庫使用会社情報
   */
  public String getOutgoingDestination() {
    return outgoingDestination;
  }

  /**
   * 出庫使用会社情報.
   *
   * @brief 出庫使用会社情報を設定する。
   * @param outgoingDestination 出庫使用会社情報
   */
  public void setOutgoingDestination(String outgoingDestination) {
    this.outgoingDestination = outgoingDestination;
  }

  /**
   * 出庫送付先会社.
   *
   * @brief 出庫送付先会社を取得する。
   * @return outgoingCompany 出庫送付先会社
   */
  public String getOutgoingCompany() {
    return outgoingCompany;
  }

  /**
   * 出庫送付先会社.
   *
   * @brief 出庫送付先会社を設定する。
   * @param outgoingCompany 出庫送付先会社
   */
  public void setOutgoingCompany(String outgoingCompany) {
    this.outgoingCompany = outgoingCompany;
  }

  /**
   * 種別情報.
   *
   * @brief 種別情報を取得する。
   * @return stockInfo 種別情報
   */
  public TblStock getStockInfo() {
    return stockInfo;
  }

  /**
   * 種別情報.
   *
   * @brief 種別情報を設定する。
   * @param stockInfo 種別情報
   */
  public void setStockInfo(TblStock stockInfo) {
    this.stockInfo = stockInfo;
  }

  /**
   * 価格*枚数.
   *
   * @brief 価格*枚数を取得する。
   * @return priceTimesCount 価格*枚数
   */
  public String getPriceTimesCount() {
    return priceTimesCount;
  }

  /**
   * 価格*枚数.
   *
   * @brief 価格*枚数を設定する。
   * @param priceTimesCount 価格*枚数
   */
  public void setPriceTimesCount(String priceTimesCount) {
    this.priceTimesCount = priceTimesCount;
  }

  /**
   * @brief 取扱者を取得。
   * @return
   */
  public String getOutgoingInputUser() {
    return outgoingInputUser;
  }

  /**
   * @brief 取扱者を設定。
   * @param outgoingInputUser
   */
  public void setOutgoingInputUser(String outgoingInputUser) {
    this.outgoingInputUser = outgoingInputUser;
  }

  /**
   * @brief 取扱者情報を取得。
   * @return
   */
  public TblUser getInputUser() {
    return inputUser;
  }

  /**
   * @brief 取扱者情報を設定。
   * @param inputUser
   */
  public void setInputUser(TblUser inputUser) {
    this.inputUser = inputUser;
  }

  /**
   * @brief 送付先担当者を取得。
   * @return
   */
  public String getOutgoingManager() {
    return outgoingManager;
  }

  /**
   * @brief 送付先担当者を設定。
   * @param outgoingManager
   */
  public void setOutgoingManager(String outgoingManager) {
    this.outgoingManager = outgoingManager;
  }

  @Override
  public String toString() {
    return "TblOutgoing [outgoingSeq=" + outgoingSeq + ", outgoingDate=" + outgoingDate
        + ", outgoingManager=" + outgoingHandler + ", outgoingInputUser=" + outgoingInputUser
        + ", outgoingType=" + outgoingType + ", outgoingCount=" + outgoingCount
        + ", outgoingComment=" + outgoingComment + ", outgoingContent=" + outgoingContent
        + ", outgoingRegId=" + outgoingRegId + ", outgoingRegDt=" + outgoingRegDt
        + ", outgoingUpdId=" + outgoingUpdId + ", outgoingUpdDt=" + outgoingUpdDt
        + ", outgoingIsDelete=" + outgoingIsDelete + ", type=" + type + ", register=" + register
        + ", updater=" + updater + ", inputUser=" + inputUser + ", manager=" + manager + "]";
  }

}
