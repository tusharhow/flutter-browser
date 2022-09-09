import 'package:flutter/material.dart';

import '../../data/download_data.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

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
                "Downloads",
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
              itemCount: downloadScreenData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.file_download),
                  title: Text(downloadScreenData[index]["title"]),
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
