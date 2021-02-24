import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Razorpay razorpay;

  @override
  void initState() {
    super.initState();
    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, paymentFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, paymentExternalWallet);
  }

  void paymentSuccess() {
    print('Payment Successful');
  }

  void paymentFailure() {
    print('payment failed');
  }

  void paymentExternalWallet() {
    print('wallet used');
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }


  void checkOut() {
    var option = {
      "key": "rzp_test_q5qUylJJ84aZld",
      "amount": 800,
      "name": "Refreshh",
      "description": "Payment method of Refreshh",
      "prefil": {
        "contact": "9574094882",
        "email": "vrushik231199@gmail.com",
      },
      "external": {
        "wallets": ["paytm"]
      },
    };

    try {
      razorpay.open(option);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RaisedButton(
            onPressed: (){
              print('pressed');
              checkOut();
            },
            child: Text('pay'),
          ),
        ),
      ),
    );
  }
}
