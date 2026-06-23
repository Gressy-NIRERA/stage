

import 'package:dio/dio.dart';

class Api{
  final baseurl = 'https://client.duma.africa/api/v1';
   late final Dio dio;
   Api(this.dio);
   Future<Map<String , dynamic>> userlogin(String email , String password) async {
    final reponse = await dio.post(
      '$baseurl/user/login',
      data: {
        "email": email,
        "password": password
      }
    );
    return reponse.data;
   }


}