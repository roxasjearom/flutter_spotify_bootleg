import 'package:flutter/material.dart';
import 'package:flutter_spotify_bootleg/ui/songlist/view/custom_appbar/const.dart';

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
    // TODO: implement initState
    super.initState();

    widget.scrollController.addListener(() {
      setState(() {});
    });
  }

  double get getPositionFromTop {
    double position = widget.maxAppBarHeight;
    double finalPosition =
        widget.minAppBarHeight - widget.playPauseButtonSize / 2;

    if (widget.scrollController.hasClients) {
      double offset = widget.scrollController.offset;
      //When adjusting position, add/subtract in addOrSubtractValue
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
            backgroundColor: kPlayPauseButtonColor,
            shape: const CircleBorder(),
            padding: EdgeInsets.zero, // Usually not needed with IconButton
            fixedSize:
                Size(widget.playPauseButtonSize, widget.playPauseButtonSize),
          ),
        ));
  }
}
