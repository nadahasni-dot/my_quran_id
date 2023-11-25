// {
//             "id": 1,
//             "surah": 1,
//             "nomor": 1,
//             "ar": "بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ",
//             "tr": "bismillāhir-raḥmānir-raḥīm(i).",
//             "idn": "Dengan nama Allah Yang Maha Pengasih, Maha Penyayang."
//         },

import 'package:equatable/equatable.dart';

class VerseEntity extends Equatable {
  final int? id;
  final int? surah;
  final int? nomor;
  final String? ar;
  final String? tr;
  final String? idn;

  const VerseEntity({
    required this.id,
    required this.surah,
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.idn,
  });

  @override
  List<Object?> get props => [
        id,
        surah,
        nomor,
        ar,
        tr,
        idn,
      ];
}
