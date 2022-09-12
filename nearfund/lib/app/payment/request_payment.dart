import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestToPayment extends ConsumerStatefulWidget {
  RequestToPayment({Key? key}) : super(key: key);

  @override
  ConsumerState<RequestToPayment> createState() => _RequestPaymentState();
}

class _RequestPaymentState extends ConsumerState<RequestToPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PayMent"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
