import 'package:epus_on/model/model.dart';
import 'package:epus_on/model/repository.dart';
import 'package:flutter/material.dart';

class ListSearch extends StatefulWidget {
  const ListSearch({super.key});

  @override
  State<ListSearch> createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
  List<Buku> listBuku = [];
  List<Buku> cari = [];

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

  TextEditingController controller = TextEditingController();

  onSearch(String text) async {
    cari.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    listBuku.forEach((Buku) {
      if (Buku.judul.contains(text)) cari.add(Buku);
    });
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
            onChanged: onSearch,
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
      body: Center(
        child: cari.length != 0 || controller.text.isNotEmpty
            ? ListView.builder(
                itemCount: cari.length,
                itemBuilder: (context, index) {
                  final b = listBuku[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 1),
                    child: ListTile(
                      leading: Image.network(b.cover),
                      title: Text(b.judul),
                    ),
                  );
                },
              )
            : ListView.builder(
                itemCount: listBuku.length,
                itemBuilder: (context, index) {
                  final a = listBuku[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 1),
                    child: ListTile(
                      leading: Image.network(a.cover),
                      title: Text(a.judul),
                    ),
                  );
                }),
      ),
    );
  }
}
