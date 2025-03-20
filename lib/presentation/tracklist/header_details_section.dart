import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/domain/enumerations/source_type.dart';

class HeaderDetailsSection extends StatelessWidget {
  const HeaderDetailsSection({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.artist,
    required this.infoBoxHeight,
    required this.subHeaderValue,
    required this.sourceType,
  });

  final String title;
  final String imageUrl;
  final String artist;
  final String subHeaderValue;
  final double infoBoxHeight;
  final SourceType sourceType;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black87,
              ],
              stops: [
                0.00022,
                1.0,
              ]),
        ),
        child: SizedBox(
          height: infoBoxHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    SizedBox(width: 8),
                    Text(
                      artist,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox.shrink()
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  formatSubHeaderValue(sourceType, subHeaderValue),
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.download_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert_rounded,
                          color: Theme.of(context).colorScheme.secondary,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatSubHeaderValue(SourceType sourceType, String subHeader) {
    return switch (sourceType) {
      SourceType.artist => 'Artist . $subHeader followers',
      SourceType.album => 'Album . $subHeader',
  };
  }
}
