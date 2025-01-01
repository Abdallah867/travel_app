import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

enum PaymentStatus { paid, unpaid }

//TODO: REFACTOR USING CHATGPT TO USE O/C PRINCIPLE

extension PaymentStatusChipSpecs on PaymentStatus {
  Color get chipColor {
    switch (this) {
      case PaymentStatus.paid:
        return Colors.green.shade100;
      case PaymentStatus.unpaid:
        return Colors.red.shade100;
    }
  }

  Color get chipTextColor {
    switch (this) {
      case PaymentStatus.paid:
        return Colors.green;
      case PaymentStatus.unpaid:
        return Colors.red;
    }
  }

  String getName(BuildContext context) {
    switch (this) {
      case PaymentStatus.paid:
        return S.of(context).paid;
      case PaymentStatus.unpaid:
        return S.of(context).unpaid;
    }
  }
}

PaymentStatus getEnumStatus(String? status) {
  switch (status) {
    case 'paid':
      return PaymentStatus.paid;
    case 'unpaid':
      return PaymentStatus.unpaid;
    default:
      return PaymentStatus.unpaid;
  }
}
