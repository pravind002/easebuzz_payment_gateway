
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: whiteColor),
        centerTitle: true,
        title: const Text(
          'M Y   C A R T',
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: blackColor.withOpacity(.05)),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: blackColor.withOpacity(.1)),
                  ),
                  const Column(
                    children: [Text('Rolex')],
                  )
                ],
              ),
            )
            // ListTile(
            //   minLeadingWidth: 200,
            //   leading:
            // )
          ],
        ),
      ),
    );
  }
}

