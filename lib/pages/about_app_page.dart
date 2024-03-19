import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: const Text(
                  'TENTANG',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 67),
                child: Image.asset(
                  'assets/logoBerceritaPanjang.png',
                  width: 250,
                ),
              ),
              const Text(
                'Bercerita adalah kumpulan beberapa cerita dari berbagai budaya di seluruh dunia. Ini adalah blog pribadi yang dibuat oleh Riko Arinda, seorang penulis yang memiliki ketertarikan mendalam terhadap cerita rakyat dan makhluk mitos.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
