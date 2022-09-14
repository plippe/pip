import 'package:flutter/material.dart';
import 'package:pip/tiles/widgets/tile_widget.dart';
import 'package:pip/tiles/tile.dart';

class TileGridWidget extends StatelessWidget {
  const TileGridWidget(
      {Key? key,
      required this.tiles,
      required this.selectedTiles,
      required this.onTileTap})
      : super(key: key);

  final List<Tile> tiles;
  final List<Tile> selectedTiles;
  final Function(Tile)? onTileTap;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: tiles
          .map((tile) => TileWidget(
                tile: tile,
                isSelected: selectedTiles.contains(tile),
                onTap: onTileTap,
              ))
          .toList(),
    );
  }
}
