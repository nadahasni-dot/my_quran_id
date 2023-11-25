import 'package:equatable/equatable.dart';

class InterpretationEntity extends Equatable {
  final int? id;
  final int? surah;
  final int? ayat;
  final String? tafsir;

  const InterpretationEntity({
    required this.id,
    required this.surah,
    required this.ayat,
    required this.tafsir,
  });

  @override
  List<Object?> get props => [
        id,
        surah,
        ayat,
        tafsir,
      ];
}
