package com.risata181.sizai.bean;

/**
 * @brief 在庫beanクラス
 * @class TblStock
 * @author sae.hayashi
 */
public class TblStock extends Combean {

 /** 管理番号. */
  private String stockSeq;
  /** 種別名. */
  private String stockType;

  /** 種別価格. */
  private String stockPrice;

  /** 種別在庫. */
  private String stockCount;

  /** 種別登録者. */
  private String stockRegId;

  /** 種別登録日. */
  private String stockRegDt;

  /** 種別修正者. */
  private String stockUpdId;

  /** 種別修正日. */
  private String stockUpdDt;

  /** 登録者. */
  private TblUser register;

  /** 修正者. */
  private TblUser updater;

  /**
   * @brief 在庫管理番号を取得する。
   * @return stockSeq 在庫管理番号
   */
  public String getStockSeq() {
    return stockSeq;
  }

  /**
   * @brief 在庫管理番号を設定する。
   * @param stockSeq 在庫管理番号
   */
  public void setStockSeq(String stockSeq) {
    this.stockSeq = stockSeq;
  }

  /**
   * @brief 種別名を取得する。
   * @return stockType 種別名
   */
  public String getStockType() {
    return stockType;
  }

  /**
   * @brief 種別名を設定する。
   * @param stockType 種別名
   */
  public void setStockType(String stockType) {
    this.stockType = stockType;
  }

  /**
   * @brief 種別価格を取得する。
   * @return stockPrice 種別価格
   */
  public String getStockPrice() {
    return stockPrice;
  }

  /**
   * @brief 種別価格を設定する。
   * @param stockPrice 種別価格
   */
  public void setStockPrice(String stockPrice) {
    this.stockPrice = stockPrice;
  }

  /**
   * @brief 種別在庫を取得する。
   * @return stockCount 種別在庫
   */
  public String getStockCount() {
    return stockCount;
  }

  /**
   * @brief 種別在庫を設定する。
   * @param stockCount 種別在庫
   */
  public void setStockCount(String stockCount) {
    this.stockCount = stockCount;
  }

  /**
   * @brief 種別登録者を取得する。
   * @return stockRegId 種別登録者
   */
  public String getStockRegId() {
    return stockRegId;
  }

  /**
   * @brief 種別登録者を設定する。
   * @param stockRegId 種別登録者
   */
  public void setStockRegId(String stockRegId) {
    this.stockRegId = stockRegId;
  }

  /**
   * @brief 種別登録日を取得する。
   * @return stockRegDt 種別登録日
   */
  public String getStockRegDt() {
    return stockRegDt;
  }

  /**
   * @brief 種別登録日を設定する。
   * @param stockRegDt 種別登録日
   */
  public void setStockRegDt(String stockRegDt) {
    this.stockRegDt = stockRegDt;
  }

  /**
   * @brief 種別修正者を取得する。
   * @return stockUpdId 種別修正者
   */
  public String getStockUpdId() {
    return stockUpdId;
  }

  /**
   * @brief 種別修正者を設定する。
   * @param stockUpdId 種別修正者
   */
  public void setStockUpdId(String stockUpdId) {
    this.stockUpdId = stockUpdId;
  }

  /**
   * @brief 種別修正日を取得する。
   * @return stockUpdDt 種別修正日
   */
  public String getStockUpdDt() {
    return stockUpdDt;
  }

  /**
   * @brief 種別修正日を設定する。
   * @param stockUpdDt 種別修正日
   */
  public void setStockUpdDt(String stockUpdDt) {
    this.stockUpdDt = stockUpdDt;
  }

  /**
   * @brief 登録者を取得する。
   * @return register 登録者
   */
  public TblUser getRegister() {
    return register;
  }

  /**
   * @brief 登録者を設定する。
   * @param register 登録者
   */
  public void setRegister(TblUser register) {
    this.register = register;
  }

  /**
   * @brief 修正者を取得する。
   * @return updater 修正者
   */
  public TblUser getUpdater() {
    return updater;
  }

  /**
   * @brief 修正者を設定する。
   * @param updater 修正者
   */
  public void setUpdater(TblUser updater) {
    this.updater = updater;
  }
}
