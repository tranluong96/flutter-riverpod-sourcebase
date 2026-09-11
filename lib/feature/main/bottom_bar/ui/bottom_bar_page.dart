import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/core/resources/res.dart';
import 'package:myapp/feature/main/home/ui/home_page.dart';
import 'package:myapp/feature/main/setting/ui/setting_page.dart';
import 'package:myapp/i18n/strings.g.dart';

@RoutePage()
class BottomBarPage extends ConsumerStatefulWidget {
  const BottomBarPage({super.key});

  @override
  ConsumerState<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends ConsumerState<BottomBarPage> {
  int _currentIndex = 0;

  static final _activeColor = ResColors().primary;
  static final _inactiveColor = ResColors().textLow;

  List<Widget> get _pages => [HomePage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000),
              offset: Offset(0, -4),
              blurRadius: 12,
              spreadRadius: 1,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: ResColors().white,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: _activeColor,
          unselectedItemColor: _inactiveColor,
          selectedLabelStyle: ResTextStyles().s14w700,
          unselectedLabelStyle: ResTextStyles().s14w500,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: const Icon(Icons.home),
              label: context.t.bottombar.home,
              backgroundColor: ResColors().white,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              activeIcon: const Icon(Icons.settings),
              label: context.t.bottombar.setting,
              backgroundColor: ResColors().white,
            ),
          ],
        ),
      ),
    );
  }
}
