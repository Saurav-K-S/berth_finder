// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:berth_finder/Variables/var.dart';
import 'package:flutter/material.dart';

class SeatPos extends StatefulWidget {
  final number;
  final name;
  final bool select;
  const SeatPos({
    super.key,
    this.number,
    this.name,
    required this.select,
  });

  @override
  State<SeatPos> createState() => _SeatPosState();
}

class _SeatPosState extends State<SeatPos> {
  @override
  Widget build(BuildContext context) {
    seatno++;
    return Container(
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
    );
  }
}
