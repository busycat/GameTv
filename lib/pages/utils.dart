import 'package:flutter/material.dart';

class VS extends StatelessWidget {
  final int sp;
  const VS(this.sp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sp * 8,
    );
  }
}

class HS extends StatelessWidget {
  final int sp;
  const HS(this.sp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sp * 8,
    );
  }
}
