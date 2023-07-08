import 'package:epus_on/kategori/javascript/js_detail.dart';
import 'package:epus_on/kategori/javascript/model/model.dart';
import 'package:epus_on/kategori/javascript/model/repository.dart';
import 'package:flutter/material.dart';


class JsView extends StatefulWidget {
  const JsView({super.key});

  @override
  State<JsView> createState() => _JsViewState();
}

class _JsViewState extends State<JsView> {
  List<Js> listJs = [];
  Repository repository = Repository();

  getData() async {
    listJs = await repository.getData();
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
        title: const Text('JavaScript'),
      ),
      body: Column(
        children: [
          Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 8.0),
                      itemCount: listJs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  JsDetail(model: listJs[index])));
                          },
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Hero(
                                    tag: listJs[index].id,
                                    child: Image.network(
                                      listJs[index].cover,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  listJs[index].judul,
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