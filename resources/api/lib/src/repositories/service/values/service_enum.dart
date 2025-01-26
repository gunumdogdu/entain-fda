// ignore_for_file: constant_identifier_names, sort_constructors_firs

enum FoodPaymentTypeEnum {
  PAYE,
  MULTINET,
  METROPOL,
  CIO_CARD,
  TICKET,
  SETCARD,
  SODEXO,
  YEMEKMATIK,
}

 enum PaymentTypeEnum {
  POS,
  PAYCELL,
  MULTINET,
  METROPOL,
  CASH,
  ONLINE,
  BANK_TRANSFER,
  CIO_CARD,
  FASTPAY,
  TICKET,
  SETCARD,
  SODEXO,
  GETIRPAY,
  TOKENFLEX,
  YEMEKMATIK,
  CUZDAN_PLUS,
  PAYE,
}

enum PaymentMethodEnum { QR, NFC, CASH, CC, NONE, DYNAMIC_QR }

enum LegalEnum {
  kvkk,
  cookie_policy,
  personal_data_protection_and_processing_policy
}

PaymentMethodEnum stringToPaymentMethodEnum(String paymentMethod) {
  switch (paymentMethod) {
    case 'QR':
      return PaymentMethodEnum.QR;
    case 'NFC':
      return PaymentMethodEnum.NFC;
    case 'CASH':
      return PaymentMethodEnum.CASH;
    case 'CC':
      return PaymentMethodEnum.CC;
    case 'NONE':
      return PaymentMethodEnum.NONE;
    case 'DYNAMIC_QR':
      return PaymentMethodEnum.DYNAMIC_QR;
    default:
      throw Exception('Unknown payment method string: $paymentMethod');
  }
}

enum PanelFilterDateEnum {
  TODAY,
  YESTERDAY,
  THIS_WEEK,
  THIS_MONTH,
  THIS_YEAR,
  LAST_5_YEARS,
  MONTH,
  YEAR,
}

enum ApplicationProcessStatus {
  PRE_WAITING,
  PRE_APPLICATION_REJECT,
  PRE_APPROVED,
  WAITING,
  INCOMPLETE_DOCUMENT,
  APPROVED,
  CANCELLED,
}

enum ApplicationTypeEnum {
  HAVE_A_COMPANY,
  INDIVIDUAL,
}

enum CompanyTypeEnum { AS, LTD, SHS }

enum AppliedProductEnum {
  ANDROID_POS,
  VIRTUAL_POS,
  PAID_WITH_LINK,
}

enum AppliedPosEnum { PAYCELL_ANDROID_POS }

enum OrderStatusEnum {
  SUCCESS('Başarılı'),
  CANCEL('İptal'),
  WAITING('Bekliyor'),
  FAIL('Başarısız');

  const OrderStatusEnum(this.value);

  final String value;
}

enum TransactionsStatusEnum {
  SUCCESS('Başarılı'),
  CANCEL('İptal'),
  FAIL('Başarısız');

  const TransactionsStatusEnum(this.value);

  final String value;
}

enum CancelFailEnums {
  CANCEL,
  FAIL,
}

enum DocumentStatusEnum {
  SUCCESS('Başarılı'),
  CANCEL('İptal'),
  WAITING('Bekliyor'),
  NOT_RESPONSE('Başarısız');

  const DocumentStatusEnum(this.value);

  final String value;
}

enum SourceTypeEnum { WEB, APP }

enum DaysofTheWeek {
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY,
  SUNDAY,
}

enum SettingGeneralSettingEnum {
  GENERAL,
  WORKINGHOURS,
  SHORTCODES,
  SERVICEAREAS,
  PRINTERSETTINGS,
  APISETTINGS,
}

enum UserChipEnum {
  BIREYSEL,
  KURUMSAL,
}

enum DocumentTypeEnum {
  EARSIV,
  EFATURA,
  BILGIFISI,
}

enum ProfileStatusEnum {
  ACTIVE(value: true),
  PASSIVE(value: false);

  const ProfileStatusEnum({required this.value});
  final bool value;
}

enum MonthEnum {
  January,
  February,
  March,
  April,
  May,
  June,
  July,
  August,
  September,
  October,
  November,
  December,
}

enum AccountSettingsScreenEnum {
  COMPONYINFORMATION,
  BILLINGINFORMATION,
  SUBSCRIPTIONINFORMATION,
  REGIONS,
  BRANCHES,
}

enum UserRoleEnum { AUTHORIZED, DRIVER, CASHIER, COURIER }

enum ProductEditOrAddEnum { EDIT, PRODEDIT, NEW }

enum AddUserEnum { NEW, EDIT }

enum ProductTypeEnum {
  PHYSICALLY('Fiziksel'),
  VIRTUAL('Sanal'),
  INFO('Bilgi'),
  DSN('DSN'),
  MD('Matrah Dışı');

  const ProductTypeEnum(this.value);

  final String value;
}

enum UnitsEnum { ADET, KG, GR, LT, MT, KOLI, PAKET }

enum UserAuthorizationEnum { USER, CANCEL, REFUND, PRODUCT, DISCOUNT }

enum SignUpSourceEnum { MOBILE, WEB }

enum YesOrNo { Y, N }

enum ValorEnums { DAILY, MONTHLY, WEEKLY }

enum InvoiceTypeEnums {
  VUK507,
  EFT_POS,
}

enum LoginStatusEnums {
  COMPLETED,
  PIN_CODE_NOT_FOUND,
}

enum FoodCardsTypeEnum {
  TURKCELL,
  MULTINET,
  METROPOL,
  PAYE,
}

enum FoodCardTypesCreateEnums {
  PAYCELL,
  MULTINET,
  METROPOL,
  PAYE,
  SODEXO,
  TOKENFLEX,
}

enum CustomerPageEnum {
  EDIT,
  NEW,
}

enum WalletTypeEnum { POSTPAID, PREPAID }

enum CardTypeEnum { CUZDANPLUS, IDENTITY, SPECIAL }

enum TaksiExcelTypeEnum { NTS, TURNOVER }
