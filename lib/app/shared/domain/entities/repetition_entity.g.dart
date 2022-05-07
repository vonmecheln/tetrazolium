// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repetition_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RepetitionEntityCWProxy {
  RepetitionEntity id(String? id);

  RepetitionEntity interpretation(List<InterpretationEntity> interpretation);

  RepetitionEntity number(int number);

  RepetitionEntity viability(int viability);

  RepetitionEntity vigor(int vigor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RepetitionEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RepetitionEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  RepetitionEntity call({
    String? id,
    List<InterpretationEntity>? interpretation,
    int? number,
    int? viability,
    int? vigor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRepetitionEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRepetitionEntity.copyWith.fieldName(...)`
class _$RepetitionEntityCWProxyImpl implements _$RepetitionEntityCWProxy {
  final RepetitionEntity _value;

  const _$RepetitionEntityCWProxyImpl(this._value);

  @override
  RepetitionEntity id(String? id) => this(id: id);

  @override
  RepetitionEntity interpretation(List<InterpretationEntity> interpretation) =>
      this(interpretation: interpretation);

  @override
  RepetitionEntity number(int number) => this(number: number);

  @override
  RepetitionEntity viability(int viability) => this(viability: viability);

  @override
  RepetitionEntity vigor(int vigor) => this(vigor: vigor);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RepetitionEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RepetitionEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  RepetitionEntity call({
    Object? id = const $CopyWithPlaceholder(),
    Object? interpretation = const $CopyWithPlaceholder(),
    Object? number = const $CopyWithPlaceholder(),
    Object? viability = const $CopyWithPlaceholder(),
    Object? vigor = const $CopyWithPlaceholder(),
  }) {
    return RepetitionEntity(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      interpretation: interpretation == const $CopyWithPlaceholder() ||
              interpretation == null
          ? _value.interpretation
          // ignore: cast_nullable_to_non_nullable
          : interpretation as List<InterpretationEntity>,
      number: number == const $CopyWithPlaceholder() || number == null
          ? _value.number
          // ignore: cast_nullable_to_non_nullable
          : number as int,
      viability: viability == const $CopyWithPlaceholder() || viability == null
          ? _value.viability
          // ignore: cast_nullable_to_non_nullable
          : viability as int,
      vigor: vigor == const $CopyWithPlaceholder() || vigor == null
          ? _value.vigor
          // ignore: cast_nullable_to_non_nullable
          : vigor as int,
    );
  }
}

extension $RepetitionEntityCopyWith on RepetitionEntity {
  /// Returns a callable class that can be used as follows: `instanceOfclass RepetitionEntity extends Entity.name.copyWith(...)` or like so:`instanceOfclass RepetitionEntity extends Entity.name.copyWith.fieldName(...)`.
  _$RepetitionEntityCWProxy get copyWith => _$RepetitionEntityCWProxyImpl(this);
}
