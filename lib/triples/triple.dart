import 'package:pips/tiles/tile.dart';
import 'package:pips/triples/is_triple.dart';
import 'package:trotter/trotter.dart';

class Triple {
  static IsTriple isTriple(List<Tile> tiles) {
    bool isTriple<A>(A first, A second, A third) {
      return (first == second && first == third) ||
          (first != second && first != third && second != third);
    }

    if (tiles.length < 3) {
      return IsTriple.incomplete;
    } else if (!isTriple(tiles[0].number, tiles[1].number, tiles[2].number)) {
      return IsTriple.noNumber;
    } else if (!isTriple(tiles[0].symbol, tiles[1].symbol, tiles[2].symbol)) {
      return IsTriple.noSymbol;
    } else if (!isTriple(tiles[0].color, tiles[1].color, tiles[2].color)) {
      return IsTriple.noColor;
    } else {
      return IsTriple.yes;
    }
  }

  static bool anyTriple(List<Tile> tiles) => Combinations(3, tiles)
      .iterable
      .any((tiles) => isTriple(tiles) == IsTriple.yes);
}
