package com.risata181.sizai.bean;

/**
 * @brief TblPcadminクラス
 * @class TblPcadmin
 * @author shuto.senda
 */

public class TblPcadmin extends Combean {

  /** 管理番号. */
  private String pcadminSeq;

  /** ID. */
  private String pcadminId;

  /** 保有会社. */
  private int pcadminHoldingCompany;

  /** 保管場所. */
  private String pcadminHoldingPlace;

  /** 稼働区分. */
  private String pcadminOperation;

  /** 利用者. */
  private String pcadminUser;

  /** 前回利用者. */
  private String pcadminLastUser;

  /** 種類. */
  private String pcadminType;

  /** アカウント名. */
  private String pcadminAccountName;

  /** パスワード. */
  private String pcadminPassword;

  /** メーカー. */
  private String pcadminMaker;

  /** モデル. */
  private String pcadminModel;

  /** 型番. */
  private String pcadminModelNum;

  /** MACアドレス(イーサネット用). */
  private String pcadminEthernet;

  /** MACアドレス(無線LAN用). */
  private String pcadminWifiAddress;

  /** CPU. */
  private String pcadminCpu;

  /** メモリ. */
  private String pcadminMemory;

  /** ハードディスク. */
  private String pcadminHardDisk;

  /** インストールメディア. */
  private String pcadminInstallMedia;

  /** セキュリティソフト. */
  private String pcadminSecuritySoft;

  /** Office. */
  private String pcadminOffice;

  /** OS. */
  private String pcadminOs;

  /** プロダクトキー. */
  private String pcadminProductKey;

  /** 形態. */
  private String pcadminForm;

  /** 返却日. */
  private String pcadminRetDt;

  /** 購入日. */
  private String pcadminPurchaseDate;

  /** 登録者. */
  private String pcadminRegId;

  /** 登録日. */
  private String pcadminRegDt;

  /** 更新者. */
  private String pcadminUpdId;

  /** 更新日. */
  private String pcadminUpdDt;

  /** 使用場所. */
  private String pcadminUsePlace;

  /** 備考. */
  private String pcadminComment;

  /** 郵便入力者情報. */
  private TblUser inputUserInfo;

  /** 郵便会社情報. */
  private TblUser userUpdIdInfo;

  /** 郵便会社情報. */
  private TblManager managerInfo;

  /**
   * @brief PC管理入力者情報を取得する.
   * @return inputUserInfo PC管理入力者情報.
   */
  public TblUser getInputUserInfo() {
    return inputUserInfo;
  }

  /**
   * @brief PC管理入力者情報を設定する。
   * @param inputUserInfo PC管理入力者情報
   */
  public void setInputUserInfo(TblUser inputUserInfo) {
    this.inputUserInfo = inputUserInfo;
  }

  /**
   * @brief モデルを取得する。
   * @return pcadminModel
   */
  public String getPcadminModel() {
    return pcadminModel;
  }

  /**
   * @brief モデルを設定する。
   * @param pcadminModel pcadminModel
   */
  public void setPcadminModel(String pcadminModel) {
    this.pcadminModel = pcadminModel;
  }

  /**
   * @brief 管理番号を取得する。
   * @return pcadminSeq
   */
  public String getPcadminSeq() {
    return pcadminSeq;
  }

  /**
   * @brief 管理番号を設定する。
   * @param pcadminSeq pcadminSeq
   */
  public void setPcadminSeq(String pcadminSeq) {
    this.pcadminSeq = pcadminSeq;
  }

  /**
   * @brief IDを取得する。
   * @return pcadminId
   */
  public String getPcadminId() {
    return pcadminId;
  }

  /**
   * @brief IDを設定する。
   * @param pcadminId pcadminId
   */
  public void setPcadminId(String pcadminId) {
    this.pcadminId = pcadminId;
  }

  /**
   * @brief 保有会社を取得する。
   * @return pcadminHoldingCompany
   */
  public int getPcadminHoldingCompany() {
    return pcadminHoldingCompany;
  }

  /**
   * @brief 保有会社を設定する。
   * @param pcadminHoldingCompany pcadminHoldingCompany
   */
  public void setPcadminHoldingCompany(int pcadminHoldingCompany) {
    this.pcadminHoldingCompany = pcadminHoldingCompany;
  }

  /**
   * @brief 保管場所を取得する。
   * @return pcadminHoldingPlace
   */
  public String getPcadminHoldingPlace() {
    return pcadminHoldingPlace;
  }

