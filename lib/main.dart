
import 'package:firenase_crud2/pages/free_page.dart';
import 'package:firenase_crud2/pages/high_page.dart';

import 'package:firenase_crud2/pages/premium_page.dart';
import 'package:firenase_crud2/pages/vip_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Golden Betting Tips Admin',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedScreenIndex = 0;
  final List _screens = [
    {"screen": const FreePage(), "title": "Free"},
    {"screen": const PremiumPage(), "title": "Premium"},
    {"screen": const VipPage(), "title": "VIP"},
    {"screen": const HighPage(), "title": "High"},

  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]["title"]),
      ),
      body: _screens[_selectedScreenIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed 
  backgroundColor: Colors.black, // <-- This works for fixed
  selectedItemColor: Colors.greenAccent,
  unselectedItemColor: Colors.grey,
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Free'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Premium"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "VIP"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "High"),
        ],
      ),
    );
  }
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       home: HomePage(),
//     );
//   }
// }
