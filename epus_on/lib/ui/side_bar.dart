import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                image: NetworkImage(
                  'https://maulidyasofyanadewi.files.wordpress.com/2018/10/1.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading : Icon(Icons.library_books),
            title: Text('Perpustakaan'),
            onTap: () => null,
          ),
          ListTile(
            leading : Icon(Icons.account_circle),
            title: Text('Profil'),
            onTap: () => null,
          ),
          ListTile(
            leading : Icon(Icons.supervisor_account),
            title: Text('Perpustakaan'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
