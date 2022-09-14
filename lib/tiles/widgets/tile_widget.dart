import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pip/tiles/tile.dart';

class TileWidget extends StatelessWidget {
  const TileWidget(
      {Key? key, required this.tile, required this.isSelected, this.onTap})
      : super(key: key);

  final Tile tile;
  final bool isSelected;
  final Function(Tile)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(tile),
      child: Container(
        decoration: isSelected
            ? BoxDecoration(border: Border.all(color: Colors.grey.shade800))
            : null,
        padding: const EdgeInsets.all(7.5),
        child: Column(
          children: List.filled(
            tile.number.toInt(),
            Expanded(
              child: SvgPicture.string(tile.toSvgString()),
            ),
          ),
        ),
      ),
    );
  }
}

class TileState {
  final bool isSelected;

  TileState(this.isSelected);
}
