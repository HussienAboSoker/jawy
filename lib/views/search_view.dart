import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body:  Center(
        child: TextField(
          maxLines: 1,
          controller: TextEditingController(),

          decoration: const InputDecoration(
            labelText: 'Search for a city',
            //hintText: 'Search for a city',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(
            //     color: Colors.blue,
            //     width: 2.0,
            //   ),
            // ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}