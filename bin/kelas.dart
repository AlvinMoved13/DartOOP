import 'package:intl/intl.dart';
const UMR = 2900000;

var numFormat = NumberFormat("#,000");
var dateFormat = DateFormat('yyyy-MM-dd');

abstract class karyawan { //superclass
  String npp = ""; //not nullable
  String Nama ;
  String? alamat; //nullable
  int tahunMasuk;
  int _gaji = 2900000;

  karyawan (this.npp, this.Nama, {this.tahunMasuk = 2015});

  void presensi (DateTime jamMasuk);

  String deskripsi (){
    String teks = """==========================
    NPP: $npp;
    Nama: $Nama;
    Gaji: ${numFormat.format(gaji)}
    """;
      if (alamat !=null){
        teks += '$alamat';
      }
      return teks;
  }

  int get tunjangan ;

  int get gaji => (_gaji + tunjangan);

  void set gaji(int gaji) {
    if (gaji > UMR) {
      _gaji =UMR;
      print("gaji tidak boleh UMR");
    } else {
      _gaji = gaji;
    }
  }
}

class staffBiasa extends karyawan{
  staffBiasa(super.npp, super.Nama, {tahunMasuk = 2015});

  @override
  void presensi(DateTime jamMasuk) {
    if ( jamMasuk.hour > 8) {
      print("$Nama ${dateFormat.format(jamMasuk)} Datang terlambat");
    } else {
      print("$Nama ${dateFormat.format(jamMasuk)} datang tepat waktu");
    }
  }

  @override
  int get tunjangan => ((2023 - tahunMasuk) < 5) ? 500000 : 1000000;
}

enum TipeJabatan {kabag, manajer, direktur}

class pejabat extends karyawan{
  TipeJabatan jabatan;

  pejabat(super.npp, super.Nama, this.jabatan);

  @override
  void presensi(DateTime jamMasuk) {
    if ( jamMasuk.hour > 10) {
      print("$Nama Datang terlambat");
    } else {
      print("$Nama datang tepat waktu");
    }
  }

  @override
  int get tunjangan {
    if (jabatan == TipeJabatan.kabag) {
      return 1500000;
    } else if (jabatan == TipeJabatan.manajer){
      return 2500000;
    } else {
      return 5000000;
    }
  }

  @override
  String deskripsi() {
    String teks = super.deskripsi();
    teks += "jabatan: ${jabatan.name}";
    return teks;
  }
}




  