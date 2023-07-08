import 'package:epus_on/tentang/tentang_kami.dart';
import 'package:epus_on/ui/home.dart';
import 'package:flutter/material.dart';
// import '../profil/profil.dart';

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
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/desain1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(''),
          ),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text('Daftar Buku'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.account_circle),
          //   title: const Text('Profil'),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => const Profil()));
          //   },
          // ),
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
