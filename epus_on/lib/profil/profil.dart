import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  File? image;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    image != null
                        ? Image.file(image!)
                        : Container(
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
                              image: const DecorationImage(
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
                        child: InkWell(
                          onTap: () async {
                            await getImage();
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(20.0)),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'nama',
                  hintStyle: TextStyle(color: Colors.black),
                  suffixIcon: Icon(
                    Icons.edit,
                    color: Colors.teal,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(15.0)),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'email',
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
