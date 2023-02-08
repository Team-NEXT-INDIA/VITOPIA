class Invoice {
  String? bANKNAME;
  String? bANKTXNID;
  String? cHECKSUMHASH;
  String? cURRENCY;
  String? gATEWAYNAME;
  String? mID;
  String? oRDERID;
  String? pAYMENTMODE;
  String? rESPCODE;
  String? rESPMSG;
  String? sKU;
  String? sTATUS;
  String? tXNAMOUNT;
  String? tXNDATE;
  String? tXNID;
  String? oUTSTATUS;

  Invoice(
      {this.bANKNAME,
      this.bANKTXNID,
      this.cHECKSUMHASH,
      this.cURRENCY,
      this.gATEWAYNAME,
      this.mID,
      this.oRDERID,
      this.pAYMENTMODE,
      this.rESPCODE,
      this.rESPMSG,
      this.sKU,
      this.sTATUS,
      this.tXNAMOUNT,
      this.tXNDATE,
      this.tXNID,
      this.oUTSTATUS});

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      bANKNAME: json['BANKNAME'] ?? "",
      bANKTXNID: json['BANKTXNID'] ?? "",
      cHECKSUMHASH: json['CHECKSUMHASH'] ?? "",
      cURRENCY: json['CURRENCY'] ?? "",
      gATEWAYNAME: json['GATEWAYNAME'] ?? "",
      mID: json['MID'] ?? "",
      oRDERID: json['ORDERID'] ?? "",
      pAYMENTMODE: json['PAYMENTMODE'] ?? "",
      rESPCODE: json['RESPCODE'] ?? "",
      rESPMSG: json['RESPMSG'] ?? "",
      sKU: json['SKU'] ?? "",
      sTATUS: json['STATUS'] ?? "",
      tXNAMOUNT: json['TXNAMOUNT'] ?? "",
      tXNDATE: json['TXNDATE'] ?? "",
      tXNID: json['TXNID'] ?? "",
      oUTSTATUS: json['OUT_STATUS'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BANKNAME'] = this.bANKNAME;
    data['BANKTXNID'] = this.bANKTXNID;
    data['CHECKSUMHASH'] = this.cHECKSUMHASH;
    data['CURRENCY'] = this.cURRENCY;
    data['GATEWAYNAME'] = this.gATEWAYNAME;
    data['MID'] = this.mID;
    data['ORDERID'] = this.oRDERID;
    data['PAYMENTMODE'] = this.pAYMENTMODE;
    data['RESPCODE'] = this.rESPCODE;
    data['RESPMSG'] = this.rESPMSG;
    data['SKU'] = this.sKU;
    data['STATUS'] = this.sTATUS;
    data['TXNAMOUNT'] = this.tXNAMOUNT;
    data['TXNDATE'] = this.tXNDATE;
    data['TXNID'] = this.tXNID;
    data['OUT_STATUS'] = this.oUTSTATUS;
    return data;
  }
}

// ===================================================== //

class Invoiceproduct {
  String? sKU;
  int? categoryId;
  String? description;
  int? id;
  String? image;
  String? name;
  String? price;
  String? subCategory;

  Invoiceproduct(
      {this.sKU,
      this.categoryId,
      this.description,
      this.id,
      this.image,
      this.name,
      this.price,
      this.subCategory});

  factory Invoiceproduct.fromJson(Map<String, dynamic> json) {
    return Invoiceproduct(
      sKU: json['SKU'] ?? "",
      categoryId: json['category_id'] ?? "",
      description: json['description'] ?? "",
      id: json['id'] ?? "",
      image: json['image'] ?? "",
      name: json['name'] ?? "",
      price: json['price'] ?? "",
      subCategory: json['sub_category'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SKU'] = this.sKU;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    data['sub_category'] = this.subCategory;
    return data;
  }
}
