enum Symbols {
  circle('M 50, 50 m -40, 0 a 40,40 0 1,0 80,0 a 40,40 0 1,0 -80,0'),
  square('M 10,10 90,10 90,90 10,90 Z'),
  triangle('M 50,15 90,90 10,90 Z');

  const Symbols(this.underlying);
  final String underlying;

  String toSvgPath() {
    return underlying;
  }
}
