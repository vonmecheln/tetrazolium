// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnalysisEntityCWProxy {
  AnalysisEntity concentration(double concentration);

  AnalysisEntity date(DateTime date);

  AnalysisEntity id(String? id);

  AnalysisEntity local(String local);

  AnalysisEntity numberSeeds(NumberSeedsEntity numberSeeds);

  AnalysisEntity repetitions(List<RepetitionEntity> repetitions);

  AnalysisEntity sample(String sample);

  AnalysisEntity viability(int viability);

  AnalysisEntity vigor(int vigor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnalysisEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnalysisEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  AnalysisEntity call({
    double? concentration,
    DateTime? date,
    String? id,
    String? local,
    NumberSeedsEntity? numberSeeds,
    List<RepetitionEntity>? repetitions,
    String? sample,
    int? viability,
    int? vigor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnalysisEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnalysisEntity.copyWith.fieldName(...)`
class _$AnalysisEntityCWProxyImpl implements _$AnalysisEntityCWProxy {
  final AnalysisEntity _value;

  const _$AnalysisEntityCWProxyImpl(this._value);

  @override
  AnalysisEntity concentration(double concentration) =>
      this(concentration: concentration);

  @override
  AnalysisEntity date(DateTime date) => this(date: date);

  @override
  AnalysisEntity id(String? id) => this(id: id);

  @override
  AnalysisEntity local(String local) => this(local: local);

  @override
  AnalysisEntity numberSeeds(NumberSeedsEntity numberSeeds) =>
      this(numberSeeds: numberSeeds);

  @override
  AnalysisEntity repetitions(List<RepetitionEntity> repetitions) =>
      this(repetitions: repetitions);

  @override
  AnalysisEntity sample(String sample) => this(sample: sample);

  @override
  AnalysisEntity viability(int viability) => this(viability: viability);

  @override
  AnalysisEntity vigor(int vigor) => this(vigor: vigor);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnalysisEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnalysisEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  AnalysisEntity call({
    Object? concentration = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? local = const $CopyWithPlaceholder(),
    Object? numberSeeds = const $CopyWithPlaceholder(),
    Object? repetitions = const $CopyWithPlaceholder(),
    Object? sample = const $CopyWithPlaceholder(),
    Object? viability = const $CopyWithPlaceholder(),
    Object? vigor = const $CopyWithPlaceholder(),
  }) {
    return AnalysisEntity(
      concentration:
          concentration == const $CopyWithPlaceholder() || concentration == null
              ? _value.concentration
              // ignore: cast_nullable_to_non_nullable
              : concentration as double,
      date: date == const $CopyWithPlaceholder() || date == null
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as DateTime,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      local: local == const $CopyWithPlaceholder() || local == null
          ? _value.local
          // ignore: cast_nullable_to_non_nullable
          : local as String,
      numberSeeds:
          numberSeeds == const $CopyWithPlaceholder() || numberSeeds == null
              ? _value.numberSeeds
              // ignore: cast_nullable_to_non_nullable
              : numberSeeds as NumberSeedsEntity,
      repetitions:
          repetitions == const $CopyWithPlaceholder() || repetitions == null
              ? _value.repetitions
              // ignore: cast_nullable_to_non_nullable
              : repetitions as List<RepetitionEntity>,
      sample: sample == const $CopyWithPlaceholder() || sample == null
          ? _value.sample
          // ignore: cast_nullable_to_non_nullable
          : sample as String,
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

extension $AnalysisEntityCopyWith on AnalysisEntity {
  /// Returns a callable class that can be used as follows: `instanceOfclass AnalysisEntity extends Entity.name.copyWith(...)` or like so:`instanceOfclass AnalysisEntity extends Entity.name.copyWith.fieldName(...)`.
  _$AnalysisEntityCWProxy get copyWith => _$AnalysisEntityCWProxyImpl(this);
}
