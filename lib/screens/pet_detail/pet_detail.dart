import 'package:flutter/material.dart';
import 'package:ubenwa/models/pet_model.dart';
import 'package:ubenwa/utils/responsive.dart';
import 'package:ubenwa/widgets/pet_detail_image.dart';
import 'package:ubenwa/widgets/pet_detail_info.dart';

class PetDetailScreen extends StatelessWidget {
  final PetModel? petModel;

  const PetDetailScreen({Key? key, required this.petModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    final _textTheme = _appTheme.textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: _appTheme.backgroundColor,
        appBar: AppBar(toolbarHeight: 80),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Responsive(
                desktop: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PetDetailImage(image: petModel!.photo, isWebView: true),
                    PetDetailInfo(textTheme: _textTheme, petModel: petModel, isWebView: true)
                  ],
                ),
                mobile: Column(
                  children: [
                    PetDetailImage(image: petModel!.photo, isWebView: false),
                    PetDetailInfo(textTheme: _textTheme, petModel: petModel, isWebView: false)
                  ],
                )),
          ),
        ),
      ),
    );
  }
}



