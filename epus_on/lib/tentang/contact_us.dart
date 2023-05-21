import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak Kami'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              const Text(
                'Kontak Kami',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Jika Anda memiliki pertanyaan atau komentar, jangan ragu untuk menghubungi kami menggunakan formulir di bawah ini.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Pesan',
                  ),
                maxLines: 3,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Kirim'),
              ),
              const SizedBox(height: 40.0),
              const Text(
                'Follow us on social media:',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _animation,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook),
                    ),
                  ),
                  // const SizedBox(width: 20.0),
                  // ScaleTransition(
                  //   scale: _animation,
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.twitter),
                  //   ),
                  // ),
                  // const SizedBox(width: 20.0),
                  // ScaleTransition(
                  //   scale: _animation,
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.instagram),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
