import 'package:flutter/material.dart';
import '../activity/favorite.dart' show Favorite;
import '../activity/home.dart' show Home;
import '../activity/drawerhome.dart' show DrawerHome;
import '../widget/bottom_nagibvation/curved_navigation_bar.dart';
import '../activity/local/app_translations.dart';
import '../activity/local/application.dart';
import '../activity/local/app_translations_delegate.dart';

class MainHome extends StatefulWidget {
  MainHome({Key key}) : super(key: key);
  @override
  _MainHome createState() => _MainHome();
}

class _MainHome extends State<MainHome> {
 
//-------------------langualge
  //AppTranslationsDelegate _newLocaleDelegate;
  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList = application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
    languagesList[2]: languageCodesList[2],
  };
  String label = languagesList[0];

  @override
  void initState() {
    super.initState();  
     //_newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
     application.onLocaleChanged = onLocaleChange;
     onLocaleChange(Locale(languagesMap["Hindi"]));
  }
  void onLocaleChange(Locale locale) {
    setState(() {
      AppTranslations.load(locale);
    });
  }
  
  void _select(String language) {
    print("dd "+language);
    onLocaleChange(Locale(languagesMap[language]));
  }

  List<Widget> _widgetOptions = <Widget>[Favorite(), Home()];
  List<Widget> widgetBottomNagivation = <Widget>[
    Icon(
      Icons.favorite,
      color: Color(0xFFFFAC60),
      size: 20,
    ),
    Icon(
      Icons.home,
      color: Color(0xFFFFAC60),
      size: 20,
    ),
    Icon(
      Icons.favorite,
      color: Color(0xFFFFAC60),
      size: 20,
    ),
    Icon(
      Icons.home,
      color: Color(0xFFFFAC60),
      size: 20,
    ),
  ];

  List<BottomNavigationBarItem> listBottomBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
          color: Colors.red,
          size: 24,
        ),
        title: Text(
          "Favorite"
          )
          ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.red,
          size: 24,
        ),
        title: Text("Home")),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
      backgroundColor: Color(0xFFFEF9EE),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(46.0),
          child: AppBar(
            automaticallyImplyLeading: true,
            actions: <Widget>[
            PopupMenuButton<String>(
              // overflow menu
              onSelected: _select,
              icon: new Icon(Icons.language, color: Colors.white),
              itemBuilder: (BuildContext context) {
                return languagesList
                    .map<PopupMenuItem<String>>((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
            //title: 'KhanhNguyenIT',
          ),
        ),
      body: 
      // Container(
      //     child: Text(
      //       AppTranslations.of(context).text("key_password"),
      //     ),
      // ),
      SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: _widgetOptions,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFFFEF9EE),
        items: widgetBottomNagivation,
        height: 50.0,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: DrawerHome(),
    );
  }
}
