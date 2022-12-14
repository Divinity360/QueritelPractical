import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubenwa/utils/colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(backgroundColor: AppColors.primaryColor),
    ));
  }
}
