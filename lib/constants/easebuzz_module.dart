import 'dart:convert';
import 'dart:math';

import 'package:easebuzz/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'request.dart';

// ignore: must_be_immutable
class EasebuzzModule extends StatefulWidget {
  double amount;
  EasebuzzModule(this.amount, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _EasebuzzModuleState createState() => _EasebuzzModuleState();
}

class _EasebuzzModuleState extends State<EasebuzzModule> {
  TextEditingController amountController = TextEditingController();

  static const MethodChannel _channel = MethodChannel('easebuzz');

  getPay() async {
    var rng = Random();
    var body = {
      'txnid': rng.nextInt(100000).toString(),
      'firstname': "hello",
      'email': "lionscarrer@gmail.com",
      'amount': jsonEncode(widget.amount),
      'phone': "9843544452",
      'productinfo': "5319",
      "zipcode": "123345",
      "address1": "xyz", // address.replaceAll(regex, ""),
      "address2": "xyz",
      "city": "xyz",
      // //city.replaceAll(regex, "").replaceAll("(", "").replaceAll(")", ""),
      "state": "Gujrat",
      "country": "india",
    };
    String? tokan;
    var resp = await getEasebuzz(
      body,
      "3c886299b385ad0c00d99975b242e15255699fb9",
    );
    print(resp);
    setState(() {
      tokan = resp['data'];
    });
    print(tokan);

    Object parameters = {"access_key": tokan, "pay_mode": "production"};

    debugPrint('Parameter : $parameters');
    print(json.encode(parameters));
    final Map paymentResponse =
        await _channel.invokeMethod("payWithEasebuzz", parameters);
    // final paymentResponse =
    //     await _channel.invokeListMethod("payWithEasebuzz", parameters);
    debugPrint('res : $paymentResponse');
    String result = paymentResponse['result'];
    if (result == "payment_successfull") {
      if (paymentResponse["payment_response"]["status"] == "success") {
        // Navigator.pop(context);
        Get.defaultDialog(
            title: "${paymentResponse["payment_response"]["status"]}",
            content: const Text(
                'Congratulations..... Now you are member of Yoga Tirth.'));
        Get.offAll(() => const HomePage());
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => home(widget.user)));
        // Fluttertoast.showToast(msg: "SuccessFully Purchase");
      }
    } else {
      print("ffgfgfg");
      Get.defaultDialog(
          title: "${paymentResponse["payment_response"]["status"]}",
          content: const Text('Sorry..... Please try after some time.'));
      Get.back();
      // Get.offAll(() => BottomNavBar());
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    }
    //if (result == "payment_successfull") {}
    print("Devraj$result");
  }

  @override
  void initState() {
    getPay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
