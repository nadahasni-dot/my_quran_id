import 'package:floor/floor.dart';

import '../../domain/entities/verse_entity.dart';

@Entity(tableName: 'bookmarked_verse', primaryKeys: ['id'])
class VerseModel extends VerseEntity {
  const VerseModel({
    int? id,
    int? surah,
    int? nomor,
    String? ar,
    String? tr,
    String? idn,
  }) : super(
          id: id,
          surah: surah,
          nomor: nomor,
          ar: ar,
          tr: tr,
          idn: idn,
        );

  factory VerseModel.fromJson(Map<String, dynamic> json) => VerseModel(
        id: json['id'],
        surah: json['surah'],
        nomor: json['nomor'],
        ar: json['ar'],
        tr: json['tr'],
        idn: json['idn'],
      );

  factory VerseModel.fromEntity(VerseEntity entity) => VerseModel(
        id: entity.id,
        surah: entity.surah,
        nomor: entity.nomor,
        ar: entity.ar,
        tr: entity.tr,
        idn: entity.idn,
      );
}
