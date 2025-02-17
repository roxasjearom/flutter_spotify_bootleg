import 'package:flutter/material.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({
    super.key,
    required this.scrollController,
    required this.maxAppBarHeight,
    required this.minAppBarHeight,
    required this.playPauseButtonSize,
    required this.infoBoxHeight,
  });

  final ScrollController scrollController;
  final double maxAppBarHeight;
  final double minAppBarHeight;
  final double playPauseButtonSize;
  final double infoBoxHeight;

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      setState(() {}); //Add initial state
    });
  }

  double get getPositionFromTop {
    double position = widget.maxAppBarHeight;
    double finalPosition =
        widget.minAppBarHeight - widget.playPauseButtonSize / 2;

    if (widget.scrollController.hasClients) {
      double offset = widget.scrollController.offset;
      double addOrSubtractValue =
          widget.infoBoxHeight - widget.playPauseButtonSize - 10;
      final bool isFinalPosition =
          offset > (position - finalPosition + addOrSubtractValue);
      if (!isFinalPosition) {
        position = position - offset + addOrSubtractValue;
      } else {
        position = finalPosition;
      }
    }
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: getPositionFromTop,
        right: 10,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.play_arrow, size: 32, color: Colors.black),
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: const CircleBorder(),
            fixedSize:
                Size(widget.playPauseButtonSize, widget.playPauseButtonSize),
          ),
        ));
  }
}
