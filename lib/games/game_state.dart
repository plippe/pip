import 'package:pip/extensions/chaining.dart';
import 'package:pip/tiles/tile.dart';
import 'package:pip/extensions/list.dart';
import 'package:pip/triples/is_triple.dart';
import 'package:pip/triples/triple.dart';

class TilePile {
  List<Tile> underlying;

  TilePile(this.underlying);

  static TilePile all() => TilePile(Tile.all());
}

class TileDisplayed {
  List<Tile> underlying;

  TileDisplayed(this.underlying);

  static TileDisplayed empty(TilePile pile) {
    List<Tile> underlying = pile.underlying
        .pipe((u) => List.of(u))
        .tap((u) => u.shuffle())
        .take(12)
        .toList();

    return Triple.anyTriple(underlying)
        ? TileDisplayed(underlying)
        : empty(pile);
  }

  TileDisplayed replaceSelected(TilePile pile, TileSelected selected) {
    List<Tile> draw = pile.underlying
        .pipe((u) => List.of(u))
        .tap((u) => u.shuffle())
        .tap((u) => u.removeAll(underlying))
        .tap((u) => u.removeAll(selected.underlying))
        .take(3)
        .toList();

    List<Tile> underlyingWithDraw = underlying
        .pipe((u) => List.of(u))
        .tap((u) => u.replace(selected.underlying[0], draw[0]))
        .tap((u) => u.replace(selected.underlying[1], draw[1]))
        .tap((u) => u.replace(selected.underlying[2], draw[2]));

    return Triple.anyTriple(underlyingWithDraw)
        ? TileDisplayed(underlyingWithDraw)
        : replaceSelected(pile, selected);
  }
}

class TileSelected {
  List<Tile> underlying;

  TileSelected(this.underlying);

  static TileSelected empty() => TileSelected(List.empty(growable: true));
  void clear() => underlying.clear();

  void toggle(Tile tile) {
    if (underlying.contains(tile)) {
      underlying.remove(tile);
    } else if (underlying.length < 3) {
      underlying.add(tile);
    }
  }

  IsTriple isTriple() => Triple.isTriple(underlying);
}

class GameState {
  TilePile pile;
  TileDisplayed displayed;
  TileSelected selected;

  GameState(this.pile, this.displayed, this.selected);

  static GameState empty() {
    TilePile pile = TilePile.all();
    return GameState(pile, TileDisplayed.empty(pile), TileSelected.empty());
  }

  IsTriple onTileTap(Tile tile) {
    IsTriple isTriple = selected.tap((u) => u.toggle(tile)).isTriple();

    if (isTriple == IsTriple.incomplete) {
    } else if (isTriple == IsTriple.yes) {
      displayed = displayed.replaceSelected(pile, selected);
      selected = TileSelected.empty();
    } else {
      selected = TileSelected.empty();
    }

    return isTriple;
  }

  void refreshTiles() {
    displayed = TileDisplayed.empty(pile);
    selected = TileSelected.empty();
  }
}
