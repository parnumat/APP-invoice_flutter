import 'package:http/http.dart' as http;
import 'package:invoice/models/http_test.dart';

const List<String> url = [
  'https://reqres.in/api/users?page=2',
  "https://192.168.55.100:1150/api/invoice/goods"
];

class ConnectAPI {
  ConnectAPI._();
  static getTest() async {
    var response = await http.get(url[0]);
    if (response.statusCode == 200) {
      var result = userTestFromJson(response.body);
      return result;
    } else {
      throw Exception('Failed to load invoice tools');
    }
  }
}
