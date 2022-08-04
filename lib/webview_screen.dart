// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

import 'package:flutter/material.dart';

// ignore: prefer_collection_literals
// final Set<JavascriptChannel> jsChannels = [
//   JavascriptChannel(
//       name: 'Print',
//       onMessageReceived: (JavascriptMessage message) {
//         print(message.message);
//       }),
// ].toSet();

class WebViewExample extends StatefulWidget {
  WebViewExample({required this.url});
final  String url;
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: WebView(
            onWebResourceError: (err){
              print('Error ==> $err');
            },
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: widget.url,
            // navigationDelegate: (request) {
            //   return request.url;
            //  // return request.url == "https://google.com/"
            //   //navigation to next page
            //
            // }
        )
    );
  }

  // JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  //   return JavascriptChannel(
  //       name: 'Toaster',
  //       onMessageReceived: (JavascriptMessage message) {
  //         // ignore: deprecated_member_use
  //         Scaffold.of(context).showSnackBar(
  //           SnackBar(content: Text(message.message)),
  //         );
  //       });
  // }
  //
  // Widget favoriteButton() {
  //   return FutureBuilder<WebViewController>(
  //       future: _controller.future,
  //       builder: (BuildContext context,
  //           AsyncSnapshot<WebViewController> controller) {
  //         if (controller.hasData) {
  //           return FloatingActionButton(
  //             onPressed: () async {
  //               final String url = (await controller.data!.currentUrl())!;
  //               // ignore: deprecated_member_use
  //               Scaffold.of(context).showSnackBar(
  //                 SnackBar(content: Text('Favorited $url')),
  //               );
  //             },
  //             child: const Icon(Icons.favorite),
  //           );
  //         }
  //         return Container();
  //       });
  // }
}

enum MenuOptions {
  showUserAgent,
  listCookies,
  clearCookies,
  addToCache,
  listCache,
  clearCache,
  navigationDelegate,
  doPostRequest,
  loadLocalFile,
  loadFlutterAsset,
  loadHtmlString,
  transparentBackground,
  setCookie,
}



