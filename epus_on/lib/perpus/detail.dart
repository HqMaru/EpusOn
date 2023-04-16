import 'package:epus_on/model/model.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final Buku model;
  const Detail({super.key, required this.model});

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
            tag: widget.model.id,
            child: Image.network(
              widget.model.cover,
              width: 130.0,
              height: 270.0,
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Text(
            widget.model.pengarang,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.model.judul,
            style: const TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(padding: EdgeInsets.all(5.0)),
          SingleChildScrollView(
            child: ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {},
              children: [
                ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return const ListTile(
                      title: Text('Ringkasan'),
                    );
                  },
                  isExpanded: true,
                  body: ListTile(
                    title: Text(widget.model.deskripsi),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
