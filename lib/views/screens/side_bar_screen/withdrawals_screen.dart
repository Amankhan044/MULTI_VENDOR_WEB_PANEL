import 'package:flutter/material.dart';

class WithdrawalScreen extends StatelessWidget {
  const WithdrawalScreen({super.key});

  static const String routeName = '\Withdrawals';
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
              'Withdrawals',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
            Row(
              children: [
                _rowWidger("NAME",1),
                _rowWidger("AMOUNT",3),
                _rowWidger("BANK NAME",2),
                _rowWidger("BANK ACCOUNT",2),
                _rowWidger("EMAIL",1),
                _rowWidger("PHONE",1),
              ],
            )
        ],
      ),
    );
  }
}
