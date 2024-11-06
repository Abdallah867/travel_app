enum PaymentMethod {
  edahabia,
  cib,
}

extension PaymentMethodExtension on PaymentMethod {
  String get name {
    switch (this) {
      case PaymentMethod.edahabia:
        return 'edahabia';
      case PaymentMethod.cib:
        return 'cib';
    }
  }
}

PaymentMethod getEnumPaymentMethod(String paymentMethod) {
  switch (paymentMethod) {
    case 'edahabia':
      return PaymentMethod.edahabia;
    case 'cib':
      return PaymentMethod.cib;
    default:
      return PaymentMethod.edahabia;
  }
}
