import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:appfoodmall/login/login_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main/main_widget.dart';
import 'catalog/catalog_widget.dart';
import 'cart/cart_widget.dart';
import 'sale/sale_widget.dart';
import 'sale_terms/sale_terms_widget.dart';
import 'profile/profile_widget.dart';
import 'myorders/myorders_widget.dart';
import 'ordercheckout/ordercheckout_widget.dart';
import 'item_card/item_card_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = ThemeMode.system;
  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 2), () => setState(() => displaySplashImage = false));
  }

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'appfoodmall',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      home: displaySplashImage
          ? Scaffold(
              body: Container(
                color: Colors.white,
                padding: EdgeInsets.all(30),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : NavBarPage(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'Main';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Main': MainWidget(),
      //'Catalog': CatalogWidget(),
      'Cart': CartWidget(),
      // 'sale': SaleWidget(),
      // 'sale_terms': SaleTermsWidget(),
      'profile': ProfileWidget(),
      // 'myorders': MyordersWidget(),
      // 'ordercheckout': OrdercheckoutWidget(),
      //'item_card': ItemCardWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF62D050),
        unselectedItemColor: Color(0x8A000000),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
              size: 24,
            ),
            label: 'Home',
            tooltip: '',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.shopping_bag_outlined,
          //     size: 24,
          //   ),
          //   label: 'Каталог',
          //   tooltip: '',
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 24,
            ),
            label: 'shopping',
            tooltip: '',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.star,
          //     size: 24,
          //   ),
          //   label: 'Скидка',
          //   tooltip: '',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.star,
          //     size: 24,
          //   ),
          //   label: 'Скидка',
          //   tooltip: '',
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.person,
              size: 24,
            ),
            label: 'Account',
            tooltip: '',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.home_outlined,
          //   ),
          //   label: '',
          //   tooltip: '',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.home_outlined,
          //   ),
          //   label: '',
          //   tooltip: '',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.home_outlined,
          //     size: 24,
          //   ),
          //   label: 'Home',
          //   tooltip: '',
          // )
        ],
      ),
    );
  }
}
