import 'package:flutter/material.dart';
import 'package:gelato_photos/screens/main_screen.dart';

typedef RouterFunction = Widget Function(BuildContext context, RouteSettings settings);

class GelatoPhotosRouter {
  static const initialRoute = PhotoListScreen.routeName;

  static final Map<String, RouterFunction> routes = {};

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final RouterFunction? function = routes[settings.name];

    if (function == null) {
      throw Exception("Unimplemented route");
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => function(ctx, settings),
    );
  }
}
