import 'package:http/http.dart' as http;
import 'package:invoice/models/http_test.dart';

// const List<String> url = [
//   'https://reqres.in/api/users?page=2',
//   "https://192.168.55.100:1150/api/invoice/goods"
// ];

class ConnectAPI {
  ConnectAPI._();
  static List<String> url = [
    'https://reqres.in/api/users?page=2',
    "https://192.168.55.100:1150/api/invoice/goods"
  ];

  static getTest() async {
    var response = await http.get(url[0]);
    if (response.statusCode == 200) {
      var result = userTestFromJson(response.body);
      return result;
    } else {
      throw Exception('Failed to load invoice tools');
    }
  }

  static postTest() async {
    var response = await http.post(url[0], body: null); // body need JSON form
    if (response.statusCode == 200) {
      var result = userTestFromJson(response.body);
      return result;
    } else {
      throw Exception('Failed to load invoice tools');
    }
  }
}
