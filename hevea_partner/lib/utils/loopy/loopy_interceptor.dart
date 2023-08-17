import 'package:hevea_core/utilis/logger/extensions.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoopyApiInterceptor implements InterceptorContract {
  static InterceptedClient loopyClient = InterceptedClient.build(interceptors: [
    LoopyApiInterceptor(),
  ]);
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      data.headers['Content-Type'] = 'application/json';
      data.headers['Accept'] = 'application/json, text/plain, */*';
      data.headers['User-Agent'] = 'Loopy Loyalty Scanner iOS v2.0.4';
    } catch (e) {
      e.logException();
      rethrow;
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
