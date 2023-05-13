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
  final myController = TextEditingController();
  final _scrollController = ScrollController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _scrollToIndex(index) {
    _scrollController.animateTo(160.toDouble() * index,
        duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    seatno = 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
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
                            if (int.parse(myController.text) > 0 &&
                                int.parse(myController.text) <= trainno % 100) {
                              setState(() {
                                sel = List.filled(50, false);
                                sel[(int.parse(myController.text) - 1)] =
                                    !sel[(int.parse(myController.text))];
                                _scrollToIndex(
                                    (int.parse(myController.text).ceil() / 8)
                                            .round() -
                                        1);
                              });
                            } else {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text('Invalid Seat Number'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: const Icon(Icons.arrow_right_alt_rounded)),
                    ))
                  ]),
            ),
            Flexible(
              child: ListView(
                  controller: _scrollController,
                  cacheExtent: 10000,
                  children: List.generate(
                      ((trainno % 100) / 8).round(), (index) => SeatRow())),
            ),
            const SizedBox(height: 25)
          ],
        ),
      ),
    );
  }
}

class SeatRow extends StatelessWidget {
  const SeatRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 1),
      child: Flexible(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SeatPos(number: seatno + 1, name: 'Window', select: sel[seatno]),
              SeatPos(
                  number: seatno + 2, name: 'Middle', select: sel[seatno + 1]),
              SeatPos(
                  number: seatno + 3, name: 'Aisle', select: sel[seatno + 2]),
              const SizedBox(width: 40),
              SeatPos(
                  number: seatno + 7,
                  name: 'Side\nUpper',
                  select: sel[seatno + 6])
            ]),
            const SizedBox(height: 50),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SeatPos(
                  number: seatno + 4, name: 'Window', select: sel[seatno + 3]),
              SeatPos(
                  number: seatno + 5, name: 'Middle', select: sel[seatno + 4]),
              SeatPos(
                  number: seatno + 6, name: 'Aisle', select: sel[seatno + 5]),
              const SizedBox(width: 40),
              SeatPos(
                  number: seatno + 8,
                  name: 'Side\nLower',
                  select: sel[seatno + 7])
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                height: 4,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 48, 124, 196),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
