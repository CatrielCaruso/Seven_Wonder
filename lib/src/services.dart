import 'package:http/http.dart' as http;

import 'dart:async';

import 'package:seven_wonder/src/model/modelWonder.dart';

String url = 'http://www.json-generator.com/api/json/get/cfMiozZbQO?indent=2';

Future<List<Wonder>> getWonder() async {
  final resp = await http.get(url);

  return wonderFromJson(resp.body);
}
