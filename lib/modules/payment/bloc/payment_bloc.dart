import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/payment_service.dart';
import 'payment_event.dart';
import 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentService paymentService;

  PaymentBloc(this.paymentService) : super(PaymentInitial()) {
    on<ProcessPaymentEvent>((event, emit) async {
      emit(PaymentProcessing());
      try {
        final success = await paymentService.processPayment(event.amount);
        if (success) {
          emit(PaymentSuccess());
        } else {
          emit(PaymentFailed('Payment failed.'));
        }
      } catch (e) {
        emit(PaymentFailed('An error occurred.'));
      }
    });
  }
}
