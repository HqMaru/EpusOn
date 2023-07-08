import 'package:epus_on/Buku/detail.dart';
import 'package:epus_on/model/model.dart';
import 'package:epus_on/model/repository.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = TextEditingController();
  List<Buku> listBuku = [];

  Repository repository = Repository();

  getData() async {
    listBuku = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: SizedBox(
          height: 38,
          child: TextField(
            controller: controller,
            onChanged: cariBuku,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search',
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none)),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          final buku = listBuku[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 1),
            child: ListTile(
              leading: Image.network(buku.cover),
              title: Text(buku.judul),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Detail(model: listBuku[index])));
              },
            ),
          );
        },
      ),
    );
  }

  void cariBuku(String query) {
    final suggestion = listBuku.where((Buku) {
      final bukuJudul = Buku.judul.toLowerCase();
      final input = query.toLowerCase();
      return bukuJudul.contains(input);
    }).toList();
    setState(() => listBuku = suggestion);
  }
}
