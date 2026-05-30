class CartService {
  double get subtotal => 28.00;
  double get shipping => 10.00;

  double calculateDiscount(String coupon) {
    if (coupon.toUpperCase() == 'DEV10') {
      return subtotal * 0.10; // 10% de desconto
    }
    return 0.0;
  }

  double calculateTotal(double discount) {
    return subtotal + shipping - discount;
  }
}