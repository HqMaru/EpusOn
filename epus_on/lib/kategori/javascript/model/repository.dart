import 'dart:convert';
import 'package:epus_on/kategori/javascript/model/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _basUrl = 'https://6462fba47a9eead6fadacf33.mockapi.io/javascript';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_basUrl));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Js> js = it.map((e) => Js.fromJson(e)).toList();
        return js;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
