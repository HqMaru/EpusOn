import 'package:epus_on/model/model.dart';
import 'package:epus_on/model/repository.dart';
import 'package:flutter/material.dart';

class Perpus extends StatefulWidget {
  const Perpus({super.key});

  @override
  State<Perpus> createState() => _PerpusState();
}

class _PerpusState extends State<Perpus> {
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
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        mainAxisSpacing: 8.0
        ),
        itemCount: listBuku.length, 
        itemBuilder: (context, index) {
          final x = listBuku[index];
          return Card(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    listBuku[index].cover,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  listBuku[index].judul,
                  style: TextStyle(fontSize: 15.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
