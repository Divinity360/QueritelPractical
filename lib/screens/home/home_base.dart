import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubenwa/providers/pet_provider.dart';
import 'package:ubenwa/screens/home/home_mobile_view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:ubenwa/screens/home/home_web_view.dart';
import 'package:ubenwa/utils/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  /// Pet provider instance
  PetProvider? petProvider;

  /// TabController to manage index of current tab
  TabController? _tabController;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _initHomeState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Responsive(
              mobile: HomeMobileView(
                  appTheme: _appTheme, tabController: _tabController),
              desktop: HomeWebView(
                  appTheme: _appTheme, tabController: _tabController)),
        ));
  }

  /// Initialize homepage state
  void _initHomeState() {
    petProvider = Provider.of<PetProvider>(context, listen: false);
    petProvider!.fetchPetList(0);

    _tabController = TabController(length: 2, vsync: this);
    _tabController!
        .addListener(() => petProvider!.fetchPetList(_tabController!.index));
  }
}
