import 'dart:convert';

import 'package:epus_on/model/model.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';

class Repository {
  final _basUrl = 'https://6434db7583a30bc9ad527d33.mockapi.io/buku';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_basUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Buku> buku = it.map((e) => Buku.fromJson(e)).toList();
        return buku;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
