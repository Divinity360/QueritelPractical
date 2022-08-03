import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubenwa/providers/pet_provider.dart';
import 'package:ubenwa/widgets/app_loader.dart';
import 'package:ubenwa/widgets/pet_listview.dart';

class HomeMobileView extends StatelessWidget {
  const HomeMobileView({
    Key? key,
    required ThemeData appTheme,
    required TabController? tabController,
  }) : _appTheme = appTheme, _tabController = tabController, super(key: key);

  final ThemeData _appTheme;
  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appTheme.backgroundColor,
      appBar: AppBar(
          toolbarHeight: 80,
          flexibleSpace: Center(
            child: TabBar(
              tabs: const [Tab(text: 'CATS'), Tab(text: 'DOGS')],
              controller: _tabController,
            ),
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Consumer<PetProvider>(
              builder: (context, petProvider, child) {
                if (petProvider.loading) {
                  return const AppLoader();
                }
                return PetListView(petList: petProvider.petList);
              },
            ),
          ),
        ),
      ),
    );
  }
}