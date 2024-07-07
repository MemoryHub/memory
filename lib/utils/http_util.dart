import 'package:dio/dio.dart';
import 'package:memory/utils/preference_util.dart';
import 'package:memory/utils/toast_util.dart';

enum HttpType { GET, POST }

class HttpUtil {
  final Map<String, Object> _param;
  final String _url;
  bool successful = false;
  bool reLogin = false;
  bool needRefresh = false;
  Dio _dio = new Dio();

  HttpUtil(this._url, this._param) {
    // ignore: unnecessary_null_comparison
    if (_dio == null) {
      _dio = new Dio();
    }
  }

  getResponseMap(HttpType type) async {
    needRefresh = false;
    Response response;
    if (type == HttpType.GET) {
      response = await _get();
    } else if (type == HttpType.POST) {
      response = await _post();
    } else {
      // 为之后其他请求做准备
      response = await _post();
    }
    return response.data;
  }

  _post() async {
    try {
      await setHeader();
      Response response = await _dio.post(_url, data: _param);
      return response;
    } catch (e) {
      ToastUtil.error();
      print('http:---postCatch:' + e.toString());
    }
  }

  _get() async {
    await setHeader();
    Response response;
    response = await _dio.get(
      _url,
      queryParameters: _param,
    );
    return response;
  }

  setHeader() async {
    String accessToken = await PreferenceHelper.getAccessToken();
    _dio.options.headers['Authorization'] = 'Bearer $accessToken';
  }
}
