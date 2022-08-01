import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suitmedia/datas/usermodel.dart';

class ApiProvider {
  Future<UserModel> GetUserListRegresIn() async {
    Uri url = Uri.parse("https://reqres.in/api/users?page=2");
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    return UserModel.fromJson(result);
  }
}
