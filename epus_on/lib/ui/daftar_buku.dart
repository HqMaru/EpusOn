import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Buku extends StatelessWidget {
  const Buku({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 180,
            height: 250,
            color: Colors.grey,
          ),
          Text('')
        ],
        ),
    );
  }
}