import 'package:flutter/material.dart';
import 'package:gelato_photos/screens/gallery_screen.dart';
import 'package:gelato_photos/screens/photo_screen.dart';

import 'model/photo.dart';

typedef RouterFunction = Widget Function(BuildContext context, RouteSettings settings);

class GelatoPhotosRouter {
  static const initialRoute = GalleryScreen.routeName;

  static Route<dynamic> generateRoute(RouteSettings settings) => MaterialPageRoute(
        settings: settings,
        builder: (ctx) {
          switch (settings.name) {
            case GalleryScreen.routeName:
              return const GalleryScreen();
            case PhotoScreen.routeName:
              return PhotoScreen(settings.arguments as Photo);
            default:
              throw Exception("Unimplemented route");
          }
        },
      );
}
