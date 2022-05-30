// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_seeds_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NumberSeedsEntityCWProxy {
  NumberSeedsEntity repetitions(int repetitions);

  NumberSeedsEntity seeds(int seeds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NumberSeedsEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NumberSeedsEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  NumberSeedsEntity call({
    int? repetitions,
    int? seeds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNumberSeedsEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNumberSeedsEntity.copyWith.fieldName(...)`
class _$NumberSeedsEntityCWProxyImpl implements _$NumberSeedsEntityCWProxy {
  final NumberSeedsEntity _value;

  const _$NumberSeedsEntityCWProxyImpl(this._value);

  @override
  NumberSeedsEntity repetitions(int repetitions) =>
      this(repetitions: repetitions);

  @override
  NumberSeedsEntity seeds(int seeds) => this(seeds: seeds);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NumberSeedsEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NumberSeedsEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  NumberSeedsEntity call({
    Object? repetitions = const $CopyWithPlaceholder(),
    Object? seeds = const $CopyWithPlaceholder(),
  }) {
    return NumberSeedsEntity(
      repetitions:
          repetitions == const $CopyWithPlaceholder() || repetitions == null
              ? _value.repetitions
              // ignore: cast_nullable_to_non_nullable
              : repetitions as int,
      seeds: seeds == const $CopyWithPlaceholder() || seeds == null
          ? _value.seeds
          // ignore: cast_nullable_to_non_nullable
          : seeds as int,
    );
  }
}

extension $NumberSeedsEntityCopyWith on NumberSeedsEntity {
  /// Returns a callable class that can be used as follows: `instanceOfNumberSeedsEntity.copyWith(...)` or like so:`instanceOfNumberSeedsEntity.copyWith.fieldName(...)`.
  _$NumberSeedsEntityCWProxy get copyWith =>
      _$NumberSeedsEntityCWProxyImpl(this);
}
