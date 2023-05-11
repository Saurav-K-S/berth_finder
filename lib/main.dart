import 'package:berth_finder/pages/seat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Rubik'),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Seat()),
                    );
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0x00000000)),
                      elevation: MaterialStatePropertyAll(0)),
                  child: const Text(
                    'Seat\nFinder',
                    style: TextStyle(
                        color: Color(0xff004e98),
                        fontSize: 64,
                        fontWeight: FontWeight.w600),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
