import 'package:animated_theme_changing/widgets/widget_theme_switcher.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedThemeChangerScaffold(
      appBar: AppBar(
        title: const Text('Animated Theme Changer'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isDarkMode.value = !isDarkMode.value;
          setState(() {});
        },
        backgroundColor: isDarkMode.value ? Colors.white : Colors.black,
        child: Icon(
          isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
          color: isDarkMode.value ? Colors.black : Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Animated Theme Changer',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This is a sample app to demonstrate theme changing with animation.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18,),
            ),
            cardsRow(),
          ],
        ),
      ),
    );
  }
  
  Widget cardsRow() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 300,
            child: Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.airplanemode_active,
                        size: 64,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'This is a sample app to demonstrate theme changing with animation',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.phone,
                        size: 64,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'This is a sample app to demonstrate theme changing with animation',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.car_crash,
                        size: 64,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'This is a sample app to demonstrate theme changing with animation',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.business,
                        size: 64,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'This is a sample app to demonstrate theme changing with animation',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18,),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
