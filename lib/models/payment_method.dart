enum PaymentMethodType { VISA, PAYPAL, MASTERCARD, JAWALPAY, PALPAY }

class PaymentMethod {
  PaymentMethodType type;
  String logo;

  PaymentMethod({
    required this.type,
    required this.logo,
  });

  static List<PaymentMethod> getAllPaymentMethods() {
    return [
      PaymentMethod(
        type: PaymentMethodType.MASTERCARD,
        logo: 'assets/logos/mastercard.svg',
      ),
      PaymentMethod(
        type: PaymentMethodType.VISA,
        logo: 'assets/logos/visa.svg',
      ),
      PaymentMethod(
        type: PaymentMethodType.PALPAY,
        logo: 'assets/logos/palpay.svg',
      ),
      PaymentMethod(
        type: PaymentMethodType.JAWALPAY,
        logo: 'assets/logos/jawwal.svg',
      ),
      PaymentMethod(
        type: PaymentMethodType.PAYPAL,
        logo: 'assets/logos/paypal.svg',
      ),
    ];
  }
}
