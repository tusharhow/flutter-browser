import 'package:flutter/material.dart';
import 'package:flutter_browser/app/controllers/browser_controller.dart';
import 'package:flutter_browser/app/view/main/details_screen.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../popup_screens/bookmarks_screen.dart';
import '../popup_screens/downloads_screen.dart';
import '../popup_screens/history_screen.dart';
import '../popup_screens/incognito_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List _list = [
      "google.com",
      "youtube.com",
      "facebook.com",
      "instagram.com",
      "twitter.com",
      "linkedin.com",
    ];
    // url icons
    List _icons = [
      "https://www.google.com/s2/favicons?domain=google.com",
      "https://www.google.com/s2/favicons?domain=youtube.com",
      "https://www.google.com/s2/favicons?domain=facebook.com",
      "https://www.google.com/s2/favicons?domain=instagram.com",
      "https://www.google.com/s2/favicons?domain=twitter.com",
      "https://www.google.com/s2/favicons?domain=linkedin.com",
    ];
    WebViewController? _controller;

    return Scaffold(
      body: GetBuilder<BrowserController>(
          init: BrowserController(),
          builder: (controller) {
            return Column(
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
                      onPressed: () async {
                        if (await _controller!.canGoBack()) {
                          _controller.goBack();
                        } else {}
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () async {
                        _controller!.reload();
                      },
                    ),
                    Transform.rotate(
                      angle: 180 * 3.14 / 180,
                      child: IconButton(
                        icon: const Icon(
                          Icons.keyboard_backspace_rounded,
                          color: Colors.black,
                          size: 15,
                        ),
                        onPressed: () async {
                          if (await _controller!.canGoForward()) {
                            _controller.goForward();
                          } else {}
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: TextFormField(
                          controller: controller.urlController,
                          decoration: InputDecoration(
                            hintText: 'https://www.google.com',
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                              fontSize: 15,
                            ),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.black38),
                            filled: true,
                            fillColor: Colors.black12,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding:
                                const EdgeInsets.only(left: 10, top: 15),
                          ),
                          onEditingComplete: () {
                            controller.goToUrl(context);
                          },
                          onFieldSubmitted: (value) {
                            controller.goToUrl(context);
                          },
                          onSaved: (value) {
                            controller.urlController.text = value!;
                          },
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    PopupMenuButton(
                        onSelected: (value) {
                          switch (value) {
                            case 1:
                              Get.to(() => const MyHomePage(),
                                  transition: Transition.cupertino);
                              break;
                            case 2:
                              Get.to(() => const IncognitoScreen(),
                                  transition: Transition.cupertino);
                              break;
                            case 3:
                              Get.to(() => const HistoryScreen(),
                                  transition: Transition.cupertino);
                              break;
                            case 4:
                              Get.to(() => const DownloadsScreen(),
                                  transition: Transition.cupertino);
                              break;
                            case 5:
                              Get.to(() => const BookMarksScreen(),
                                  transition: Transition.cupertino);
                              break;
                          }
                        },
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.black,
                          size: 20,
                        ),
                        itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                              value: 1,
                              child: Text('New Window'),
                            ),
                            const PopupMenuItem(
                              value: 2,
                              child: Text('New Incognito Window'),
                            ),
                            const PopupMenuItem(
                              value: 3,
                              child: Text('History'),
                            ),
                            const PopupMenuItem(
                              value: 4,
                              child: Text('Downloads'),
                            ),
                            const PopupMenuItem(
                              value: 5,
                              child: Text('Bookmarks'),
                            ),
                          ];
                        })
                  ],
                ),
                const SizedBox(height: 20 * 2),
                // logo
                Center(
                  child: Image.network(
                    'https://www.pngmart.com/files/16/Web-Browser-PNG-Photos.png',
                    height: 130,
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Card(
                          elevation: 4,
                          child: ListTile(
                            onTap: () {
                              Get.to(
                                () => DetailsScreen(
                                  url: _list[index],
                                ),
                              );
                            },
                            title: Row(
                              children: [
                                Image.network(
                                  _icons[index],
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  _list[index],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
