class ProcurmentRequest {
  final String b2cSellerAppId;
  final String token;
  final String companyOrIndividualName;
  final String gstinOrPanTanAnyGovtId;
  final String city;
  final String state;
  final String countryNameOrIsnCode;
  final List<String> pincodes;
  final String contactPersonName;
  final String contactPersonMobile;
  final String operation;
  final String redirectUrl;
  ProcurmentRequest({
    required this.b2cSellerAppId,
    required this.token,
    required this.companyOrIndividualName,
    required this.gstinOrPanTanAnyGovtId,
    required this.city,
    required this.state,
    required this.countryNameOrIsnCode,
    required this.pincodes,
    required this.contactPersonName,
    required this.contactPersonMobile,
    required this.operation,
    required this.redirectUrl,
  });

  factory ProcurmentRequest.fromJson(Map<String, dynamic> json) {
    return ProcurmentRequest(
      b2cSellerAppId: json['b2c-seller-app-id'],
      token: json['token'],
      companyOrIndividualName: json['company-or-individual-name'],
      gstinOrPanTanAnyGovtId: json['gstin-or-pan-tan-any-govt-id'],
      city: json['city'],
      state: json['state'],
      countryNameOrIsnCode: json['country-name-or-isn-code'],
      pincodes: List<String>.from(json['pincodes']),
      contactPersonName: json['contact-person-name'],
      contactPersonMobile: json['contact-person-mobile'],
      operation: json['operation'],
      redirectUrl: json['redirect_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'b2c-seller-app-id': b2cSellerAppId,
      'token': token,
      'company-or-individual-name': companyOrIndividualName,
      'gstin-or-pan-tan-any-govt-id': gstinOrPanTanAnyGovtId,
      'city': city,
      'state': state,
      'country-name-or-isn-code': countryNameOrIsnCode,
      'pincodes': pincodes,
      'contact-person-name': contactPersonName,
      'contact-person-mobile': contactPersonMobile,
      'operation': operation,
      'redirect_url': redirectUrl,
    };
  }
}
