// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interpretation_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InterpretationEntityCWProxy {
  InterpretationEntity classification(int classification);

  InterpretationEntity damages(List<DamageEntity> damages);

  InterpretationEntity id(String? id);

  InterpretationEntity photos(List<PhotoEntity> photos);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InterpretationEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InterpretationEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  InterpretationEntity call({
    int? classification,
    List<DamageEntity>? damages,
    String? id,
    List<PhotoEntity>? photos,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInterpretationEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInterpretationEntity.copyWith.fieldName(...)`
class _$InterpretationEntityCWProxyImpl
    implements _$InterpretationEntityCWProxy {
  final InterpretationEntity _value;

  const _$InterpretationEntityCWProxyImpl(this._value);

  @override
  InterpretationEntity classification(int classification) =>
      this(classification: classification);

  @override
  InterpretationEntity damages(List<DamageEntity> damages) =>
      this(damages: damages);

  @override
  InterpretationEntity id(String? id) => this(id: id);

  @override
  InterpretationEntity photos(List<PhotoEntity> photos) => this(photos: photos);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InterpretationEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InterpretationEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  InterpretationEntity call({
    Object? classification = const $CopyWithPlaceholder(),
    Object? damages = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? photos = const $CopyWithPlaceholder(),
  }) {
    return InterpretationEntity(
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
      photos: photos == const $CopyWithPlaceholder() || photos == null
          ? _value.photos
          // ignore: cast_nullable_to_non_nullable
          : photos as List<PhotoEntity>,
    );
  }
}

extension $InterpretationEntityCopyWith on InterpretationEntity {
  /// Returns a callable class that can be used as follows: `instanceOfclass InterpretationEntity extends Entity.name.copyWith(...)` or like so:`instanceOfclass InterpretationEntity extends Entity.name.copyWith.fieldName(...)`.
  _$InterpretationEntityCWProxy get copyWith =>
      _$InterpretationEntityCWProxyImpl(this);
}
