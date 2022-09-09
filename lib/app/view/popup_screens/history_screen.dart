import 'package:flutter/material.dart';

import '../../data/history_data.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

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
                "History",
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
              itemCount: historyData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(historyData[index]["icon"]),
                  title: Text(historyData[index]["url"]),
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
