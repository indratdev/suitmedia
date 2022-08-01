import 'package:suitmedia/datas/palindrome.dart';
import 'package:suitmedia/datas/usermodel.dart';
import 'package:suitmedia/repository/apiprovider.dart';

class Repository {
  final palindrome = Palindrome();
  final api = ApiProvider();

  bool CheckIsPalindrome(String value) {
    return palindrome.isPanlindrome(value);
  }

  Future<UserModel> GetUserList() {
    return api.GetUserListRegresIn();
  }
}
