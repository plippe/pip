import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pips/tiles/tile.dart';

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
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
              color: isSelected ? Colors.grey.shade900 : Colors.grey.shade300),
        ),
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
