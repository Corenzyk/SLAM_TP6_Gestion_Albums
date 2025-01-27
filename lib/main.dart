import 'package:flutter/material.dart';
import 'AppBar/appbar.dart';
import 'CustomIcons.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'data/controller/ThemeController.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeStr_light = await rootBundle.loadString('assets/theme_gestionAlbum_light.json');
  final themeJson_light = jsonDecode(themeStr_light);
  final theme_light = ThemeDecoder.decodeThemeData(themeJson_light)!;

  final themeStr_dark = await rootBundle.loadString('assets/theme_gestionAlbum_dark.json');
  final themeJson_dark = jsonDecode(themeStr_dark);
  final theme_dark = ThemeDecoder.decodeThemeData(themeJson_dark)!;

  runApp(MyApp(themeLight : theme_light, themeDark : theme_dark));
}

class MyApp extends StatelessWidget {
  final ThemeData themeLight;
  final ThemeData themeDark;
  final theme_Controller = ThemeController();

  MyApp({Key? key, required this.themeLight, required this.themeDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP6 - Gestion des albums',
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      darkTheme: themeDark,
      home: MyHomePage(title: 'Flutter Demo Home Page', themeController: theme_Controller),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.themeController});

  final String title;
  final ThemeController themeController;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int currentPageIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar_Principal(
        title: "Gestion des albums",
        actions: <Widget>[
          IconButton(
            icon: Icon(ThemeMode.system == ThemeMode.dark ? Icons.lightbulb_outline : Icons.lightbulb),

            onPressed: () {
              widget.themeController.toggleTheme();
            }
          )
        ],
      ),
      body: <Widget>[
        Container(
          child: Column(
            children: [
              Card(
                child: Row(
                  children: [
                    Image.asset("assets/vinyle.png",height: 125,),
                    Text("Bienvenue sur l'application de gestion d'album")
                  ],
                ),
                color: Colors.lightGreen,
              ),
              Card(
                child: Text("News\nDernières actualités")
              ),
              Card(
                child: Text("Version 1 en cours de développement\nWait and see")
              )
            ],
          )
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Générer un nombre aléatoire')
        ),
        Container(

          alignment: Alignment.center,
          child: const Text('Paramètres'),
        ),
      ][currentPageIndex],

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(CustomIcons.home),
            selectedIcon: Icon(CustomIcons.home_outline),
            label: "Accueil",
          ),
          NavigationDestination(
            icon: Icon(CustomIcons.music),
            selectedIcon: Icon(CustomIcons.music_outline),
            label: "Liste des albums",
          ),
          NavigationDestination(
            icon: Icon(CustomIcons.cog),
            selectedIcon: Icon(CustomIcons.cog_outline),
            label: "Paramètres",
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
