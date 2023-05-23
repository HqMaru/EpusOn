import 'package:epus_on/kategori/clases/clases_view.dart';
import 'package:epus_on/kategori/html/html_view.dart';
import 'package:epus_on/kategori/javascript/js_view.dart';
import 'package:epus_on/kategori/python/python_view.dart';
import 'package:epus_on/model/model.dart';
import 'package:epus_on/model/repository.dart';
import 'package:epus_on/Buku/detail.dart';
import 'package:epus_on/ui/list_search.dart';
import 'package:epus_on/ui/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Buku> listBuku = [];
  Repository repository = Repository();

  final List<String> imgList = [
    'https://i.imgur.com/j9XPp2d.jpg',
    'https://i.imgur.com/unh2mBH.jpg',
    'https://i.imgur.com/030WIGA.jpg',
    'https://i.imgur.com/HuHccYz.jpg'
  ];

  int _current = 0;
  final CarouselController _controller = CarouselController();

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
        title: const Text('Daftar Buku'),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ListSearch()));
            },
            child: const SizedBox(
              width: 100.0,
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                viewportFraction: 1,
                enlargeCenterPage: true,
                onPageChanged: ((index, reason) {
                  setState(() {
                    _current = index;
                  });
                })),
            items: imgList
                .map((item) => Container(
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
                                ),
                              ),
                            ],
                          )),
                    ))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 6.0, left: 6.0, top: 20.0, bottom: 16.0),
            child: Column(
              children: [
                Wrap(
                  spacing: 35,
                  runSpacing: 8,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PythonView()));
                      },
                      child: const Kategori(
                          title: 'Python', icon: 'assets/img/Python.png'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ClasesView()));
                      },
                      child: const Kategori(
                          title: 'C++', icon: 'assets/img/c.png'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const JsView()));
                      },
                      child: const Kategori(
                          title: 'JavaScript',
                          icon: 'assets/img/JavaScript.png'),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HtmlView()));
                      },
                      child: const Kategori(
                          title: 'Html', icon: 'assets/img/html.png'),
                    ),
                  ],
                )
              ],
            ),
          ),
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

class Kategori extends StatelessWidget {
  const Kategori({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: Stack(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16),
                    // border: Border.all(
                    //     color: Colors.blue, style: BorderStyle.solid),
                  ),
                ),
                Image.asset(
                  icon,
                  height: 55,
                  width: 55,
                ),
              ],
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
