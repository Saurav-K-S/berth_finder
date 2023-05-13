import 'package:berth_finder/Variables/var.dart';
import 'package:flutter/material.dart';

class SeatPos extends StatefulWidget {
  final int number;
  final String name;
  final bool select;
  const SeatPos({
    super.key,
    required this.number,
    required this.name,
    required this.select,
  });

  @override
  State<SeatPos> createState() => _SeatPosState();
}

class _SeatPosState extends State<SeatPos> {
  @override
  Widget build(BuildContext context) {
    seatno++;
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: 70,
        width: 70,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 48, 124, 196)),
      ),
      Container(
        margin: const EdgeInsets.all(1),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.select ? Colors.white : const Color(0xff004E98),
                width: 2),
            borderRadius: BorderRadius.circular(5),
            color: widget.select ? const Color(0xff004E98) : Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.number}\n${widget.name}',
              style: TextStyle(
                  color: widget.select ? Colors.white : const Color(0xff004E98),
                  fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ]);
  }
}
