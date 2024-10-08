import 'package:easebuzz/widgets/text.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/easebuzz_module.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.data});
  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: whiteColor),
        title: const Text(
          'Product Details',
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * .3,
              decoration: BoxDecoration(
                  color: blueColor.withOpacity(.05),
                  image: DecorationImage(
                      image: NetworkImage('${data['img']}'), fit: BoxFit.fill)),
            ),
            Text(
              '${data['brand']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              '${data['amount']} /-',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              '${data['discount']}% OFF',
              style: const TextStyle(
                  color: greenColor, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        elevation: 10,
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                  child: customText('${data['amount']} /-',
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EasebuzzModule(
                                double.parse('${data['amount']}'))));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: customText('PAY NOW',
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
