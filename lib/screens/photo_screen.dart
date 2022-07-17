import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:share_plus/share_plus.dart';

import '../model/photo.dart';

class PhotoScreen extends StatefulWidget {
  static const routeName = '/photo';

  final Photo photo;

  const PhotoScreen(this.photo, {super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  bool fullscreen = true;

  late final appBar = AppBar(
    title: Text(widget.photo.author),
    actions: [
      IconButton(onPressed: save, icon: const Icon(Icons.download)),
      IconButton(onPressed: share, icon: const Icon(Icons.share)),
    ],
  );

  final config = GestureConfig(
    minScale: 1.0,
    animationMinScale: 0.7,
    maxScale: 3.0,
    animationMaxScale: 3.5,
    speed: 1.0,
    inertialSpeed: 100.0,
    initialScale: 1.0,
    inPageView: false,
    initialAlignment: InitialAlignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullscreen ? appBar : null,
      body: GestureDetector(
        onTap: () => setState(() => fullscreen = !fullscreen),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ExtendedImage(
            image: CachedNetworkImageProvider(widget.photo.image),
            fit: BoxFit.contain,
            enableLoadState: true,
            mode: ExtendedImageMode.gesture,
            initGestureConfigHandler: (state) => config,
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                  return const Center(child: CircularProgressIndicator());
                case LoadState.completed:
                  return null;
                case LoadState.failed:
                  // TODO retry
                  return IconButton(
                    onPressed: () => setState(() {}),
                    icon: const Icon(Icons.refresh, color: Colors.white),
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<String> get filePath async => (await DefaultCacheManager().getSingleFile(widget.photo.image)).path;

  void showSnackbar(String text) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

  void share() async => Share.shareFiles([await filePath]);

  void save() async {
    final success = await GallerySaver.saveImage(await filePath) ?? false;
    final message = success ? "Image saved in the device gallery" : "Image could not be saved";
    showSnackbar(message);
  }
}