  /**
   * @brief 保管場所を設定する。
   * @param pcadminHoldingPlace pcadminHoldingPlace
   */
  public void setPcadminHoldingPlace(String pcadminHoldingPlace) {
    this.pcadminHoldingPlace = pcadminHoldingPlace;
  }

  /**
   * @brief 稼働区分を取得する。
   * @return pcadminOpertion
   */
  public String getPcadminOperation() {
    return pcadminOperation;
  }

  /**
   * @brief 稼働区分を設定する。
   * @param pcadminOpertion pcadminOpertion
   */
  public void setPcadminOperation(String pcadminOperation) {
    this.pcadminOperation = pcadminOperation;
  }

  /**
   * @brief 利用者を取得する。
   * @return pcadminUser
   */
  public String getPcadminUser() {
    return pcadminUser;
  }

  /**
   * @brief 利用者を設定する。
   * @param pcadminUser pcadminUser
   */
  public void setPcadminUser(String pcadminUser) {
    this.pcadminUser = pcadminUser;
  }

  /**
   * @brief 前回利用者を取得する。
   * @return pcadminLastUser
   */
  public String getPcadminLastUser() {
    return pcadminLastUser;
  }

  /**
   * @brief 前回利用者を設定する。
   * @param pcadminLastUser pcadminLastUser
   */
  public void setPcadminLastUser(String pcadminLastUser) {
    this.pcadminLastUser = pcadminLastUser;
  }

  /**
   * @brief 種類を取得する。
   * @return pcadminType
   */
  public String getPcadminType() {
    return pcadminType;
  }

  /**
   * @brief 種類を設定する。
   * @param pcadminType pcadminType
   */
  public void setPcadminType(String pcadminType) {
    this.pcadminType = pcadminType;
  }

  /**
   * @brief アカウント名を取得する。
   * @return pcadminAccountName
   */
  public String getPcadminAccountName() {
    return pcadminAccountName;
  }

  /**
   * @brief アカウント名を設定する。
   * @param pcadminAccountName pcadminAccountName
   */
  public void setPcadminAccountName(String pcadminAccountName) {
    this.pcadminAccountName = pcadminAccountName;
  }

  /**
   * @brief パスワードを取得する。
   * @return pcadminPassword
   */
  public String getPcadminPassword() {
    return pcadminPassword;
  }

  /**
   * @brief パスワードを設定する。
   * @param pcadminPassword pcadminPassword
   */
  public void setPcadminPassword(String pcadminPassword) {
    this.pcadminPassword = pcadminPassword;
  }

  /**
   * @brief メーカーを取得する。
   * @return pcadminMaker
   */
  public String getPcadminMaker() {
    return pcadminMaker;
  }

  /**
   * @brief メーカーを設定する。
   * @param pcadminMaker pcadminMaker
   */
  public void setPcadminMaker(String pcadminMaker) {
    this.pcadminMaker = pcadminMaker;
  }

  /**
   * @brief 型番を取得する。
   * @return pcadminModelNum
   */
  public String getPcadminModelNum() {
    return pcadminModelNum;
  }

  /**
   * @brief 型番を設定する。
   * @param pcadminModelNum pcadminModelNum
   */
  public void setPcadminModelNum(String pcadminModelNum) {
    this.pcadminModelNum = pcadminModelNum;
  }

  /**
   * @brief MACアドレス(イーサネット用)を取得する。
   * @return pcadminEthernet
   */
  public String getPcadminEthernet() {
    return pcadminEthernet;
  }

  /**
   * @brief MACアドレス(イーサネット用)を設定する。
   * @param pcadminEthernet pcadminEthernet
   */
  public void setPcadminEthernet(String pcadminEthernet) {
    this.pcadminEthernet = pcadminEthernet;
  }

  /**
   * @brief MACアドレス(無線LAN用)を取得する。
   * @return pcadminWifiAddress
   */
  public String getPcadminWifiAddress() {
    return pcadminWifiAddress;
  }

  /**
   * @brief MACアドレス(無線LAN用)を設定する。
   * @param pcadminWifiAddress pcadminWifiAddress
   */
  public void setPcadminWifiAddress(String pcadminWifiAddress) {
    this.pcadminWifiAddress = pcadminWifiAddress;
  }

  /**
   * @brief CPUを取得する。
   * @return pcadminCpu
   */
  public String getPcadminCpu() {
    return pcadminCpu;
  }

  /**
   * @brief CPUを設定する。
   * @param pcadminCpu pcadminCpu
   */
  public void setPcadminCpu(String pcadminCpu) {
    this.pcadminCpu = pcadminCpu;
  }

  /**
   * @brief メモリを取得する。
   * @return pcadminMemory
   */
  public String getPcadminMemory() {
    return pcadminMemory;
  }

