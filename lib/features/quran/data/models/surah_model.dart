import '../../domain/entities/interpretation_entity.dart';
import '../../domain/entities/surah_entity.dart';
import '../../domain/entities/verse_entity.dart';
import 'interpretation_model.dart';
import 'verse_model.dart';

class SurahModel extends SurahEntity {
  const SurahModel({
    int? nomor,
    String? nama,
    String? namaLatin,
    int? jumlahAyat,
    String? tempatTurun,
    String? arti,
    String? deskripsi,
    String? audio,
    List<VerseEntity>? ayat,
    List<InterpretationEntity>? tafsir,
    SurahEntity? suratSebelumnya,
    SurahEntity? suratSelanjutnya,
  }) : super(
          nomor: nomor,
          nama: nama,
          namaLatin: namaLatin,
          jumlahAyat: jumlahAyat,
          tempatTurun: tempatTurun,
          arti: arti,
          deskripsi: deskripsi,
          audio: audio,
          ayat: ayat,
          tafsir: tafsir,
          suratSebelumnya: suratSebelumnya,
          suratSelanjutnya: suratSelanjutnya,
        );

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        nomor: json['nomor'],
        nama: json['nama'],
        namaLatin: json['nama_latin'],
        jumlahAyat: json['jumlah_ayat'],
        tempatTurun: json['tempat_turun'],
        arti: json['arti'],
        deskripsi: json['deskripsi'],
        audio: json['audio'],
        ayat: json['ayat']
            ?.map<VerseModel>(
                (item) => VerseModel.fromJson(item as Map<String, dynamic>))
            .toList(),
        tafsir: json['tafsir']
            ?.map<InterpretationModel>((item) =>
                InterpretationModel.fromJson(item as Map<String, dynamic>))
            .toList(),
        // suratSebelumnya: json['surat_sebelumnya'] != false &&
        //         json['surat_sebelumnya'] != null
        //     ? json['surat_sebelumnya'].map(
        //         (item) => SurahModel.fromJson(item as Map<String, dynamic>))
        //     : null,
        // suratSelanjutnya: json['surat_selanjutnya'] != false &&
        //         json['surat_selanjutnya'] != null
        //     ? json['surat_selanjutnya'].map(
        //         (item) => SurahModel.fromJson(item as Map<String, dynamic>))
        //     : null,
      );

  factory SurahModel.fromEntity(SurahEntity entity) => SurahModel(
        nomor: entity.nomor,
        nama: entity.nama,
        namaLatin: entity.namaLatin,
        jumlahAyat: entity.jumlahAyat,
        tempatTurun: entity.tempatTurun,
        arti: entity.arti,
        deskripsi: entity.deskripsi,
        audio: entity.audio,
        ayat: entity.ayat,
        tafsir: entity.tafsir,
        suratSebelumnya: entity.suratSebelumnya,
        suratSelanjutnya: entity.suratSelanjutnya,
      );
}
