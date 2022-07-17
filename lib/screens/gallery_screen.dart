import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gelato_photos/screens/photo_screen.dart';
import 'package:gelato_photos/viewmodel/photos_view_model.dart';
import 'package:infinite_widgets/infinite_widgets.dart';
import 'package:provider/provider.dart';

import '../model/photo.dart';

class GalleryScreen extends StatefulWidget {
  static const routeName = '/';

  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int get columns => (MediaQuery.of(context).size.width / 120).floor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gelato Photos")),
      body: Consumer<PhotosViewModel>(builder: (context, viewModel, child) {
        return Column(
          children: [
            if (viewModel.error) _GalleryError(),
            if (viewModel.initialLoading)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else
              Expanded(
                child: RefreshIndicator(
                  onRefresh: viewModel.reset,
                  child: InfiniteGridView(
                    nextData: viewModel.loadNext,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columns),
                    itemBuilder: (context, index) => _GalleryCell(viewModel.photos[index]),
                    itemCount: viewModel.photos.length,
                    hasNext: true,
                    loadingWidget: const Center(child: CircularProgressIndicator()),
                  ),
                ),
              )
          ],
        );
      }),
    );
  }
}

class _GalleryError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewModel = Provider.of<PhotosViewModel>(context);
    return Container(
      color: theme.colorScheme.error,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              "Failed to fetch data",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onError,
              ),
            ),
            const Spacer(),
            IconButton(onPressed: viewModel.loadNext, icon: Icon(Icons.refresh, color: theme.colorScheme.onError)),
            IconButton(onPressed: viewModel.dismissError, icon: Icon(Icons.close, color: theme.colorScheme.onError)),
          ],
        ),
      ),
    );
  }
}

class _GalleryCell extends StatelessWidget {
  final Photo photo;

  const _GalleryCell(this.photo);

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      fit: BoxFit.fill,
      image: CachedNetworkImageProvider(photo.thumbnail),
      child: InkWell(onTap: () => openPhoto(context)),
    );
  }

  void openPhoto(BuildContext context) {
    Navigator.pushNamed(context, PhotoScreen.routeName, arguments: photo);
  }
}
