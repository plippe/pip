extension ListReplace<A> on List<A> {
  void replace(A before, A after) {
    int index = indexOf(before);

    removeAt(index);
    insert(index, after);
  }
}

extension ListRemoveAll<A> on List<A> {
  void removeAll(Iterable<A> iterable) {
    for (A element in iterable) {
      remove(element);
    }
  }
}
