import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  static const String routeName = '\Order';

Widget _rowWidger(String text, int flex){
  return Expanded(
    flex: flex,
    child: Container(
  decoration: BoxDecoration(color: Colors.yellow.shade900,border: Border.all(color: Colors.grey.shade700)
  ),
  child: Text(text, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Orders screen',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
            ),
             Row(
              children: [
                _rowWidger("IMAGE",1),
                _rowWidger("FULL NAME",3),
                _rowWidger("CITY",2),
                _rowWidger("STATE",2),
                _rowWidger("ACTION",1),
                _rowWidger("VIEW MORE",1),
              ],
            )
          ],
        ),
      );
  }
}