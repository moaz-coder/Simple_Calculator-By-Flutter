import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_aculator/CaculatorScreen/CaculatorBtn.dart';

class CaculatorScreen extends StatefulWidget {
  static const String routeName = "Caculator-Screen";

  @override
  State<CaculatorScreen> createState() => _CaculatorScreenState();
}

class _CaculatorScreenState extends State<CaculatorScreen> {
  String textResult = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text('Simple Caculator',
            style: TextStyle(
              fontSize: 20,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                textResult,
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CaculatorBtn(
                  '<=',
                  onBackspaceClick,
                  background: Colors.blueGrey,
                ),
                CaculatorBtn('^2', calculatePowerOf2,
                    background: Colors.blueGrey),
                CaculatorBtn('Squ', onSquareClick, background: Colors.blueGrey),
                CaculatorBtn(
                  'C',
                  onClearClick, // استدعاء الدالة بدون وسيط
                  background: Colors.red,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CaculatorBtn('7', onDigitClick),
                CaculatorBtn('8', onDigitClick),
                CaculatorBtn('9', onDigitClick),
                CaculatorBtn('/', onOperatorClick, background: Colors.blueGrey),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CaculatorBtn('4', onDigitClick),
                CaculatorBtn('5', onDigitClick),
                CaculatorBtn('6', onDigitClick),
                CaculatorBtn('*', onOperatorClick, background: Colors.blueGrey),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CaculatorBtn('1', onDigitClick),
                CaculatorBtn('2', onDigitClick),
                CaculatorBtn('3', onDigitClick),
                CaculatorBtn('+', onOperatorClick, background: Colors.blueGrey),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CaculatorBtn('.', onDigitClick),
                CaculatorBtn('0', onDigitClick),
                CaculatorBtn('=', equalClickBtn),
                CaculatorBtn('-', onOperatorClick, background: Colors.blueGrey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDigitClick(btnText) {
    setState(() {
      if (textResult == '0') {
        textResult = btnText;
        return;
      }
      textResult += btnText;
    });
  }

  String savedNumber = '';
  String savedOperator = '';

  void onOperatorClick(String operatorBtnClick) {
    if (savedOperator.isEmpty) {
      savedNumber = textResult;
      savedOperator = operatorBtnClick;
      textResult = '0';
      setState(() {});
    } else {
      String RHS = textResult;
      savedNumber = calculate(savedNumber, savedOperator, RHS);
      savedOperator = operatorBtnClick;
      textResult = '0';
      setState(() {});
    }
  }

  void equalClickBtn(String _) {
    String RHS = textResult;
    String res = calculate(savedNumber, savedOperator, RHS);
    textResult = res;
    savedNumber = '';
    savedOperator = '';
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    double res = 0;
    if (operator == '+') {
      res = n1 + n2;
    } else if (operator == '-') {
      res = n1 - n2;
    } else if (operator == '*') {
      res = n1 * n2;
    } else if (operator == '/') {
      res = n1 / n2;
    }
    return res.toString();
  }

  void onClearClick(String _) {
    setState(() {
      textResult = '0';
    });
  }

  void onSquareClick(String _) {
    setState(() {
      double value = double.parse(textResult);
      double result = value * value;
      textResult = result.toString();
    });
  }

  void calculatePowerOf2(String _) {
    setState(() {
      double value = double.parse(textResult);
      num result = pow(2, value);
      textResult = result.toString();
    });
  }

  void onBackspaceClick(String _) {
    setState(() {
      if (textResult.length > 1) {
        // حذف الرقم الأخير عن طريق استبدال النص بالنص المقتطع باستثناء الحرف الأخير
        textResult = textResult.substring(0, textResult.length - 1);
      } else {
        // إعادة النص إلى الصفر إذا كانت هناك رقم واحد فقط
        textResult = '0';
      }
    });
  }
}
