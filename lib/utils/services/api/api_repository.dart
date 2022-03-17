import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../constants/api_path.dart';
import 'api_services.dart';




class ApiRepository {

  Future fetchEmployeeDetails() async {
    RestAPIService restAPIService = RestAPIService(Dio());

     var result = await restAPIService.getService(
        url: App24UserAppAPI.getEmployeeDetailsUrl );

    return result;
  }






}
