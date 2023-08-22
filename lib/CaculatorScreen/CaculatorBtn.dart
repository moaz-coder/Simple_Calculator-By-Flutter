import 'package:flutter/material.dart';

class CaculatorBtn extends StatelessWidget {
  String text;
  Function onClickCallBack;
  Color background;

  CaculatorBtn(this.text, this.onClickCallBack,
      {this.background = Colors.brown});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(background)),
          onPressed: () {
            onClickCallBack(text);
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
