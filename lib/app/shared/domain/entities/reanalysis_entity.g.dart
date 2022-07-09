// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reanalysis_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReanalysisEntityCWProxy {
  ReanalysisEntity analiseId(String analiseId);

  ReanalysisEntity id(String? id);

  ReanalysisEntity interpretationId(String interpretationId);

  ReanalysisEntity reinterpretations(
      List<ReinterpretationEntity> reinterpretations);

  ReanalysisEntity repetitionId(String repetitionId);

  ReanalysisEntity u(String u);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReanalysisEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReanalysisEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ReanalysisEntity call({
    String? analiseId,
    String? id,
    String? interpretationId,
    List<ReinterpretationEntity>? reinterpretations,
    String? repetitionId,
    String? u,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReanalysisEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReanalysisEntity.copyWith.fieldName(...)`
class _$ReanalysisEntityCWProxyImpl implements _$ReanalysisEntityCWProxy {
  final ReanalysisEntity _value;

  const _$ReanalysisEntityCWProxyImpl(this._value);

  @override
  ReanalysisEntity analiseId(String analiseId) => this(analiseId: analiseId);

  @override
  ReanalysisEntity id(String? id) => this(id: id);

  @override
  ReanalysisEntity interpretationId(String interpretationId) =>
      this(interpretationId: interpretationId);

  @override
  ReanalysisEntity reinterpretations(
          List<ReinterpretationEntity> reinterpretations) =>
      this(reinterpretations: reinterpretations);

  @override
  ReanalysisEntity repetitionId(String repetitionId) =>
      this(repetitionId: repetitionId);

  @override
  ReanalysisEntity u(String u) => this(u: u);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReanalysisEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReanalysisEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ReanalysisEntity call({
    Object? analiseId = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? interpretationId = const $CopyWithPlaceholder(),
    Object? reinterpretations = const $CopyWithPlaceholder(),
    Object? repetitionId = const $CopyWithPlaceholder(),
    Object? u = const $CopyWithPlaceholder(),
  }) {
    return ReanalysisEntity(
      analiseId: analiseId == const $CopyWithPlaceholder() || analiseId == null
          ? _value.analiseId
          // ignore: cast_nullable_to_non_nullable
          : analiseId as String,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      interpretationId: interpretationId == const $CopyWithPlaceholder() ||
              interpretationId == null
          ? _value.interpretationId
          // ignore: cast_nullable_to_non_nullable
          : interpretationId as String,
      reinterpretations: reinterpretations == const $CopyWithPlaceholder() ||
              reinterpretations == null
          ? _value.reinterpretations
          // ignore: cast_nullable_to_non_nullable
          : reinterpretations as List<ReinterpretationEntity>,
      repetitionId:
          repetitionId == const $CopyWithPlaceholder() || repetitionId == null
              ? _value.repetitionId
              // ignore: cast_nullable_to_non_nullable
              : repetitionId as String,
      u: u == const $CopyWithPlaceholder() || u == null
          ? _value.u
          // ignore: cast_nullable_to_non_nullable
          : u as String,
    );
  }
}

extension $ReanalysisEntityCopyWith on ReanalysisEntity {
  /// Returns a callable class that can be used as follows: `instanceOfReanalysisEntity.copyWith(...)` or like so:`instanceOfReanalysisEntity.copyWith.fieldName(...)`.
  _$ReanalysisEntityCWProxy get copyWith => _$ReanalysisEntityCWProxyImpl(this);
}
