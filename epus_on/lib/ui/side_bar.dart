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
          UserAccountsDrawerHeader(
            accountName: Text('HqMaru'),
            accountEmail: Text('rsutanna@gmail.com'),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/library.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Perpustakaan'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profil'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Profil(nama: 'HqMaru', email: 'rsutanna@gmail.com',)));
            },
          ),
          ListTile(
            leading: Icon(Icons.supervisor_account),
            title: Text('Tentang kami'),
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
