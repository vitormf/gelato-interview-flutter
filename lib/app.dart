import 'package:flutter/material.dart';
import 'package:gelato_photos/screens/main_screen.dart';
import 'package:provider/provider.dart';

import 'router.dart';

class GelatoPhotosApp extends StatefulWidget {
  const GelatoPhotosApp({super.key});

  @override
  State<StatefulWidget> createState() => _GelatoPhotosAppState();
}

class _GelatoPhotosAppState extends State<GelatoPhotosApp> with WidgetsBindingObserver {
  late RouteObserver<PageRoute> _routeObserver;

  @override
  void initState() {
    super.initState();
    _routeObserver = context.read<RouteObserver<PageRoute>>();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Gelato Photos',
      onGenerateRoute: GelatoPhotosRouter.generateRoute,
      navigatorObservers: [_routeObserver],
      initialRoute: GelatoPhotosRouter.initialRoute,
      home: const PhotoListScreen(),
    );
  }
}
