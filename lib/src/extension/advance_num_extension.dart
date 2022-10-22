///@Description     xxxx
///@author          xiangzhongfei
///@create          2022-10-22 9:41 上午

extension AdvanceNumExtension<E> on Iterable<num> {
  /// A minimal element of the iterable, or `null` it the iterable is empty.
  num? get minOrNull {
    var iterator = this.iterator;
    if (iterator.moveNext()) {
      var value = iterator.current;
      if (value.isNaN) {
        return value;
      }
      while (iterator.moveNext()) {
        var newValue = iterator.current;
        if (newValue.isNaN) {
          return newValue;
        }
        if (newValue < value) {
          value = newValue;
        }
      }
      return value;
    }
    return null;
  }

  /// A minimal element of the iterable.
  ///
  /// The iterable must not be empty.
  num get min => minOrNull ?? (throw StateError('No element'));

  /// A maximal element of the iterable, or `null` if the iterable is empty.
  num? get maxOrNull {
    var iterator = this.iterator;
    if (iterator.moveNext()) {
      var value = iterator.current;
      if (value.isNaN) {
        return value;
      }
      while (iterator.moveNext()) {
        var newValue = iterator.current;
        if (newValue.isNaN) {
          return newValue;
        }
        if (newValue > value) {
          value = newValue;
        }
      }
      return value;
    }
    return null;
  }

  /// A maximal element of the iterable.
  ///
  /// The iterable must not be empty.
  num get max => maxOrNull ?? (throw StateError('No element'));

  /// The sum of the elements.
  ///
  /// The sum is zero if the iterable is empty.
  num get sum {
    num result = 0;
    for (var value in this) {
      result += value;
    }
    return result;
  }

  /// The arithmetic mean of the elements of a non-empty iterable.
  ///
  /// The arithmetic mean is the sum of the elements
  /// divided by the number of elements.
  ///
  /// The iterable must not be empty.
  double get average {
    var result = 0.0;
    var count = 0;
    for (var value in this) {
      count += 1;
      result += (value - result) / count;
    }
    if (count == 0) throw StateError('No elements');
    return result;
  }
}
