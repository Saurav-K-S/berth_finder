// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:berth_finder/Variables/var.dart';
import 'package:flutter/material.dart';

import '../Components/seatpos.dart';

void main() {
  runApp(const Seat());
}

class Seat extends StatefulWidget {
  const Seat({super.key});

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  List<bool> sel = List.filled(50, false);
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    seatno = 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            const Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Text(
                    'Seat Finder',
                    style: TextStyle(
                        color: Color(0xff004e98),
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
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
                                  borderSide:
                                      BorderSide(color: Color(0xff004E98)),
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
                                      bottomEnd: Radius.circular(8))),
                              elevation: 0),
                          onPressed: () {
                            print(myController.text);
                            setState(() {
                              sel = List.filled(50, false);
                              sel[(int.parse(myController.text) - 1)] =
                                  !sel[(int.parse(myController.text) - 1)];
                            });
                          },
                          child: const Icon(Icons.arrow_right_alt_rounded)),
                    ))
                  ]),
            ),
            SeatRow(sel: sel),
            SeatRow(sel: sel),
            SeatRow(sel: sel),
            SeatRow(sel: sel),
            SeatRow(sel: sel),
            SeatRow(sel: sel),
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}

class SeatRow extends StatelessWidget {
  const SeatRow({
    super.key,
    required this.sel,
  });

  final List<bool> sel;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SeatPos(number: seatno + 1, name: 'Window', select: sel[seatno]),
            SeatPos(
                number: seatno + 2, name: 'Middle', select: sel[seatno + 1]),
            SeatPos(number: seatno + 3, name: 'Aisle', select: sel[seatno + 2]),
            const SizedBox(width: 40),
            SeatPos(
                number: seatno + 7,
                name: 'Side\nUpper',
                select: sel[seatno + 6]),
          ]),
          const SizedBox(
            height: 50,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SeatPos(
                number: seatno + 4, name: 'Window', select: sel[seatno + 3]),
            SeatPos(
                number: seatno + 5, name: 'Middle', select: sel[seatno + 4]),
            SeatPos(number: seatno + 6, name: 'Aisle', select: sel[seatno + 5]),
            const SizedBox(width: 40),
            SeatPos(
                number: seatno + 8,
                name: 'Side\nLower',
                select: sel[seatno + 7])
          ]),
        ],
      ),
    );
  }
}
