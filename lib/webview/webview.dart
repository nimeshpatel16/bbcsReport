import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewLoad extends StatelessWidget {
  final isLoading = true.obs;
  WebViewLoad({Key? key}) : super(key: key);

  void onPageLoaded() {
    isLoading.value = false;
  }

  Widget webView() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: WebView(
        onPageFinished: (value) {
          onPageLoaded();
        },
        zoomEnabled: false,
        initialUrl: "http://www.bbcsinfo.com/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  Widget animatedSplash() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Image.asset(
        "assets/images/splash.png",
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              webView(),
              Visibility(
                visible: isLoading.value,
                child: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Image.asset(
                    "assets/images/splash.png",
                    fit: BoxFit.fill,
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
