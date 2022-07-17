import 'package:flutter/material.dart';
import 'package:gelato_photos/screens/gallery_screen.dart';
import 'package:gelato_photos/theme.dart';

import 'router.dart';

class GelatoPhotosApp extends StatefulWidget {
  const GelatoPhotosApp({super.key});

  @override
  State<StatefulWidget> createState() => _GelatoPhotosAppState();
}

class _GelatoPhotosAppState extends State<GelatoPhotosApp> with WidgetsBindingObserver {
  final RouteObserver<PageRoute> _routeObserver = RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gelato Photos',
      onGenerateRoute: GelatoPhotosRouter.generateRoute,
      navigatorObservers: [_routeObserver],
      initialRoute: GelatoPhotosRouter.initialRoute,
      home: const GalleryScreen(),
      theme: GelatoPhotosTheme.themeData,
    );
  }
}
