import 'package:epus_on/pencarian/api_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:epus_on/pencarian/search.dart';

class Detail extends StatefulWidget {
  final Book book;
  // final Book book;
  const Detail({super.key, required this.book});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
      ),
      body: ListView(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(10.0)),
          Hero(
            tag: widget.book.id,
            child: Image.network(
              widget.book.cover,
              width: 130.0,
              height: 270.0,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20.0)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () async {
                    final url = (widget.book.link);

                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue.shade600),
                  child: const Text('Beli')),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10.0)),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.book.pengarang,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.book.judul,
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.book.tgl_terbit,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ExpansionTile(
            title: const Text('Ringkasan'),
            children: [
              ListTile(
                title: Text(widget.book.deskripsi),
              ),
            ],
            onExpansionChanged: (isExpanded) {
              print('Expanded: $isExpanded');
            },
          )
        ],
      ),
    );
  }
}
