import 'package:epus_on/model/model.dart';
import 'package:epus_on/model/repository.dart';
import 'package:flutter/material.dart';

class ListSearch extends StatefulWidget {
  const ListSearch({super.key});

  @override
  State<ListSearch> createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
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

  List<String>? ListBuku;

  final FocusNode _textFocusNode = FocusNode();
  final TextEditingController? _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: _textEditingController,
              focusNode: _textFocusNode,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                prefix: Icon(Icons.search),
                hintText: 'Search Here',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
