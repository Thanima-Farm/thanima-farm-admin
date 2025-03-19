import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: const SearchForm(),
    );
  }
}

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Search',
            ),
            onChanged: (value) {
              // Call API or perform search operation
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Call API or perform search operation
              String searchText = _controller.text;
              debugPrint('Search text: $searchText');
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
