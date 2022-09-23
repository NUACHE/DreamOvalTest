class HomeModel {
  String? collectionId;
  String? name;
  String? description;
  String? categoryId;
  String? collectionType;
  String? serviceCode;
  String? logoUrl;
  bool? oneTimePayment;
  bool? hasCustomerSegmentations;
  bool? hasFixedDenominations;
  String? referenceField;
  String? contactField;
  String? referenceRegex;
  String? contactRegex;
  bool? reversible;
  bool? serviceType;
  int? fixedCharge;
  int? percentCharge;
  int? minAmount;
  int? maxAmount;
  int? minCharge;
  int? maxCharge;
  int? exchangeRate;
  List? fixedBillItems;
  String? denominations;
  String? referenceList;
  String? forms;
  List? supportedCurrencies;

  HomeModel({
    this.collectionId,
    this.name,
    this.description,
    this.categoryId,
    this.collectionType,
    this.serviceCode,
    this.logoUrl,
    this.oneTimePayment,
    this.hasCustomerSegmentations,
    this.hasFixedDenominations,
    this.referenceField,
    this.contactField,
    this.referenceRegex,
    this.contactRegex,
    this.reversible,
    this.serviceType,
    this.fixedCharge,
    this.percentCharge,
    this.minAmount,
    this.maxAmount,
    this.minCharge,
    this.maxCharge,
    this.exchangeRate,
    this.fixedBillItems,
    this.denominations,
    this.referenceList,
    this.forms,
    this.supportedCurrencies,
  });

  factory HomeModel.fromJson(dynamic json) {
    return HomeModel(
      collectionId: json['collectionId'].toString(),
      name: json['name'],
      categoryId: json['categoryId'].toString(),
      description: json['description'],
      serviceCode: json['serviceCode'],
      logoUrl: json['logoUrl'],
      collectionType: json['collectionType'],
      oneTimePayment: json['oneTimePayment'],
      hasCustomerSegmentations: json['hasCustomerSegmentations'],
      hasFixedDenominations: json['hasFixedDenominations'],
      referenceField: json['referenceField'],
      contactField: json['contactField'],
      referenceRegex: json['referenceRegex'],
      contactRegex: json['contactRegex'],
      reversible: json['reversible'],
      serviceType: json['serviceType'],
      fixedCharge: json['fixedCharge'],
      percentCharge: json['percentCharge'],
      minAmount: json['minAmount'],
      maxAmount: json['maxAmount'],
      minCharge: json['minCharge'],
      maxCharge: json['maxCharge'],
      exchangeRate: json['exchangeRate'],
      fixedBillItems: json['fixedBillItems'],
      denominations: json['denominations'],
      referenceList: json['referenceList'],
      forms: json['forms'],
      supportedCurrencies: json['supportedCurrencies'],
    );
  }
}
