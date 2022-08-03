import 'package:flutter/material.dart';
import 'package:ubenwa/utils/colors.dart';

class PetDetailImage extends StatelessWidget {
  const PetDetailImage({
    Key? key,
    required this.image,
    required this.isWebView,
  }) : super(key: key);

  final String? image;
  final bool isWebView;

  @override
  Widget build(BuildContext context) {
    final _mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      height: isWebView ? 500 : 250,
      width: isWebView ? 500 :  _mediaQuerySize.width,
      margin: EdgeInsets.only(top: 20, bottom: 20, right: isWebView ? 30 : 0 ),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          )),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Image.network(
          image!,
          height:isWebView ? 460 : 210,
          width: _mediaQuerySize.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}