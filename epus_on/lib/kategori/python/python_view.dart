import 'package:epus_on/kategori/python/model/model.dart';
import 'package:epus_on/kategori/python/model/repository.dart';
import 'package:epus_on/kategori/python/python_detail.dart';
import 'package:flutter/material.dart';


class PythonView extends StatefulWidget {
  const PythonView({super.key});

  @override
  State<PythonView> createState() => _PythonViewState();
}

class _PythonViewState extends State<PythonView> {
  List<Piton> listpiton = [];
  Repository repository = Repository();

  getData() async {
    listpiton = await repository.getData();
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
        title: const Text('Python'),
      ),
      body: Column(
        children: [
          Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 8.0),
                      itemCount: listpiton.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  PythonDetail(model: listpiton[index])));
                          },
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Hero(
                                    tag: listpiton[index].id,
                                    child: Image.network(
                                      listpiton[index].cover,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  listpiton[index].judul,
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