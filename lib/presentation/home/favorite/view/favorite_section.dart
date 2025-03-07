import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_bootleg/domain/models/song.dart';
import 'package:flutter_spotify_bootleg/presentation/favoritelist/favorite_list_screen.dart';
import 'package:flutter_spotify_bootleg/presentation/home/favorite/bloc/favorite_bloc.dart';
import 'package:flutter_spotify_bootleg/presentation/home/favorite/view/favorite_item.dart';

class FavoriteSection extends StatefulWidget {
  const FavoriteSection({super.key});

  @override
  State<StatefulWidget> createState() => _FavoriteSectionState();
}

class _FavoriteSectionState extends State<FavoriteSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
      switch (state.status) {
        case FavoriteStatus.initial:
          return const Center(child: CircularProgressIndicator());

        case FavoriteStatus.success:
          if (state.favorites.isEmpty) {
            return const Center(child: Text('No favorite to show'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(),
              SizedBox(height: 8),
              FavoriteList(favorites: state.favorites),
            ],
          );

        case FavoriteStatus.failure:
          return const Center(child: Text('Failed to fetch favorites'));
      }
    });
  }
}

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    super.key,
    required this.favorites,
  });

  final List<Song> favorites;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return FavoriteItem(favorite: favorites[index]);
        },
        itemCount: favorites.length,
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Favorites",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteListScreen()),
              );
            },
            child: Text("Show all"))
      ],
    );
  }
}
