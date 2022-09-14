extension Chaining<A> on A {
  B pipe<B>(B Function(A) f) => f(this);

  A tap(Function(A) f) {
    f(this);
    return this;
  }
}
