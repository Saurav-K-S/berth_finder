// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const Seat());
}

class Seat extends StatefulWidget {
  const Seat({super.key});

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
                padding: EdgeInsets.only(top: 70),
                child: Text(
                  'Seat Finder',
                  style: TextStyle(
                      color: Color(0xff004e98),
                      fontSize: 32,
                      fontWeight: FontWeight.w600),
                )),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: TextField(
                      controller: myController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8))),
                          hintText: 'Enter Seat Number',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff004E98)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)))),
                    ),
                  ),
                ),
                Flexible(
                    child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff004E98),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(8),
                                  bottomEnd: Radius.circular(8)))),
                      onPressed: () {
                        print(myController.text);
                      },
                      child: const Icon(Icons.arrow_right_alt_rounded)),
                ))
              ])
        ],
      ),
    );
  }
}
