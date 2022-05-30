// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ResumeEntityCWProxy {
  ResumeEntity damageSumary18(Map<DamageType, int> damageSumary18);

  ResumeEntity damageSumary68(Map<DamageType, int> damageSumary68);

  ResumeEntity id(String? id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ResumeEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ResumeEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ResumeEntity call({
    Map<DamageType, int>? damageSumary18,
    Map<DamageType, int>? damageSumary68,
    String? id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfResumeEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfResumeEntity.copyWith.fieldName(...)`
class _$ResumeEntityCWProxyImpl implements _$ResumeEntityCWProxy {
  final ResumeEntity _value;

  const _$ResumeEntityCWProxyImpl(this._value);

  @override
  ResumeEntity damageSumary18(Map<DamageType, int> damageSumary18) =>
      this(damageSumary18: damageSumary18);

  @override
  ResumeEntity damageSumary68(Map<DamageType, int> damageSumary68) =>
      this(damageSumary68: damageSumary68);

  @override
  ResumeEntity id(String? id) => this(id: id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ResumeEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ResumeEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ResumeEntity call({
    Object? damageSumary18 = const $CopyWithPlaceholder(),
    Object? damageSumary68 = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return ResumeEntity(
      damageSumary18: damageSumary18 == const $CopyWithPlaceholder() ||
              damageSumary18 == null
          ? _value.damageSumary18
          // ignore: cast_nullable_to_non_nullable
          : damageSumary18 as Map<DamageType, int>,
      damageSumary68: damageSumary68 == const $CopyWithPlaceholder() ||
              damageSumary68 == null
          ? _value.damageSumary68
          // ignore: cast_nullable_to_non_nullable
          : damageSumary68 as Map<DamageType, int>,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
    );
  }
}

extension $ResumeEntityCopyWith on ResumeEntity {
  /// Returns a callable class that can be used as follows: `instanceOfResumeEntity.copyWith(...)` or like so:`instanceOfResumeEntity.copyWith.fieldName(...)`.
  _$ResumeEntityCWProxy get copyWith => _$ResumeEntityCWProxyImpl(this);
}
