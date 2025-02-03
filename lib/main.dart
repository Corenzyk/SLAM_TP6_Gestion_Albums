import 'package:flutter/material.dart';
import 'widget/appbar.dart';
import 'widget/album.dart';
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
    return ValueListenableBuilder(
      valueListenable: theme_Controller,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'TP6 - Gestion des albums',
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          theme: themeLight,
          darkTheme: themeDark,
          themeMode: themeMode,
          home: MyHomePage(title: 'Page d\'accueil', themeController: theme_Controller),
        );
      },
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
  int currentPageIndex = 0;

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
                    Image.asset("images/imgAccueil/vinyltransp.webp",height: 125,),
                    Expanded(
                        child: Text(
                            "Bienvenue sur l'application de gestion d'album",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )
                        )
                    )
                  ],
                ),
                color: Color(0xff329ba8),
              ),
              Card(
                child: Wrap(
                  children: [
                    Text("Bienvenue sur l'application de gestion d'album",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text("\nVoici les nouveaux albums ajoutés"),

                  ],
                )
              ),
              Card(
                child: Text("Version 1 en cours de développement\nWait and see")
              )
            ],
          )
        ),
        Container(
          color: Color(0xff329ba8),
          alignment: Alignment.center,
          child: ListView(
            shrinkWrap: true, padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
            children: <Widget> [
              Album(
                  nomAlbum: "And justice for all",
                  description: "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal. ",
                  nomGroupe: "Metallica",
                  image: "And justice for all.jpg"
              ),
              Album(
                  nomAlbum: "Hardwired",
                  description: "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal. ",
                  nomGroupe: "Metallica",
                  image: "Hardwired.jpg"
              ),
              Album(
                  nomAlbum: "Kill'em all",
                  description: "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal. ",
                  nomGroupe: "Metallica",
                  image: "Kill'em all.jpg"
              ),
              Album(
                  nomAlbum: "Master of puppets",
                  description: "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal. ",
                  nomGroupe: "Metallica",
                  image: "Master of puppets.jpg"
              ),
              Album(
                  nomAlbum: "Metallica",
                  description: "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal. ",
                  nomGroupe: "Metallica",
                  image: "Metallica.jpg"
              ),
              Album(
                  nomAlbum: "Ride the lightning",
                  description: "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock. C'est principalement un album de heavy metal, et il n'y a plus beaucoup de traces de thrash metal. ",
                  nomGroupe: "Metallica",
                  image: "Ride the lightning.jpg"
              ),
            ],
          )
        ),
        Container(
          child: Column(
            children: [
              Card(
                child: Text("Configurer les paramètres de l'application\nWork in progress")
              ),
              Card(
                child: Text("Param2\nWork in progress")
              )
            ],
          ),
        ),
      ][currentPageIndex],

      floatingActionButton: (currentPageIndex == 0)
          ? FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            child: Icon(Icons.add),
            backgroundColor: Color(0xff329ba8),
          )
        : null,

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
      ),
    );
  }
}
