import 'package:flutter/material.dart';
import 'package:ubenwa/models/pet_model.dart';
import 'package:ubenwa/utils/colors.dart';
import 'package:ubenwa/utils/enums.dart';
import 'package:ubenwa/utils/routes.dart';

class PetItemCard extends StatelessWidget {
  final PetModel petModel;
  final PetCardTheme petCardTheme;
  final bool isWebView;

  const PetItemCard(
      {Key? key,
      required this.petModel,
      required this.petCardTheme,
      required this.isWebView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color? _bgColor;
    final Color? _textColor;
    final Color? _borderColor;
    final _appTheme = Theme.of(context);
    final _mediaQuerySize = MediaQuery.of(context).size;
    final _textTheme = _appTheme.textTheme;
    if (petCardTheme == PetCardTheme.light) {
      _bgColor = AppColors.primaryColor;
      _borderColor = AppColors.primaryColor;
      _textColor = AppColors.appBackgroundColor;
    } else {
      _bgColor = AppColors.appBackgroundColor;
      _borderColor = AppColors.opaqueGrey;
      _textColor = AppColors.white;
    }
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: isWebView ? 35 : 3, vertical: 5),
      child: InkWell(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: _bgColor,
                border: Border.all(
                  color: _borderColor,
                  width: 1,
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    petModel.photo!,
                    height: isWebView ? 250 : 100.0,
                    width: _mediaQuerySize.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: isWebView ? 40 : 5, bottom: 1),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: _textColor),
                      children: [
                        TextSpan(
                            text: 'Pet Name : ', style: _textTheme.bodyText1),
                        TextSpan(
                            text: petModel.name, style: _textTheme.bodyText2),
                      ],
                    ),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(color: _textColor),
                    children: [
                      TextSpan(text: 'Pet Age : ', style: _textTheme.bodyText1),
                      TextSpan(
                          text: '${petModel.age!} Years',
                          style: _textTheme.bodyText2),
                    ],
                  ),
                ),
              ],
            )),
        onTap: () =>
            Navigator.pushNamed(context, AppRoutes.detail, arguments: petModel),
      ),
    );
  }
}
