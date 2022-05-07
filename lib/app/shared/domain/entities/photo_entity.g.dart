// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PhotoEntityCWProxy {
  PhotoEntity name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhotoEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PhotoEntity call({
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPhotoEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPhotoEntity.copyWith.fieldName(...)`
class _$PhotoEntityCWProxyImpl implements _$PhotoEntityCWProxy {
  final PhotoEntity _value;

  const _$PhotoEntityCWProxyImpl(this._value);

  @override
  PhotoEntity name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhotoEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PhotoEntity call({
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return PhotoEntity(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $PhotoEntityCopyWith on PhotoEntity {
  /// Returns a callable class that can be used as follows: `instanceOfclass PhotoEntity.name.copyWith(...)` or like so:`instanceOfclass PhotoEntity.name.copyWith.fieldName(...)`.
  _$PhotoEntityCWProxy get copyWith => _$PhotoEntityCWProxyImpl(this);
}
