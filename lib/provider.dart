import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/app.dart';

class AppProvider {
  static final RouteObserver<PageRoute> _routeObserver = RouteObserver<PageRoute>();

  static Future<MultiProvider> providers() async {
    return MultiProvider(
      providers: [
        Provider<RouteObserver<PageRoute>>(create: (_) => _routeObserver),
      ],
      child: GelatoPhotosApp(),
    );
  }
}
