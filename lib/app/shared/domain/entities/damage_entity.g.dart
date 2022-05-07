// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'damage_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DamageEntityCWProxy {
  DamageEntity main(bool main);

  DamageEntity type(DamageType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DamageEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DamageEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  DamageEntity call({
    bool? main,
    DamageType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDamageEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDamageEntity.copyWith.fieldName(...)`
class _$DamageEntityCWProxyImpl implements _$DamageEntityCWProxy {
  final DamageEntity _value;

  const _$DamageEntityCWProxyImpl(this._value);

  @override
  DamageEntity main(bool main) => this(main: main);

  @override
  DamageEntity type(DamageType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DamageEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DamageEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  DamageEntity call({
    Object? main = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return DamageEntity(
      main: main == const $CopyWithPlaceholder() || main == null
          ? _value.main
          // ignore: cast_nullable_to_non_nullable
          : main as bool,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as DamageType,
    );
  }
}

extension $DamageEntityCopyWith on DamageEntity {
  /// Returns a callable class that can be used as follows: `instanceOfclass DamageEntity.name.copyWith(...)` or like so:`instanceOfclass DamageEntity.name.copyWith.fieldName(...)`.
  _$DamageEntityCWProxy get copyWith => _$DamageEntityCWProxyImpl(this);
}
