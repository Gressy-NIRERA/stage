import 'package:dio/dio.dart';

class Api {
  final baseurl = 'https://client.duma.africa/api/v1';
  late final Dio dio;
  Api(this.dio);

  Future<Map<String, dynamic>> userlogin(String email, String password) async {
    final reponse = await dio.post(
      '$baseurl/user/login',
      data: {"email": email, "password": password},
    );
    return reponse.data;
  }

  Future<Map<String, dynamic>> register(
    String firstname,
    String lastname,
    int phonenumber,
    String email,
    String counrty,
    String password,
    String confirm_password,
  ) async {
    final response = await dio.post(
      '$baseurl/user/register',
      data: {
        "firstname": firstname,
        "lastname": lastname,
        "phonenumber": phonenumber,
        "email": email,
        "password": password,
        "confirm_password": confirm_password,
      },
    );
    return response.data;

  }
}
