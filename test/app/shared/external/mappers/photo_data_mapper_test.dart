import 'package:flutter_test/flutter_test.dart';
import 'package:tetrazolium/app/shared/domain/entities/photo_entity.dart';
import 'package:tetrazolium/app/shared/external/mappers/photo_data_mapper.dart';

void main() {
  group('photo data mapper ...', () {
    test('deve converter um map em um objeto do tipo PhotoEntity', () {
      final photo = PhotoMapper.fromMap({'name': 'name'});

      expect(photo, isA<PhotoEntity>());
      expect(photo.name, 'name');
    });

    test('deve converte PhotoEntity to Map', () {
      final photo = PhotoEntity(name: 'name');
      final map = PhotoMapper.toMap(photo);

      expect(map['name'], 'name');
    });
  });
}
