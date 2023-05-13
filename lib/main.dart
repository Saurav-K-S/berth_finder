import 'package:berth_finder/Variables/var.dart';
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
  final _textcontroller = TextEditingController();
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
                return Column(
                  children: [
                    const Text(
                      'Seat\nFinder',
                      style: TextStyle(
                          color: Color(0xff004e98),
                          fontSize: 64,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: TextField(
                              controller: _textcontroller,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8))),
                                  hintText: 'Enter Train Number',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff004E98)),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8)))),
                            ),
                          ),
                          Flexible(
                              child: SizedBox(
                            height: 60,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff004E98),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.only(
                                                topEnd: Radius.circular(8),
                                                bottomEnd: Radius.circular(8))),
                                    elevation: 0),
                                onPressed: () {
                                  setState(() {
                                    trainno = int.parse(_textcontroller.text);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Seat()),
                                    );
                                  });
                                },
                                child:
                                    const Icon(Icons.arrow_right_alt_rounded)),
                          ))
                        ],
                      ),
                    )
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
