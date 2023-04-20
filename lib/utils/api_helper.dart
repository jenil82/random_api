import 'dart:convert';

import 'package:http/http.dart' as http;

import '../screen/home/model/model_.dart';



class ApiHelper
{

  Future<RandomPerson?> randomPersonApi()
  async {
    Uri apiUri = Uri.parse("https://randomuser.me/api/");
    var response = await http.get(apiUri);
    var randomPersonJson = jsonDecode(response.body);

    return RandomPerson.fromJson(randomPersonJson);
  }

}
