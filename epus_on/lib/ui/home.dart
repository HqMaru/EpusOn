import 'package:epus_on/ui/daftar_buku.dart';
import 'package:epus_on/ui/side_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text('Epus On'),
      ),
      body: Column(
        children: <Widget>[
          Buku(),
        ],
      ),
    );
  }
}
