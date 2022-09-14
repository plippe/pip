enum Colors {
  cyan("#648FFF"),
  magento("#DC267F"),
  yellow("#FFB000"),
  ;

  const Colors(this.underlying);
  final String underlying;

  String toHex() {
    return underlying;
  }
}
