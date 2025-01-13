import 'package:flutter/material.dart';
import 'AppBar/appbar.dart';
import 'CustomIcons.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeStr = await rootBundle.loadString('assets/ThemeAlbum.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  runApp(MyApp(theme : theme));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;

  const MyApp({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP6 - Gestion des albums',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int currentPageIndex = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar_Principal(
        title: "Gestion des albums",
        couleurFond: Colors.green,
        couleurText: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.lightbulb),
            color: Colors.white,
            onPressed: () {
            }
          )
        ],
      ),
      body: <Widget>[
        Container(
          child: ListView(
            children: [
              const Text(
                'You have pushed the button this many times:',
                textAlign: TextAlign.center,
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ],
          )
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: const Text('Générer un nombre aléatoire')
        ),
        Container(
          color: Colors.white,
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
        backgroundColor: Colors.green,
        indicatorColor: Colors.white,

        onDestinationSelected: (int index) {
          setState(() {
          currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(CustomsIcons.home),
            selectedIcon: Icon(CustomsIcons.home_outline),
            label: "Accueil",
          ),
          NavigationDestination(
            icon: Icon(CustomsIcons.music),
            selectedIcon: Icon(CustomsIcons.music_outline),
            label: "Liste des albums",
          ),
          NavigationDestination(
            icon: Icon(CustomsIcons.gear),
            selectedIcon: Icon(CustomsIcons.gear_outline),
            label: "Paramètres",
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}
