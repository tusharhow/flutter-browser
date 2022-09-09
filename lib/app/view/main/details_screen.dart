import 'package:flutter/material.dart';
import 'package:flutter_browser/app/controllers/browser_controller.dart';
import 'package:flutter_browser/app/view/main/home_page.dart';
import 'package:flutter_browser/app/view/popup_screens/incognito_screen.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../popup_screens/bookmarks_screen.dart';
import '../popup_screens/downloads_screen.dart';
import '../popup_screens/history_screen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    int progress = 0;
    WebViewController? _controller;
    return WillPopScope(
      onWillPop: () async {
        if (await _controller!.canGoBack()) {
          _controller?.goBack();
          return false;
        }
        return true;
      },
      child:
          Scaffold(body: GetBuilder<BrowserController>(builder: (controller) {
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
                      _controller!.goBack();
                    } else {
                      print("can't go back");
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    size: 15,
                  ),
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
                        _controller!.goForward();
                      } else {}
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: TextFormField(
                      controller: widget.url.isEmpty
                          ? controller.urlController
                          : TextEditingController(text: widget.url),
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
            ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: WebView(
                        initialMediaPlaybackPolicy:
                            AutoMediaPlaybackPolicy.always_allow,
                        userAgent:
                            'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Mobile Safari/537.36',
                        key: UniqueKey(),
                        navigationDelegate: (NavigationRequest request) {
                          if (request.url.startsWith('https://')) {
                            return NavigationDecision.navigate;
                          }
                          return NavigationDecision.prevent;
                        },
                        onWebResourceError: (WebResourceError error) {
                          print(error.errorCode);
                        },
                        onWebViewCreated: (controller) {
                          _controller = controller;
                        },
                        gestureNavigationEnabled: true,
                        allowsInlineMediaPlayback: true,
                        onProgress: (progresss) {
                          progress = progresss.round();

                          print(progresss);
                        },
                        initialUrl: "https://${widget.url}",
                        javascriptMode: JavascriptMode.unrestricted,
                        javascriptChannels: {
                          JavascriptChannel(
                            name: 'Print',
                            onMessageReceived: (JavascriptMessage message) {
                              print(message.message);
                            },
                          ),
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      })),
    );
  }
}
