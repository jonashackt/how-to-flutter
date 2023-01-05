import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white
        )
      ),
      home: const RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

// the _ prefix stands for privacy enforcement in Dart
class _RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  // using a Set here {} instead of an array, since it filters duplicate entries
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(
    fontSize: 18
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generatör'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          )
        ],
        ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int itemBuilderIndex) {
          if (itemBuilderIndex.isOdd) return const Divider();

          final suggestionsIndex = itemBuilderIndex ~/ 2;
          if(suggestionsIndex >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          final alreadySaved = _saved.contains(_suggestions[suggestionsIndex]);

          return buildListTile(suggestionsIndex, alreadySaved);
        },
        //separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  ListTile buildListTile(int suggestionsIndex, bool alreadySaved) {
    return ListTile(
      title: Text(
        _suggestions[suggestionsIndex].asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.add_circle : Icons.add_circle_outline,
        color: alreadySaved ? Colors.blue : null,
        semanticLabel: alreadySaved ? 'Remove from saved' : 'Save me',
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(_suggestions[suggestionsIndex]);
          } else {
            _saved.add(_suggestions[suggestionsIndex]);
          }
        });
    },
  );
  }

  void _pushSaved() {
    Navigator.of(context).push(savedSuggestionsRoute());
  }

  MaterialPageRoute<void> savedSuggestionsRoute() {
    return MaterialPageRoute<void>(
      builder: (context) {
        final tiles = _saved.map(
          (pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          },
        );
        final divided = tiles.isNotEmpty
            ? ListTile.divideTiles(
                context: context,
                tiles: tiles,
              ).toList()
            : <Widget>[];

        return Scaffold(
          appBar: AppBar(
            title: const Text('Saved Suggestions'),
          ),
          body: ListView(children: divided),
        );
      },
    );
  }
}

