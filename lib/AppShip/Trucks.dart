class Trucks{
  String truckNumberId;
  String truckName;
  String qrcode;
  String plateNumber;
  String telephone;
  String id;

  Trucks( this.truckNumberId, this.truckName, this.qrcode, this.plateNumber, this.telephone,
      this.id);


  Map<String,dynamic>  ToMapDatabase(){
    return <String,dynamic>{
      'truckNumberId':truckNumberId,
      // 'id':id,
      'truckName':truckName,
      'qrcode':qrcode,
      'plateNumber':plateNumber,
      'telephone':telephone,
      'id':id,
    };
  }


  static  fromMap(Map c) {
    return Trucks(c['truckNumberId'],c['truckName'],c['qrcode'],c['plateNumber'],c['telephone'],c['id']);
  }



}