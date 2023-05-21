import 'dart:convert';
import 'package:epus_on/kategori/python/model/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _basUrl = 'https://6462e0c14dca1a66134fb563.mockapi.io/python';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_basUrl));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Piton> piton = it.map((e) => Piton.fromJson(e)).toList();
        return piton;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
