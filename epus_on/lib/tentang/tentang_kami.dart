import 'package:epus_on/tentang/kontak.dart';
import 'package:flutter/material.dart';

class TentangKami extends StatelessWidget {
  const TentangKami({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Kami'),
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
                  child: Image.asset('assets/img/logo1.png',
                      width: 200, height: 200)),
              const Text(
                'Epus ON',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              const Text(
                'Aplikasi katalog buku, untuk memudahkan anda mencari buku yang anda inginkan secara cepat dan tepat',
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Kontak()));
                  },
                  child: const Text(
                    'HUBUNGI KAMI',
                    style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const Text(
                'v1.0.',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
