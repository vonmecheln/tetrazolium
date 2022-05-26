import 'package:copy_with_extension/copy_with_extension.dart';

part 'number_seeds_entity.g.dart';

@CopyWith()
// @JsonSerializable()
class NumberSeedsEntity {
  final int repetitions;
  final int seeds;

  NumberSeedsEntity({
    required this.repetitions,
    required this.seeds,
  });

  factory NumberSeedsEntity.r2s50() =>
      NumberSeedsEntity(repetitions: 2, seeds: 5);

  @override
  String toString() {
    return '${repetitions}x${seeds}';
  }
}
