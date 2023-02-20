import 'dart:convert';
import 'package:getx_api/model/user_model.dart';
import 'package:http/http.dart' as http;
class ApiGet {
  List<Users> getUser = [];
  Future<List<Users>> getData() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      List dataMain = data['data'];

      getUser = dataMain.map((e) => Users.fromJson(e)).toList();
    }
    return getUser;
  }
}