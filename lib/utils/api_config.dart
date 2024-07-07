class APIConfig{
  // static const String BASE_URL = "http://123.206.46.154/api";
  static const String BASE_URL = "http://localhost:2283/api";

  // 根据关键字搜索图片或视频
  static const String SEARCH_METADATA = BASE_URL + "/search/metadata";

  // 登录
  static const String LOGIN = BASE_URL + "/auth/login";

  // 获取图片
  static const String GET_IMAGE = BASE_URL + "/assets/";

}