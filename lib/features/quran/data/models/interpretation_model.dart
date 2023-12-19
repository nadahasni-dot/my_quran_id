import '../../domain/entities/interpretation_entity.dart';

class InterpretationModel extends InterpretationEntity {
  const InterpretationModel({
    final int? id,
    final int? surah,
    final int? ayat,
    final String? tafsir,
  }) : super(
          id: id,
          surah: surah,
          ayat: ayat,
          tafsir: tafsir,
        );

  factory InterpretationModel.fromJson(Map<String, dynamic> json) =>
      InterpretationModel(
        id: json['id'],
        surah: json['surah'],
        ayat: json['ayat'],
        tafsir: json['tafsir'],
      );

  factory InterpretationModel.fromEntity(InterpretationEntity entity) =>
      InterpretationModel(
        id: entity.id,
        surah: entity.surah,
        ayat: entity.ayat,
        tafsir: entity.tafsir,
      );
}
