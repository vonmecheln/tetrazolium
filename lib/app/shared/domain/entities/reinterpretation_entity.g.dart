// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reinterpretation_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReinterpretationEntityCWProxy {
  ReinterpretationEntity classification(int classification);

  ReinterpretationEntity damages(List<DamageEntity> damages);

  ReinterpretationEntity id(String? id);

  ReinterpretationEntity u(String u);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReinterpretationEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReinterpretationEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ReinterpretationEntity call({
    int? classification,
    List<DamageEntity>? damages,
    String? id,
    String? u,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReinterpretationEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReinterpretationEntity.copyWith.fieldName(...)`
class _$ReinterpretationEntityCWProxyImpl
    implements _$ReinterpretationEntityCWProxy {
  final ReinterpretationEntity _value;

  const _$ReinterpretationEntityCWProxyImpl(this._value);

  @override
  ReinterpretationEntity classification(int classification) =>
      this(classification: classification);

  @override
  ReinterpretationEntity damages(List<DamageEntity> damages) =>
      this(damages: damages);

  @override
  ReinterpretationEntity id(String? id) => this(id: id);

  @override
  ReinterpretationEntity u(String u) => this(u: u);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReinterpretationEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReinterpretationEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ReinterpretationEntity call({
    Object? classification = const $CopyWithPlaceholder(),
    Object? damages = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? u = const $CopyWithPlaceholder(),
  }) {
    return ReinterpretationEntity(
      classification: classification == const $CopyWithPlaceholder() ||
              classification == null
          ? _value.classification
          // ignore: cast_nullable_to_non_nullable
          : classification as int,
      damages: damages == const $CopyWithPlaceholder() || damages == null
          ? _value.damages
          // ignore: cast_nullable_to_non_nullable
          : damages as List<DamageEntity>,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      u: u == const $CopyWithPlaceholder() || u == null
          ? _value.u
          // ignore: cast_nullable_to_non_nullable
          : u as String,
    );
  }
}

extension $ReinterpretationEntityCopyWith on ReinterpretationEntity {
  /// Returns a callable class that can be used as follows: `instanceOfReinterpretationEntity.copyWith(...)` or like so:`instanceOfReinterpretationEntity.copyWith.fieldName(...)`.
  _$ReinterpretationEntityCWProxy get copyWith =>
      _$ReinterpretationEntityCWProxyImpl(this);
}
