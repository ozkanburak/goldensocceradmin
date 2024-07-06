class UserModel {
  final id;
  final String? durum;
  final String? oran;
  final String? tahmin;
  final String? mac;
  final String? ulke;
  final String? zaman;

  UserModel({
    this.durum,
    this.oran,
    this.tahmin,
    this.mac,
    this.ulke,
    this.zaman,
    this.id,
  });

  Map<String, dynamic> addData() {
    return {
      'durum': durum,
      'oran': oran,
      'tahmin': tahmin,
      'mac': mac,
      'ulke': ulke,
      'zaman': zaman,
      
    };
  }
}

