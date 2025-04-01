abstract class PaymentEvent {}

class ProcessPaymentEvent extends PaymentEvent {
  final double amount;

  ProcessPaymentEvent(this.amount);
}
