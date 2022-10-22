import 'dart:collection';
import 'dart:math';

import 'algorithms.dart';
import 'algorithms.dart' as algorithms;
import 'equality.dart';
import 'utils.dart';

///@Description     xxxx
///@author          xiangzhongfei
///@create          2022-10-22 9:41 上午

extension AdvanceListExtension<PlutoRow> on List<PlutoRow> {
  /// Contiguous [slice]s of [this] with the given [length].
  ///
  /// Each slice is a view of this list [length] elements long, except for the
  /// last one which may be shorter if [this] contains too few elements. Each
  /// slice begins after the last one ends.
  ///
  /// As with [slice], these slices are backed by this list, which must not
  /// change its length while the views are being used.
  ///
  /// For example, `[1, 2, 3, 4, 5].slices(2)` returns `[[1, 2], [3, 4], [5]]`.
  Iterable<List<PlutoRow>> slices(int length) sync* {
    if (length < 1) throw RangeError.range(length, 1, null, 'length');
    for (var i = 0; i < this.length; i += length) {
      yield slice(i, min(i + length, this.length));
    }
  }

  ListSlice<PlutoRow> slice(int start, [int? end]) {
    end = RangeError.checkValidRange(start, end, length);
    var self = this;
    if (self is ListSlice) return self.slice(start, end);
    return ListSlice<PlutoRow>(this, start, end);
  }
}

/// A list view of a range of another list.
///
/// Wraps the range of the [source] list from [start] to [end]
/// and acts like a fixed-length list view of that range.
/// The source list must not change length while a list slice is being used.
class ListSlice<E> extends ListBase<E> {
  /// Original length of [source].
  ///
  /// Used to detect modifications to [source] which may invalidate
  /// the slice.
  final int _initialSize;

  /// The original list backing this slice.
  final List<E> source;

  /// The start index of the slice.
  final int start;

  @override
  final int length;

  /// Creates a slice of [source] from [start] to [end].
  ListSlice(this.source, this.start, int end)
      : length = end - start,
        _initialSize = source.length {
    RangeError.checkValidRange(start, end, source.length);
  }

  // No argument checking, for internal use.
  ListSlice._(this._initialSize, this.source, this.start, this.length);

  /// The end index of the slice.
  int get end => start + length;

  @override
  E operator [](int index) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    RangeError.checkValidIndex(index, this, null, length);
    return source[start + index];
  }

  @override
  void operator []=(int index, E value) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    RangeError.checkValidIndex(index, this, null, length);
    source[start + index] = value;
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    RangeError.checkValidRange(start, end, length);
    source.setRange(start + start, start + end, iterable, skipCount);
  }

  /// A fixed length view of a range of this list.
  ///
  /// The view is backed by this list, which must not change its length while
  /// the view is being used.
  ///
  /// The view can be used to perform specific whole-list
  /// actions on a part of the list.
  /// For example, to see if a list contains more than one
  /// "marker" element, you can do:
  /// ```dart
  /// someList.slice(someList.indexOf(marker) + 1).contains(marker)
  /// ```
  ListSlice<E> slice(int start, [int? end]) {
    end = RangeError.checkValidRange(start, end, length);
    return ListSlice._(_initialSize, source, start + start, end - start);
  }

  @override
  void shuffle([Random? random]) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    algorithms.shuffle(source, start, end, random);
  }

  @override
  void sort([int Function(E a, E b)? compare]) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    compare ??= defaultCompare;
    quickSort(source, compare, start, start + length);
  }

  /// Sort a range of elements by [compare].
  void sortRange(int start, int end, int Function(E a, E b) compare) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    source.sortRange(start, end, compare);
  }

  /// Shuffles a range of elements.
  ///
  /// If [random] is omitted, a new instance of [Random] is used.
  void shuffleRange(int start, int end, [Random? random]) {
    if (source.length != _initialSize) {
      throw ConcurrentModificationError(source);
    }
    RangeError.checkValidRange(start, end, length);
    algorithms.shuffle(source, this.start + start, this.start + end, random);
  }

  /// Reverses a range of elements.
  void reverseRange(int start, int end) {
    RangeError.checkValidRange(start, end, length);
    source.reverseRange(this.start + start, this.start + end);
  }

  // Act like a fixed-length list.

  @override
  set length(int newLength) {
    throw UnsupportedError('Cannot change the length of a fixed-length list');
  }

  @override
  void add(E element) {
    throw UnsupportedError('Cannot add to a fixed-length list');
  }

  @override
  void insert(int index, E element) {
    throw UnsupportedError('Cannot add to a fixed-length list');
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    throw UnsupportedError('Cannot add to a fixed-length list');
  }

  @override
  void addAll(Iterable<E> iterable) {
    throw UnsupportedError('Cannot add to a fixed-length list');
  }

  @override
  bool remove(Object? element) {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }

  @override
  void removeWhere(bool Function(E element) test) {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }

  @override
  void retainWhere(bool Function(E element) test) {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }

  @override
  void clear() {
    throw UnsupportedError('Cannot clear a fixed-length list');
  }

  @override
  E removeAt(int index) {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }

  @override
  E removeLast() {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }

  @override
  void removeRange(int start, int end) {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }

  @override
  void replaceRange(int start, int end, Iterable<E> newContents) {
    throw UnsupportedError('Cannot remove from a fixed-length list');
  }
}
