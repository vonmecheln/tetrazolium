import 'package:tetrazolium/app/shared/domain/entities/index.dart';

class NumberSeedsMapper {
  static NumberSeedsEntity fromMap(Map<String, dynamic> json) =>
      NumberSeedsEntity(
        repetitions: json['repetitions'] as int,
        seeds: json['seeds'] as int,
      );

  static Map<String, dynamic> toMap(NumberSeedsEntity instance) =>
      <String, dynamic>{
        'repetitions': instance.repetitions,
        'seeds': instance.seeds,
      };
}
