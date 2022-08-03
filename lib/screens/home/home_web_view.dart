import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubenwa/providers/pet_provider.dart';
import 'package:ubenwa/widgets/app_loader.dart';
import 'package:ubenwa/widgets/pet_web_listview.dart';

class HomeWebView extends StatelessWidget{
  const HomeWebView({Key? key,
    required ThemeData appTheme,
    required TabController? tabController,
  }) : _appTheme = appTheme, _tabController = tabController, super(key: key);

  final ThemeData _appTheme;
  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: _appTheme.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: Row(children: [
          Padding(padding: const EdgeInsets.only(left: 60, right: 10), child: Text('LOGO', style: _appTheme.textTheme.headline1,),),
          TabBar(
          tabs: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Tab(text: 'CATS'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Tab(text: 'DOGS'),
            )
          ],
          controller: _tabController,
          isScrollable: true,
        )],) ,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Consumer<PetProvider>(
              builder: (context, petProvider, child) {
                if (petProvider.loading) {
                  return const AppLoader();
                }
                return PetWebListView(petList: petProvider.petList);
              },
            ),
          ),
        ),
      ),
    );
  }

}
