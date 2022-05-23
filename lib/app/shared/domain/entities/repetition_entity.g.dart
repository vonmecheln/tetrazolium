// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repetition_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RepetitionEntityCWProxy {
  RepetitionEntity id(String? id);

  RepetitionEntity interpretations(List<InterpretationEntity> interpretations);

  RepetitionEntity number(int number);

  RepetitionEntity resultClassication(Map<int, int> resultClassication);

  RepetitionEntity resume(ResumeEntity resume);

  RepetitionEntity state(RepetitionState state);

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
    List<InterpretationEntity>? interpretations,
    int? number,
    Map<int, int>? resultClassication,
    ResumeEntity? resume,
    RepetitionState? state,
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
  RepetitionEntity interpretations(
          List<InterpretationEntity> interpretations) =>
      this(interpretations: interpretations);

  @override
  RepetitionEntity number(int number) => this(number: number);

  @override
  RepetitionEntity resultClassication(Map<int, int> resultClassication) =>
      this(resultClassication: resultClassication);

  @override
  RepetitionEntity resume(ResumeEntity resume) => this(resume: resume);

  @override
  RepetitionEntity state(RepetitionState state) => this(state: state);

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
    Object? interpretations = const $CopyWithPlaceholder(),
    Object? number = const $CopyWithPlaceholder(),
    Object? resultClassication = const $CopyWithPlaceholder(),
    Object? resume = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? viability = const $CopyWithPlaceholder(),
    Object? vigor = const $CopyWithPlaceholder(),
  }) {
    return RepetitionEntity(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      interpretations: interpretations == const $CopyWithPlaceholder() ||
              interpretations == null
          ? _value.interpretations
          // ignore: cast_nullable_to_non_nullable
          : interpretations as List<InterpretationEntity>,
      number: number == const $CopyWithPlaceholder() || number == null
          ? _value.number
          // ignore: cast_nullable_to_non_nullable
          : number as int,
      resultClassication: resultClassication == const $CopyWithPlaceholder() ||
              resultClassication == null
          ? _value.resultClassication
          // ignore: cast_nullable_to_non_nullable
          : resultClassication as Map<int, int>,
      resume: resume == const $CopyWithPlaceholder() || resume == null
          ? _value.resume
          // ignore: cast_nullable_to_non_nullable
          : resume as ResumeEntity,
      state: state == const $CopyWithPlaceholder() || state == null
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as RepetitionState,
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
