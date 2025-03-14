import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/presentation/tracklist/view/custom_appbar/album_image.dart';
import 'package:flutter_spotify_bootleg/presentation/tracklist/view/custom_appbar/fixed_appbar.dart';
import 'package:flutter_spotify_bootleg/presentation/tracklist/view/custom_appbar/sliver_appbar_delegate.dart';

class SliverCustomeAppBar extends StatelessWidget {
  const SliverCustomeAppBar({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.maxAppBarHeight,
    required this.minAppBarHeight,
  });

  final String title;
  final String imageUrl;
  final double maxAppBarHeight;
  final double minAppBarHeight;

  @override
  Widget build(BuildContext context) {
    final extraTopPadding = MediaQuery.of(context).size.height * 0.05;
    final contentPadding = EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + extraTopPadding,
        right: 10,
        left: 10);

    return SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
            maxHeight: maxAppBarHeight,
            minHeight: minAppBarHeight,
            builder: (context, shrinkOffset) {
              final double shrinkToMaxAppBarHeightRatio =
                  shrinkOffset / maxAppBarHeight;
              const double animatAlbumImageFromPoint = 0.4;
              final animateAlbumImage =
                  shrinkToMaxAppBarHeightRatio >= animatAlbumImageFromPoint;
              final animateOpacityToZero = shrinkToMaxAppBarHeightRatio > 0.6;
              final albumPositionFromTop = animateAlbumImage
                  ? (animatAlbumImageFromPoint - shrinkToMaxAppBarHeightRatio) *
                      maxAppBarHeight
                  : null;
              final albumImageSize =
                  MediaQuery.of(context).size.height * 0.3 - shrinkOffset / 2;
              final showFixedAppBar = shrinkToMaxAppBarHeightRatio > 0.7;
              final double titleOpacity = showFixedAppBar
                  ? 1 - (maxAppBarHeight - shrinkOffset) / minAppBarHeight
                  : 0;

              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: albumPositionFromTop,
                    child: AlbumImage(
                      imageUrl: imageUrl,
                      padding: contentPadding,
                      animateOpacityToZero: animateOpacityToZero,
                      animateAlbumImage: animateAlbumImage,
                      shrinkToMaxAppBarHeightRatio: shrinkToMaxAppBarHeightRatio,
                      albumImageSize: albumImageSize,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      gradient: showFixedAppBar
                          ? LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                  Theme.of(context).colorScheme.onSecondary,
                                  Theme.of(context).colorScheme.surface,
                                ],
                              stops: [
                                  0,
                                  0.5
                                ])
                          : null,
                    ),
                    child: Padding(
                      padding: contentPadding,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: double.maxFinite,
                        child: FixedAppBar(title: title, titleOpacity: titleOpacity),
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
