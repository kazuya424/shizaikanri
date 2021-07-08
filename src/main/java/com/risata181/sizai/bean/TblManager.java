package com.risata181.sizai.bean;

/**
 * @brief 担当者マスタテーブルBeanクラス
 * @class TblManager
 * @author masashi.takada
 */

public class TblManager extends Combean {

  /** 担当者管理番号. */
  private String managerSeq;

  /** 会社名. */
  private String managerCompany;

  /** 担当者名. */
  private String managerName;

  /** 担当者登録者. */
  private String managerRegId;

  /** 担当者登録日. */
  private String managerRegDt;

  /** 担当者更新者. */
  private String managerUpdId;

  /** 担当者更新日. */
  private String managerUpdDt;

  /** 担当者削除フラグ. */
  private String managerIsDelete;


  /**
   * @brief 担当者管理番号を取得する。
   * @return managerSeq 担当者管理番号
   */
  public String getManagerSeq() {
    return managerSeq;
  }

  /**
   * @brief 担当者管理番号を設定する。
   * @param managerSeq 担当者管理番号
   */
  public void setManagerSeq(String managerSeq) {
    this.managerSeq = managerSeq;
  }

  /**
   * @brief 担当者会社名を取得する。
   * @return managerCompany 担当者会社名
   */
  public String getManagerCompany() {
    return managerCompany;
  }

  /**
   * @brief 担当者会社名を設定する。
   * @param managerCompany 担当者会社名
   */
  public void setManagerCompany(String managerCompany) {
    this.managerCompany = managerCompany;
  }

  /**
   * @brief 担当者名を取得する。
   * @return managerName 担当者名
   */
  public String getManagerName() {
    return managerName;
  }

  /**
   * @brief 担当者名を設定する。
   * @param managerName 担当者名
   */
  public void setManagerName(String managerName) {
    this.managerName = managerName;
  }

  /**
   * @brief 担当者登録者を取得する。
   * @return managerRegId 担当者登録者
   */
  public String getManagerRegId() {
    return managerRegId;
  }

  /**
   * @brief 担当者登録者を設定する。
   * @param managerRegId 担当者登録者
   */
  public void setManagerRegId(String managerRegId) {
    this.managerRegId = managerRegId;
  }

  /**
   * @brief 担当者登録日を取得する。
   * @return managerRegDt 担当者登録日
   */
  public String getManagerRegDt() {
    return managerRegDt;
  }

  /**
   * @brief 担当者登録日を設定する。
   * @param managerRegDt 担当者登録日
   */
  public void setManagerRegDt(String managerRegDt) {
    this.managerRegDt = managerRegDt;
  }

  /**
   * @brief 担当者修正者を取得する。
   * @return managerUpdId 担当者修正者
   */
  public String getManagerUpdId() {
    return managerUpdId;
  }

  /**
   * @brief 担当者修正者を設定する。
   * @param managerUpdId 担当者修正者
   */
  public void setManagerUpdId(String managerUpdId) {
    this.managerUpdId = managerUpdId;
  }

  /**
   * @brief 担当者修正日を取得する。
   * @return managerUpdDt 担当者修正日
   */
  public String getManagerUpdDt() {
    return managerUpdDt;
  }

  /**
   * @brief 担当者修正日を設定する。
   * @param managerUpdDt 担当者修正日
   */
  public void setManagerUpdDt(String managerUpdDt) {
    this.managerUpdDt = managerUpdDt;
  }

  /**
   * @brief 担当者削除フラグを取得する。
   * @return managerIsDelete 担当者削除フラグ
   */
  public String getManagerIsDelete() {
    return managerIsDelete;
  }

  /**
   * @brief 担当者削除フラグを設定する。
   * @param managerIsDelete 担当者削除フラグ
   */
  public void setManagerIsDelete(String managerIsDelete) {
    this.managerIsDelete = managerIsDelete;
  }

  @Override
  public String toString() {
    return "TblManager [managerSeq=" + managerSeq + ", managerCompany=" + managerCompany
        + ", managerName=" + managerName + ", managerRegId=" + managerRegId + ", managerRegDt="
        + managerRegDt + ", managerUpdId=" + managerUpdId + ", managerUpdDt=" + managerUpdDt
        + ", managerIsDelete=" + managerIsDelete + "]";
  }

}
