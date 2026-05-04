import 'package:flutter/material.dart';
import 'package:jawy/views/search_view.dart';
import 'package:jawy/widgets/wethaer_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchView()),);
            },
            icon: const Icon(Icons.search),
          ),
        ],
        centerTitle: true,
        title: const Text('JAWY'),
      ),
      body: const WethaerView(),
    );
  }
}
