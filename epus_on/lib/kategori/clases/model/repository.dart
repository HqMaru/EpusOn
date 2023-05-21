import 'dart:convert';
import 'package:epus_on/kategori/clases/model/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _basUrl = 'https://6462e0c14dca1a66134fb563.mockapi.io/chas';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_basUrl));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Clases> clases = it.map((e) => Clases.fromJson(e)).toList();
        return clases;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
