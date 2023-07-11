import 'dart:convert';
import 'package:epus_on/pencarian/api_service.dart';
import 'detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late List<Book> books;
  late List<Book> filteredBooks;

  @override
  void initState() {
    super.initState();
    books = [];
    filteredBooks = [];
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final response = await http
        .get(Uri.parse('https://6434db7583a30bc9ad527d33.mockapi.io/buku'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        books = jsonData.map((item) => Book.fromJson(item)).toList();
        filteredBooks = books;
      });
    } else {
      throw Exception('gagal mengambil buku');
    }
  }

  void filterBooks(String query) {
    setState(() {
      filteredBooks = books
          .where((book) =>
              book.judul.toLowerCase().contains(query.toLowerCase()) ||
              book.pengarang.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _navigateToBookDetail(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Detail(book: book),
      ),
    );
  }

  Widget _buildBookCard(Book book) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: Image.network(book.cover),
        title: Text(
          book.judul,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(book.pengarang),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          _navigateToBookDetail(context, book);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Buku'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => filterBooks(value),
              decoration: InputDecoration(
                labelText: 'Cari Buku',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (BuildContext context, int index) {
                final book = filteredBooks[index];
                return _buildBookCard(book);
              },
            ),
          ),
        ],
      ),
    );
  }
}
