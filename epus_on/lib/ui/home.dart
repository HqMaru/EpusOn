import 'package:epus_on/model/model.dart';
import 'package:epus_on/model/repository.dart';
import 'package:epus_on/Buku/detail.dart';
import 'package:epus_on/ui/list_search.dart';
import 'package:epus_on/ui/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'search_buku.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Buku> listBuku = [];
  Repository repository = Repository();
  final List<String> imgList = [
    'https://i.imgur.com/92hqCh5.jpg',
    'https://i.imgur.com/jHJZldg.jpg',
    'https://i.imgur.com/KbehDhQ.jpg',
    'https://i.imgur.com/nb7FIPV.png'
  ];

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
      appBar: AppBar(title: const Text('Epus_On'), actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const ListSearch())),
        ),
      ]),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imgList
                .map((item) => Container(
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.network(item,
                                    fit: BoxFit.cover, width: 1000.0),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ))
                .toList(),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10.0)),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 8.0),
                  itemCount: listBuku.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Detail(model: listBuku[index])));
                      },
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Expanded(
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
          ),
        ],
      ),
    );
  }
}
