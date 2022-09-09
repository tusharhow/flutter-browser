import 'package:flutter/material.dart';
import 'package:flutter_browser/app/view/main/details_screen.dart';
import 'package:get/get.dart';

class BrowserController extends GetxController {
  final TextEditingController urlController = TextEditingController();

// go to url
  Future goToUrl(context) async {
    if (urlController.text.isNotEmpty) {
      Get.to(
        () => DetailsScreen(
          url: urlController.text,
        ),
      );
      update();
    }
  }

  
}
