import 'package:equatable/equatable.dart';

import 'interpretation_entity.dart';
import 'verse_entity.dart';

class SurahEntity extends Equatable {
  final int? nomor;
  final String? nama;
  final String? namaLatin;
  final int? jumlahAyat;
  final String? tempatTurun;
  final String? arti;
  final String? deskripsi;
  final String? audio;
  final List<VerseEntity>? ayat;
  final List<InterpretationEntity>? tafsir;
  final SurahEntity? suratSebelumnya;
  final SurahEntity? suratSelanjutnya;

  const SurahEntity({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
    required this.ayat,
    required this.tafsir,
    required this.suratSebelumnya,
    required this.suratSelanjutnya,
  });

  @override
  List<Object?> get props => [
        nomor,
        nama,
        namaLatin,
        jumlahAyat,
        tempatTurun,
        arti,
        deskripsi,
        audio,
        ayat,
        tafsir,
        suratSebelumnya,
        suratSelanjutnya,
      ];
}
