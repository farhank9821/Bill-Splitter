import 'package:flutter/material.dart';
import 'package:bill_splitter/pages/bill_calculator.dart';
import 'package:bill_splitter/pages/bill_splitter.dart';
import 'package:bill_splitter/pages/profile.dart';
import 'package:bill_splitter/utils/dialogue_box.dart';
import 'package:flutter/material.dart';
import '../utils/amount_calc_tile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BillCalculator extends StatefulWidget {
  const BillCalculator({super.key});

  @override
  State<BillCalculator> createState() => _BillCalculatorState();
}

class _BillCalculatorState extends State<BillCalculator> {
  final _controller = TextEditingController();

  final List data = [
    "Farhan Khan",
  ];

  void onSave() {
    setState(() {
      data.add(_controller.text);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createTask() {
    showDialog(
      context: context,
      builder: ((context) {
        return DialogBox(
          controller: _controller,
          onSave: onSave,
          onCancel: () => Navigator.of(context).pop(),
        );
      }),
    );
  }

  void deleteTask(int index) {
    setState(() {
      data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6ECCAF),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
        backgroundColor: Colors.orange[900],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: ((context, index) {
          return AmountCalc(
            name: data[index],
            deleteFunction: (contest) => deleteTask(index),
          );
        }),
      ),
    );
  }
}
