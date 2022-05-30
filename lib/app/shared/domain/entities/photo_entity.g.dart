// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PhotoEntityCWProxy {
  PhotoEntity name(String name);

  PhotoEntity type(PhotoType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhotoEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PhotoEntity call({
    String? name,
    PhotoType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPhotoEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPhotoEntity.copyWith.fieldName(...)`
class _$PhotoEntityCWProxyImpl implements _$PhotoEntityCWProxy {
  final PhotoEntity _value;

  const _$PhotoEntityCWProxyImpl(this._value);

  @override
  PhotoEntity name(String name) => this(name: name);

  @override
  PhotoEntity type(PhotoType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhotoEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PhotoEntity call({
    Object? name = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return PhotoEntity(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as PhotoType,
    );
  }
}

extension $PhotoEntityCopyWith on PhotoEntity {
  /// Returns a callable class that can be used as follows: `instanceOfPhotoEntity.copyWith(...)` or like so:`instanceOfPhotoEntity.copyWith.fieldName(...)`.
  _$PhotoEntityCWProxy get copyWith => _$PhotoEntityCWProxyImpl(this);
}
