
import 'kelas.dart';

void main(List<String> arguments) {
  List<karyawan> dataKaryawan = genData(dummyData());

  dataKaryawan[0].presensi(DateTime.parse('2023-08-08 07:00:00'));
  dataKaryawan[1].presensi(DateTime.parse('2023-08-08 09:00:00'));
  dataKaryawan[2].presensi(DateTime.parse('2023-08-08 08:30:00'));

  dataKaryawan[1].gaji = 500000;
  dataKaryawan[2].gaji = 5000000;

  dataKaryawan[0].alamat = "semarang, Indonesia"; 

  for (var staff in dataKaryawan) {
    print(staff.deskripsi());
  }
}

List<karyawan> genData (var listData) {
  List<karyawan> data = [];

  for (var dtPegawai in listData) {
    karyawan pegawai;
    if(dtPegawai.containsKey('jabatan')){
      pegawai = pejabat(dtPegawai['npp'], dtPegawai['nama'], dtPegawai['jabatan']);
    } else {
      pegawai = staffBiasa(dtPegawai['npp'], dtPegawai['nama']);
    }

    if(dtPegawai.containsKey('tahun_masuk')){
      pegawai.tahunMasuk = dtPegawai['tahun_masuk'];
    }
    
    if(dtPegawai.containsKey('alamat')){
      pegawai.alamat = dtPegawai['alamat'];
    }

    data.add(pegawai);    
  }

  return data;
}

List<Map<String, dynamic>> dummyData(){
  List<Map<String, dynamic>> data = [
    {
      "npp": "A123",
      "nama": "Lars Bak",
      "tahun_masuk": 2017,
      "jabatan": TipeJabatan.direktur,
      "alamat":"Semarang, Indonesia",
    },
        {
      "npp": "C123",
      "nama": "JackBowe",
      "tahun_masuk": 2015,
      "jabatan": TipeJabatan.kabag,
      "alamat":"California, America",
    }
  ];
  return data;
}