  /**
   * @brief メモリを設定する。
   * @param pcadminMemory pcadminMemory
   */
  public void setPcadminMemory(String pcadminMemory) {
    this.pcadminMemory = pcadminMemory;
  }

  /**
   * @brief ハードディスクを取得する。
   * @return pcadminHardDisk
   */
  public String getPcadminHardDisk() {
    return pcadminHardDisk;
  }

  /**
   * @brief ハードディスクを設定する。
   * @param pcadminHardDisk pcadminHardDisk
   */
  public void setPcadminHardDisk(String pcadminHardDisk) {
    this.pcadminHardDisk = pcadminHardDisk;
  }

  /**
   * @brief インストールメディアを取得する。
   * @return pcadminInstallMedia
   */
  public String getPcadminInstallMedia() {
    return pcadminInstallMedia;
  }

  /**
   * @brief インストールメディアを設定する。
   * @param pcadminInstallMedia pcadminInstallMedia
   */
  public void setPcadminInstallMedia(String pcadminInstallMedia) {
    this.pcadminInstallMedia = pcadminInstallMedia;
  }

  /**
   * @brief セキュリティソフトを取得する。
   * @return pcadminSecuritySoft
   */
  public String getPcadminSecurtySoft() {
    return pcadminSecuritySoft;
  }

  /**
   * @brief セキュリティソフトを設定する。
   * @param pcadminSecuritySoft pcadminSecurtySoht
   */
  public void setPcadminSecuritySoft(String pcadminSecuritySoft) {
    this.pcadminSecuritySoft = pcadminSecuritySoft;
  }

  /**
   * @brief Officeを取得する。
   * @return pcadminOffice
   */
  public String getPcadminOffice() {
    return pcadminOffice;
  }

  /**
   * @brief Officeを設定する。
   * @param pcadminOffice pcadminOffice
   */
  public void setPcadminOffice(String pcadminOffice) {
    this.pcadminOffice = pcadminOffice;
  }

  /**
   * @brief プロダクトキーを取得する。
   * @return pcadminProductKey
   */
  public String getPcadminProductKey() {
    return pcadminProductKey;
  }

  /**
   * @brief プロダクトキーを設定する。
   * @param pcadminProductKey pcadminProductKey
   */
  public void setPcadminProductKey(String pcadminProductKey) {
    this.pcadminProductKey = pcadminProductKey;
  }

  /**
   * @brief 形態を取得する。
   * @return pcadminForm
   */
  public String getPcadminForm() {
    return pcadminForm;
  }

  /**
   * @brief 形態を設定する。
   * @param pcadminForm pcadminForm
   */
  public void setPcadminForm(String pcadminForm) {
    this.pcadminForm = pcadminForm;
  }

  /**
   * @brief 返却日を取得する。
   * @return pcadminRetDt
   */
  public String getPcadminRetDt() {
    return pcadminRetDt;
  }

  /**
   * @brief 返却日を設定する。
   * @param pcadminRetDt pcadminRetDt
   */
  public void setPcadminRetDt(String pcadminRetDt) {
    this.pcadminRetDt = pcadminRetDt;
  }

  /**
   * @brief 購入日を取得する。
   * @return pcadminPurchaseDate
   */
  public String getPcadminPurchaseDate() {
    return pcadminPurchaseDate;
  }

  /**
   * @brief 購入日を設定する。
   * @param pcadminPurchaseDate pcadminPurchaseDate
   */
  public void setPcadminPurchaseDate(String pcadminPurchaseDate) {
    this.pcadminPurchaseDate = pcadminPurchaseDate;
  }

  /**
   * @brief 登録者を取得する。
   * @return pcadminRegId
   */
  public String getPcadminRegId() {
    return pcadminRegId;
  }

  /**
   * @brief 登録者を設定する。
   * @param pcadminRegId pcadminRegId
   */
  public void setPcadminRegId(String pcadminRegId) {
    this.pcadminRegId = pcadminRegId;
  }

  /**
   * @brief 登録日を取得する。
   * @return pcadminRegDt
   */
  public String getPcadminRegDt() {
    return pcadminRegDt;
  }

  /**
   * @brief 登録日を設定する。
   * @param pcadminRegDt pcadminRegDt
   */
  public void setPcadminRegDt(String pcadminRegDt) {
    this.pcadminRegDt = pcadminRegDt;
  }

  /**
   * @brief 修正者を取得する。
   * @return pcadminUpdId
   */
  public String getPcadminUpdId() {
    return pcadminUpdId;
  }

