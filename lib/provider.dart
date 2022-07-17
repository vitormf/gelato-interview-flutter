import 'package:dio/dio.dart';
import 'package:gelato_photos/viewmodel/photos_view_model.dart';
import 'package:provider/provider.dart';

import '/app.dart';
import 'network/photos_api.dart';

class AppProvider extends MultiProvider {
  AppProvider({super.key})
      : super(
          providers: [
            ChangeNotifierProvider(create: (ctx) => PhotosViewModel(PhotosApi(Dio()))),
          ],
          child: const GelatoPhotosApp(),
        );
}
