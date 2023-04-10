import 'package:flutter/material.dart';

class Buku extends StatelessWidget {
  const Buku({super.key});

  @override
  Widget build(BuildContext context) {
    final List buku = [
      {"judul": "Panduan Belajar Html", "gambar": "assets/img/belajarhtml.jpg"},
      {
        "judul": "Inspirasi Codeigniter",
        "gambar": "assets/img/codeigniter.jpg"
      },
      {"judul": "Belajar JavaScirpt", "gambar": "assets/img/javascript.jpg"},
      {"judul": "Naruto", "gambar": "assets/img/naruto.jpg"},
      {"judul": "Marvel Comic 1000", "gambar": "assets/img/marvel.jpg"},
      {"judul": "Dilan 1990", "gambar": "assets/img/dilan.jpg"},
    ];

    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10.0),
        itemCount: buku.length,
        itemBuilder: (context, i) {
          final x = buku[i];
          return Card(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    x['gambar'],
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  x['judul'],
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
