// ignore_for_file: public_member_api_docs, sort_constructors_first
class Either<Left, Right> {
  final Left? left;
  final Right? right;
  final bool isLeft;

  Either._({
    this.left,
    this.right,
    required this.isLeft,
  });

  factory Either.left(Left failure) {
    return Either._(left: failure, right: null, isLeft: true);
  }

  factory Either.right(Right right) {
    return Either._(left: null, right: right, isLeft: false);
  }

  T when<T>(T Function(Left) left, T Function(Right) right) {
    if (isLeft) {
      return left(left as Left);
    } else {
      return right(right as Right);
    }
  }
}
