import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  Profil({super.key, required this.nama, required this.email});

  final String nama;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1)),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('img/profil.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white),
                          color: Colors.blue,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              TextField(decoration: InputDecoration(
                hintText: nama,
                hintStyle: TextStyle(color: Colors.black),
                suffixIcon: Icon(
                  Icons.edit,
                  color: Colors.teal,
                  ),
                ),
              ), 
              Padding(padding: EdgeInsets.all(15.0)),    
              TextField(decoration: InputDecoration(
                hintText: email,
                hintStyle: TextStyle(color: Colors.black),
                suffixIcon: Icon(
                  Icons.edit,
                  color: Colors.teal,
                  ),
                ),
              ),     
            ],
          ),
        ),
      ),
    );
  }
}
