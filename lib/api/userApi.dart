import 'package:flutter_admin/models/responseBodyApi.dart';
import 'package:flutter_admin/utils/httpUtil.dart';

class UserApi {
  static Future<ResponseBodyApi> register(data) async {
    ResponseBodyApi responseBodyApi = await HttpUtil.post('/user/register', data: data, requestToken: false);
    return responseBodyApi;
  }

  static Future<ResponseBodyApi> login(data) async {
    // String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
    ResponseBodyApi responseBodyApi = await HttpUtil.post('/user/login', data: data, requestToken: false);
    return responseBodyApi;
  }
}
