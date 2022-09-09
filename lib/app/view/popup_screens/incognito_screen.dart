import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IncognitoScreen extends StatelessWidget {
  const IncognitoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebViewController? _controller;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.keyboard_backspace_rounded,
                  color: Colors.white,
                  size: 15,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              Transform.rotate(
                angle: 180 * 3.14 / 180,
                child: IconButton(
                  icon: const Icon(
                    Icons.keyboard_backspace_rounded,
                    color: Colors.white,
                    size: 15,
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      hintText: 'https://www.google.com',
                      hintStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.black38),
                      filled: true,
                      fillColor: Colors.white54,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.only(left: 10, top: 15),
                    ),
                    // onEditingComplete: () {
                    //   controller.goToUrl(context);
                    // },
                    // onFieldSubmitted: (value) {
                    //   controller.goToUrl(context);
                    // },
                    // onSaved: (value) {
                    //   controller.urlController.text = value!;
                    // },
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16 * 10),
          // incognito icon
          const Center(
            child: Icon(
              Icons.lock,
              color: Colors.white,
              size: 100,
            ),
          ),
          const SizedBox(height: 16 * 2),
          // incognito text
          const Center(
            child: Text(
              'Incognito',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 16 * 2),
          // incognito description
          const Center(
            child: Text(
              'Your browsing history won\'t be saved',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 16),

          Center(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Learn more'),
            ),
          ),
        ],
      ),
    );
  }
}