  /**
   * @brief 修正者を設定する。
   * @param pcadminUpdId pcadminUpdId
   */
  public void setPcadminUpdId(String pcadminUpdId) {
    this.pcadminUpdId = pcadminUpdId;
  }

  /**
   * @brief 修正日を取得する。
   * @return pcadminUpdDt
   */
  public String getPcadminUpdDt() {
    return pcadminUpdDt;
  }

  /**
   * @brief 修正日を設定する。
   * @param pcadminUpdDt pcadminUpdDt
   */
  public void setPcadminUpdDt(String pcadminUpdDt) {
    this.pcadminUpdDt = pcadminUpdDt;
  }

  /**
   * @brief 使用場所を取得する。
   * @return pcadminUsePlace
   */
  public String getPcadminUsePlace() {
    return pcadminUsePlace;
  }

  /**
   * @brief 使用場所を設定する。
   * @param pcadminUsePlace pcadminUsePlace
   */
  public void setPcadminUsePlace(String pcadminUsePlace) {
    this.pcadminUsePlace = pcadminUsePlace;
  }

  /**
   * @brief OSを取得する。
   * @return pcadminOs
   */
  public String getPcadminOs() {
    return pcadminOs;
  }

  /**
   * @brief OSを設定する。
   * @param pcadminOs pcadminOs
   */
  public void setPcadminOs(String pcadminOs) {
    this.pcadminOs = pcadminOs;
  }

  /**
   * @brief 備考を取得する。
   * @return pcadminComment
   */
  public String getPcadminComment() {
    return pcadminComment;
  }

  /**
   * @brief 備考を設定する。
   * @param pcadminComment pcadminComment
   */
  public void setPcadminComment(String pcadminComment) {
    this.pcadminComment = pcadminComment;
  }

  /**
   * @brief ユーザー名を取得する。
   * @return userUpdIdInfo
   */
  public TblUser getUserUpdIdInfo() {
    return userUpdIdInfo;
  }

  /**
   * @brief ユーザー名を設定する。
   * @param userUpdIdInfo userUpdIdInfo
   */
  public void setUserUpdIdInfo(TblUser userUpdIdInfo) {
    this.userUpdIdInfo = userUpdIdInfo;
  }

  /**
   * @brief 会社名を取得する。
   * @return managerInfo
   */
  public TblManager getManagerInfo() {
    return managerInfo;
  }

  /**
   * @brief 会社名を設定する。
   * @param managerInfo managerInfo
   */
  public void setManagerInfo(TblManager managerInfo) {
    this.managerInfo = managerInfo;
  }

  @Override
  public String toString() {
    return "TblPcadmin [pcadminSeq=" + pcadminSeq + ", pcadminId=" + pcadminId + ", pcadminHoldingPlace=" + pcadminHoldingPlace
        + ", pcadminOperation=" + pcadminOperation + ", pcadminType=" + pcadminType + ", pcadminMaker=" + pcadminMaker
        + ", inputUserInfo =" + inputUserInfo + ", userUpdIdInfo =" + userUpdIdInfo + ", pcadminUser=" + pcadminUser
        +  ", pcadminHoldingCompany=" + pcadminHoldingCompany + ", pcadminLastUser=" + pcadminLastUser + ", pcadminAccountName=" + pcadminAccountName
        + ", pcadminPassword=" + pcadminPassword + ", pcadminModel=" + pcadminModel + ", pcadminModelNum=" + pcadminModelNum
        + ", pcadminEthernet=" + pcadminEthernet + ", pcadminWifiAddress=" + pcadminWifiAddress + ", pcadminCpu=" + pcadminCpu
        + ", pcadminMemory=" + pcadminMemory + ", pcadminHardDisk=" + pcadminHardDisk + ", pcadminInstallMedia=" + pcadminInstallMedia
        + ", pcadminSecuritySoft=" + pcadminSecuritySoft + ", pcadminOffice=" + pcadminOffice + ", pcadminProductKey=" + pcadminProductKey
        + ", pcadminForm=" + pcadminForm + ", pcadminRetDt=" + pcadminRetDt + ", pcadminPurchaseDate=" + pcadminPurchaseDate
        + ", pcadminRegId=" + pcadminRegId + ", pcadminRegDt=" + pcadminRegDt + ", pcadminUpdId=" + pcadminUpdId + ", managerInfo =" + managerInfo
        + ", pcadminUpdDt=" + pcadminUpdDt + ", pcadminUsePlace=" + pcadminUsePlace + ", pcadminOse=" + pcadminOs + ", pcadminComment=" + pcadminComment + "]";
  }

}