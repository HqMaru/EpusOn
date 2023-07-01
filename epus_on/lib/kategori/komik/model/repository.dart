import 'dart:convert';
import 'package:epus_on/kategori/komik/model/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _basUrl = 'https://64929bda428c3d2035d0563e.mockapi.io/buku';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_basUrl));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Komik> komik = it.map((e) => Komik.fromJson(e)).toList();
        return komik;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
