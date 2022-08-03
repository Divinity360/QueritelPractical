import 'package:ubenwa/models/pet_model.dart';

extension ListExtension on List {
  List<PetModel> get mapListToPetModel =>
      map<PetModel>((item) => PetModel.fromJson(item)).toList();
}
