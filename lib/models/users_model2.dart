class UserModel2 {
  
  final String? durum1;
  final String? oran1;
  final String? tahmin1;
  final String? mac1;
  final String? ulke1;
  final String? zaman1;
  final String? oran2;
  final String? tahmin2;
  final String? mac2;
  final String? ulke2;
  final String? zaman2;
  final String? toplam;
  final String? tarih;
  final id;
  

  UserModel2({
    this.durum1,
    this.oran1,
    this.tahmin1,
    this.mac1,
    this.ulke1,
    this.zaman1,
    this.oran2,
    this.tahmin2,
    this.mac2,
    this.ulke2,
    this.zaman2,
    this.toplam,
    this.tarih,
    this.id,
    
  });

  Map<String, dynamic> addData() {
    return {
      'durum': durum1,
      'oran1': oran1,
      'tahmin1': tahmin1,
      'mac1': mac1,
      'ulke1': ulke1,
      'zaman1': zaman1,
      'oran2': oran2,
      'tahmin2': tahmin2,
      'mac2': mac2,
      'ulke2': ulke2,
      'zaman2': zaman2,
      'toplam': toplam,
      'tarih': tarih,
      
    };
  }
}