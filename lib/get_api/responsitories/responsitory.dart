import 'package:http/http.dart' as http;

class Repository {

  String _baseUrl = "https://bmc.guide.siqware.com/api/";

  httpGet(String api) async {
    return await http.get(_baseUrl + api);
  }
}