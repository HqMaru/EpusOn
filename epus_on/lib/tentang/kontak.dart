import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Kontak extends StatelessWidget {
  const Kontak({super.key});

  final String email = 'rahul300800@gmail.com';
  final String whatsappNumber = '+6281287413255';
  final String instagramUsername = 'sutanna_r.b';

  _launchEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: '',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Tidak Bisa Menampilkan Halaman InI $url';
    }
  }

  _launchWhatsApp() async {
    String url = 'https://wa.me/$whatsappNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Tidak Bisa Menampilkan Halaman InI $url';
    }
  }

  _launchInstagram() async {
    String url = 'https://www.instagram.com/$instagramUsername';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Tidak Bisa Menampilkan Halaman InI $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak Kami'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/logo1.png', width: 200, height: 200),
            InkWell(
              onTap: _launchEmail,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://i.imgur.com/K9nFH3s.jpg',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Email: $email',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: _launchWhatsApp,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://i.imgur.com/N69IWPW.jpg',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'WhatsApp: $whatsappNumber',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: _launchInstagram,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://i.imgur.com/6N1pkNl.jpg',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Instagram: $instagramUsername',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
