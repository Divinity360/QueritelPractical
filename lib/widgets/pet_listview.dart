import 'package:flutter/cupertino.dart';
import 'package:ubenwa/models/pet_model.dart';
import 'package:ubenwa/utils/enums.dart';
import 'package:ubenwa/widgets/pet_item_card.dart';

class PetListView extends StatelessWidget {
  final List<PetModel> petList;

  const PetListView({Key? key, required this.petList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Pet grid view
    return SizedBox(
        height: petList.length * 140,
        child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            itemCount: petList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.99),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              /// Generate theme based on grid placement
              final petItemCardTheme =
                  i % 2 == 0 ? PetCardTheme.light : PetCardTheme.dark;
              return PetItemCard(
                  petModel: petList.elementAt(i),
                  petCardTheme: petItemCardTheme, isWebView: false,);
            }));
  }
}
