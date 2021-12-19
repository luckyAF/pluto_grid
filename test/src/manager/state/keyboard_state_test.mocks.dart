// Mocks generated by Mockito 5.0.16 from annotations
// in pluto_grid/test/src/manager/state/keyboard_state_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:ui' as _i5;

import 'package:flutter/material.dart' as _i2;
import 'package:linked_scroll_controller/linked_scroll_controller.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pluto_grid/pluto_grid.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeScrollController_0 extends _i1.Fake implements _i2.ScrollController {
}

/// A class which mocks [PlutoGridScrollController].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlutoGridScrollController extends _i1.Mock
    implements _i3.PlutoGridScrollController {
  @override
  set vertical(_i4.LinkedScrollControllerGroup? _vertical) =>
      super.noSuchMethod(Invocation.setter(#vertical, _vertical),
          returnValueForMissingStub: null);
  @override
  set horizontal(_i4.LinkedScrollControllerGroup? _horizontal) =>
      super.noSuchMethod(Invocation.setter(#horizontal, _horizontal),
          returnValueForMissingStub: null);
  @override
  double get maxScrollHorizontal =>
      (super.noSuchMethod(Invocation.getter(#maxScrollHorizontal),
          returnValue: 0.0) as double);
  @override
  double get maxScrollVertical => (super
          .noSuchMethod(Invocation.getter(#maxScrollVertical), returnValue: 0.0)
      as double);
  @override
  double get verticalOffset =>
      (super.noSuchMethod(Invocation.getter(#verticalOffset), returnValue: 0.0)
          as double);
  @override
  double get horizontalOffset => (super
          .noSuchMethod(Invocation.getter(#horizontalOffset), returnValue: 0.0)
      as double);
  @override
  void setBodyRowsHorizontal(_i2.ScrollController? scrollController) =>
      super.noSuchMethod(
          Invocation.method(#setBodyRowsHorizontal, [scrollController]),
          returnValueForMissingStub: null);
  @override
  void setBodyRowsVertical(_i2.ScrollController? scrollController) => super
      .noSuchMethod(Invocation.method(#setBodyRowsVertical, [scrollController]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [LinkedScrollControllerGroup].
///
/// See the documentation for Mockito's code generation for more information.
class MockLinkedScrollControllerGroup extends _i1.Mock
    implements _i4.LinkedScrollControllerGroup {
  @override
  double get offset =>
      (super.noSuchMethod(Invocation.getter(#offset), returnValue: 0.0)
          as double);
  @override
  _i2.ScrollController addAndGet() =>
      (super.noSuchMethod(Invocation.method(#addAndGet, []),
          returnValue: _FakeScrollController_0()) as _i2.ScrollController);
  @override
  void addOffsetChangedListener(_i5.VoidCallback? onChanged) => super
      .noSuchMethod(Invocation.method(#addOffsetChangedListener, [onChanged]),
          returnValueForMissingStub: null);
  @override
  void removeOffsetChangedListener(_i5.VoidCallback? listener) => super
      .noSuchMethod(Invocation.method(#removeOffsetChangedListener, [listener]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> animateTo(double? offset,
          {_i2.Curve? curve, Duration? duration}) =>
      (super.noSuchMethod(
          Invocation.method(
              #animateTo, [offset], {#curve: curve, #duration: duration}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  void jumpTo(double? value) =>
      super.noSuchMethod(Invocation.method(#jumpTo, [value]),
          returnValueForMissingStub: null);
  @override
  void resetScroll() => super.noSuchMethod(Invocation.method(#resetScroll, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
