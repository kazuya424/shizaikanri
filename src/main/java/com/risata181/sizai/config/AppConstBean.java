package com.risata181.sizai.config;

/**
 * @brief 定数定義クラス。
 * @class AppConstBean
 *
 */
public class AppConstBean {

  // CoTopComponentで使用する値

  /** application.propertiesのパス */
  public static final String APP_CONFIG_PROPERTIES_PATH = "classpath:application.properties";

  // このクラス内で使用する値

  /** application.propertiesのパス */
  public static final String APP_COMPONENT_SCAN_PACKAGE = "com.risata181.sizai";

  // WebInitializerで使用する値

  /** サーブレット名 */
  public static final String APP_SERVLET_NAME = "dispatcher";
  /** サーブレットマッピング */
  public static final String APP_SERVLET_MAPPING = "/";
  /** マルチパートの場所 */
  public static final String APP_MULTIPART_LOCATION = null;
  /** マルチパートの最大サイズ */
  public static final long APP_MULTIPART_MAX_FILE_SIZE = 2000L * 1024L * 1024L;
  /** マルチパートの最大サイズ */
  public static final long APP_MULTIPART_MAX_REQUEST_SIZE = 2000L * 1024L * 1024L;
  /** マルチパートファイルサイズ制限 */
  public static final int APP_MULTIPART_FILE_SIZE_THRES_HOLE = 1000000;
  /** エンコーディング */
  public static final String APP_ENCODING = "UTF-8"; // Web Application encoding

  // SessionListenerで使用する値

  /** セッションタイムアウト */
  public static final int APP_SESSION_TIMEOUT = 180 * 60;

  // WebConfigで使用する値

  /** リソースの場所 */
  public static final String RESOURCE_LOCATIONS = "/resources/";
  /** ビューリゾルバのプリフィックス */
  public static final String VIEW_PREFIX = "/WEB-INF/views/";
  /** ビューリゾルバのサフィックス */
  public static final String VIEW_SUFFIX = ".jsp";
  /** tiles.xmlの場所 */
  public static final String[] TILES_LAYOUT_XML_PATH_PATTERN = {"WEB-INF/views/tiles.xml"};

}
