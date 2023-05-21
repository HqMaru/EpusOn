import 'package:epus_on/kategori/html/html_detail.dart';
import 'package:epus_on/kategori/html/model/model.dart';
import 'package:epus_on/kategori/html/model/repository.dart';
import 'package:flutter/material.dart';

class HtmlView extends StatefulWidget {
  const HtmlView({super.key});

  @override
  State<HtmlView> createState() => _HtmlViewState();
}

class _HtmlViewState extends State<HtmlView> {
  List<Html> listHtml = [];
  Repository repository = Repository();

  getData() async {
    listHtml = await repository.getData();
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
        title: Text('Html & CSS'),
      ),
      body: Column(
        children: [
          Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 8.0),
                      itemCount: listHtml.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  HtmlDetail(model: listHtml[index])));
                          },
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Hero(
                                    tag: listHtml[index].id,
                                    child: Image.network(
                                      listHtml[index].cover,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  listHtml[index].judul,
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