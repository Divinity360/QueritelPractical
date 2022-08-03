import 'package:flutter/material.dart';
import 'package:ubenwa/models/pet_model.dart';
import 'package:ubenwa/utils/colors.dart';

class PetDetailInfo extends StatelessWidget {
  const PetDetailInfo({
    Key? key,
    required TextTheme textTheme,
    required this.isWebView,
    required this.petModel,
  })  : _textTheme = textTheme,
        super(key: key);

  final TextTheme _textTheme;
  final PetModel? petModel;
  final bool isWebView;

  @override
  Widget build(BuildContext context) {
    final _mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top:  isWebView ? 30 : 0),
      width: isWebView ? _mediaQuerySize.width - 560 : _mediaQuerySize.width ,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: TextStyle(color: AppColors.white),
            children: [
              TextSpan(text: 'Pet Name : ', style: _textTheme.headline1),
              TextSpan(text: petModel!.name!, style: _textTheme.headline2),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            style: TextStyle(color: AppColors.white),
            children: [
              TextSpan(text: 'Pet Age : ', style: _textTheme.headline1),
              TextSpan(
                  text: '${petModel!.age!} Years', style: _textTheme.headline2),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Text('Description', style: _textTheme.headline1),
        ),
         Text(petModel!.description!, style: _textTheme.subtitle1),

      ],
    ));
  }
}
