import 'package:epus_on/kategori/clases/clases_detail.dart';
import 'package:epus_on/kategori/clases/model/model.dart';
import 'package:epus_on/kategori/clases/model/repository.dart';
import 'package:flutter/material.dart';

class ClasesView extends StatefulWidget {
  const ClasesView({super.key});

  @override
  State<ClasesView> createState() => _ClasesViewState();
}

class _ClasesViewState extends State<ClasesView> {
  List<Clases> listClases = [];
  Repository repository = Repository();

  getData() async {
    listClases = await repository.getData();
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
      appBar: AppBar(
        title: const Text('C++'),
      ),
      body: Column(
        children: [
          Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 8.0),
                      itemCount: listClases.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  ClasesDetail(model: listClases[index])));
                          },
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Hero(
                                    tag: listClases[index].id,
                                    child: Image.network(
                                      listClases[index].cover,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  listClases[index].judul,
                                  style: const TextStyle(fontSize: 15.0),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
        ],
      ),
    );
  }
}