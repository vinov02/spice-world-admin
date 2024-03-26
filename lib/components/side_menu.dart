import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../pages/category.dart';
import '../pages/dashboard.dart';
import '../pages/farmer.dart';
import '../pages/main_category.dart';
import '../pages/settings.dart';
import '../pages/sub_category.dart';
import '../pages/user.dart';

class SideMenu extends StatefulWidget {
  static const String id = 'side-menu';

  const SideMenu({super.key});
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Widget _selectedScreen = const DashBoardScreen();
  screenSelector(item){
    switch (item.route){
      case DashBoardScreen.id :
        setState(() {
          _selectedScreen = const DashBoardScreen();
        });
        break;
      case CategoryScreen.id :
        setState(() {
          _selectedScreen = const CategoryScreen();
        });
        break;
      case MainCategoryScreen.id :
        setState(() {
          _selectedScreen = const MainCategoryScreen();
        });
        break;
      case SubCategoryScreen.id :
        setState(() {
          _selectedScreen = const SubCategoryScreen();
        });
        break;
      case FarmerDetailScreen.id :
        setState(() {
          _selectedScreen = const FarmerDetailScreen();
        });
        break;
      case UserDetailsScreen.id :
        setState(() {
          _selectedScreen = const UserDetailsScreen();
        });
        break;
      case SettingsScreen.id :
        setState(() {
          _selectedScreen = const SettingsScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: DashBoardScreen.id,
            icon: Icons.dashboard_outlined,
          ),
          AdminMenuItem(
            title: 'Categories',
            icon: Icons.category_outlined,
            children: [
              AdminMenuItem(
                title: 'Category',
                route: CategoryScreen.id,
              ),
              AdminMenuItem(
                title: 'Main Category',
                route: MainCategoryScreen.id,
              ),
              AdminMenuItem(
                title: 'Sub Category',
                route: SubCategoryScreen.id,
              ),
            ],
          ),
          AdminMenuItem(
            title: 'Farmer Details',
            route: FarmerDetailScreen.id,
            icon: Icons.person_2_outlined,
          ),
          AdminMenuItem(
            title: 'User Details',
            route: UserDetailsScreen.id,
            icon: Icons.supervised_user_circle_outlined,
          ),
          AdminMenuItem(
            title: 'Settings',
            route: SettingsScreen.id,
            icon: Icons.settings_outlined,
          ),
        ],
        selectedRoute: SideMenu.id,
        onSelected: (item) {
          screenSelector(item);
          // if (item.route != null) {
          //   Navigator.of(context).pushNamed(item.route!);
          // }
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: Colors.deepPurple,
          child: const Center(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '   Spice World',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: Colors.deepPurple,
          child:  Center(
            child: Text(
              DateTimeFormat.format(DateTime.now(), format: AmericanDateFormats.dayOfWeek),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body:_selectedScreen,

    );
  }
}