import 'package:flutter/material.dart';

import '../../data/bookmarks_data.dart';

class BookMarksScreen extends StatelessWidget {
  const BookMarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.keyboard_backspace_rounded,
                  color: Colors.black,
                  size: 15,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                "Bookmarks",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: bookmarksData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.bookmark),
                  title: Row(
                    children: [
                      Text(bookmarksData[index]["url"]),
                    ],
                  ),
                  trailing: const Icon(Icons.close),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
