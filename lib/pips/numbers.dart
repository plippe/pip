enum Numbers {
  one(1),
  two(2),
  three(3),
  ;

  const Numbers(this.underlying);
  final int underlying;

  int toInt() {
    return underlying;
  }
}
