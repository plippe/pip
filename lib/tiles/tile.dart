import 'package:pip/pips/colors.dart';
import 'package:pip/pips/numbers.dart';
import 'package:pip/pips/symbols.dart';

class Tile {
  final Numbers number;
  final Symbols symbol;
  final Colors color;

  Tile(
    this.number,
    this.symbol,
    this.color,
  );

  static List<Tile> all() {
    List<Tile> tiles = Numbers.values.expand((number) {
      return Symbols.values.expand((symbol) {
        return Colors.values.map((color) {
          return Tile(number, symbol, color);
        });
      });
    }).toList();

    return tiles;
  }

  String toSvgString() {
    return '''
      <?xml version="1.0" encoding="UTF-8"?>
      <svg viewBox="0 0 100 100">
        <path
          d="${symbol.toSvgPath()}"
          stroke="${color.toHex()}"
          stroke-width="9"
          fill="${color.toHex()}"
          />
      </svg>
    ''';
  }
}
