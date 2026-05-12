import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawy/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  List<String> _suggestions = [];
  bool _isLoading = false;

  void _onSearchChanged(String query) async {
    if (query.length < 3) {
      setState(() {
        _suggestions = [];
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final suggestions =
        await context.read<GetWeatherCubit>().searchCities(query);

    setState(() {
      _suggestions = suggestions;
      _isLoading = false;
    });
  }

  void _selectCity(String city) {
    Navigator.pop(context, city.split(',')[0].trim());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 80), // Space for app bar
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _controller,
                        onChanged: _onSearchChanged,
                        decoration: InputDecoration(
                          labelText: 'Enter city name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.location_city),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),
                      if (_isLoading) const CircularProgressIndicator(),
                      if (_suggestions.isNotEmpty)
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            itemCount: _suggestions.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(_suggestions[index]),
                                onTap: () => _selectCity(_suggestions[index]),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
