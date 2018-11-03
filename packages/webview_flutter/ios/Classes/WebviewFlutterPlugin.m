// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "WebviewFlutterPlugin.h"
#import "WebViewFactory.h"

@implementation FLTWebviewFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel =
      [FlutterMethodChannel methodChannelWithName:@"webview_flutter"
                                  binaryMessenger:[registrar messenger]];
  FLTWebviewFlutterPlugin* instance = [[FLTWebviewFlutterPlugin alloc] init];
  WebViewFactory* factory = [[WebViewFactory  alloc] init];
  [registrar registerViewFactory:factory withId:@"plugins.flutter.io/webview"];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
