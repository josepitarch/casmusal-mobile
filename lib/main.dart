import 'package:el_castell_app/database/database_initializer.dart';
import 'package:el_castell_app/providers/schedule_provider.dart';
import 'package:el_castell_app/screens/favourites_screen.dart';
import 'package:el_castell_app/screens/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseInitializer.instance.database;

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ScheduleProvider(), lazy: false)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El Castell',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [ScheduleScreen(), FavouritesScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("El Castell"), centerTitle: true),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded), label: "Favoritos"),
        ],
      ),
    );
  }
}
