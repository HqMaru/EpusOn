import 'package:epus_on/tentang/contact_us.dart';
import 'package:epus_on/tentang/tentang_kami.dart';
import 'package:epus_on/ui/home.dart';
import 'package:flutter/material.dart';
import '../profil/profil.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('', style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/img/profil.jpg'),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/desain1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text('Perpustakaan'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profil'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Profil()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Kontak Kami'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ContactUsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.supervisor_account),
            title: const Text('Tentang kami'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TentangKami()));
            },
          ),
        ],
      ),
    );
  }
}
