import 'dart:convert';

import 'package:http/http.dart' as http;

class GetApi {
  String _bashUrl = 'https://bmc.guide.siqware.com/api/';

  getApi(String api) async {
    http.Response response = await http.get(_bashUrl + api);
    return json.decode(response.body);
  }
}