import 'package:flutter/material.dart';
import 'package:pips/tiles/tile.dart';
import 'package:pips/tiles/widgets/tile_grid_widget.dart';
import 'package:pips/games/game_state.dart';
import 'package:pips/triples/is_triple.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final GameState _state = GameState.empty();

  void _onTileTap(Tile tile) => setState(() {
        IsTriple isTriple = _state.onTileTap(tile);

        if (isTriple == IsTriple.incomplete) {
        } else if (isTriple == IsTriple.yes) {
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("This isn't a valid set")));
        }
      });

  void _refreshTiles() => setState(() {
        _state.refreshTiles();
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey.shade900,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: TileGridWidget(
            tiles: _state.displayed.underlying,
            selectedTiles: _state.selected.underlying,
            onTileTap: _onTileTap,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshTiles,
        backgroundColor: Colors.grey.shade900,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
