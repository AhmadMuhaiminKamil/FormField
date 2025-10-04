import 'package:flutter/material.dart';

void main() => runApp(const Nav2());

class Nav2 extends StatelessWidget {
  const Nav2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/product': (context) => const MyProduct(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/product',
                  arguments: {'id': 101, 'name': 'Laptop'},
                );
              },
              child: const Text('Product'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyProfile(id: 1, name: 'Ahmad'),
                  ),
                );
              },
              child: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyProfile extends StatelessWidget {
  final int id;
  final String name;
  const MyProfile({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('ID : $id'), Text('Name : $name')],
        ),
      ),
    );
  }
}

class MyProduct extends StatelessWidget {
  const MyProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final int id = args?['id'] ?? 0;
    final String name = args?['name'] ?? 'Unknown';

    return Scaffold(
      appBar: AppBar(title: const Text('Product')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Product ID: $id'), Text('Product Name: $name')],
        ),
      ),
    );
  }
}
