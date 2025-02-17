import 'package:flutter/material.dart';

class AlbumInfoSection extends StatelessWidget {
  const AlbumInfoSection({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.artist,
    required this.infoBoxHeight,
  });

  final String title;
  final String imageUrl;
  final String artist;
  final double infoBoxHeight;

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
                const Text(
                  "Album . 2021", //TODO add actual date
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
}
