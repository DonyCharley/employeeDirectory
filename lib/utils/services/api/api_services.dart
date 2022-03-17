import 'package:dio/dio.dart';
import '../../../constants/api_path.dart';
import 'api_exceptions.dart';

class RestAPIService {
  final Dio _dio;

  RestAPIService(this._dio);




  getService({required String url, useToken = true}) async {
   
    String fetchUrl;
    try {


      if (url.contains("http")) {
        fetchUrl = url;
      } else {
        fetchUrl = App24UserAppAPI.baseUrl + url;
      }

      var response = await _dio.get(fetchUrl);
      return response.data;
    } on DioError catch (dioError) {

      throw RestAPIException.fromDioError(dioError);
    }
  }


}
