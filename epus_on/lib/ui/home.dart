import 'package:epus_on/model/model.dart';
import 'package:epus_on/model/repository.dart';
import 'package:epus_on/perpus/detail.dart';
import 'package:epus_on/ui/side_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text('Epus On'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 8.0),
            itemCount: listBuku.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context)=> Detail(model: listBuku[index])));
                },
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Expanded   (
                        child: Hero(
                          tag: listBuku[index].id,
                          child: Image.network(
                            listBuku[index].cover,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(5)),
                      Text(
                        listBuku[index].judul,
                        style: const TextStyle(fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
